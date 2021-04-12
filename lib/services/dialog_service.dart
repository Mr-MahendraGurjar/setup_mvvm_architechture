import 'dart:async';
import 'package:setup_mvvm_architechture/app/app_localization.dart';
import 'package:setup_mvvm_architechture/arch/logger.dart';
import 'package:setup_mvvm_architechture/ui/widgets/dialog/eth_error_dialog.dart';
import 'package:setup_mvvm_architechture/ui/widgets/dialog/logout_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DialogService {
  Function(DialogDataRequest, BuildContext)? _showDialogListener;
  Function(BuildContext, CustomDialogDataRequest)? _showCustomDialogListener;
  Function(BuildContext)? _showProgressDialogListener;
  Function(BuildContext, String, VoidCallback, bool)?
      _showCustomProgressDialogListener;
  Function? _hideProgressDialogListener;

  Completer<DialogResponse>? _dialogCompleter;

  void registerDialogListener(
      Function(DialogDataRequest, BuildContext) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  void registerCustomDialogListener(
      Function(BuildContext, CustomDialogDataRequest) showDialogListener) {
    _showCustomDialogListener = showDialogListener;
  }

  void dialogComplete(DialogResponse response) {
    _dialogCompleter?.complete(response);
    _dialogCompleter = null;
  }

  void registerShowProgressDialogListener(
      Function(BuildContext) progressDialogListener) {
    _showProgressDialogListener = progressDialogListener;
  }

  void registerShowCustomProgressDialogListener(
      Function(BuildContext, String, VoidCallback, bool)
          progressDialogListener) {
    _showCustomProgressDialogListener = progressDialogListener;
  }

  void registerHideProgressDialogListener(Function progressDialogListener) {
    _hideProgressDialogListener = progressDialogListener;
  }

  Future<void> showCustomProgressDialog(
      BuildContext context, String message, VoidCallback callback,
      {bool? showCloseButton}) async {
    await _showCustomProgressDialogListener!(
        context, message, callback, showCloseButton!);
  }

  Future<void> showProgressDialog(BuildContext context) async {
    await _showProgressDialogListener!(context);
  }

  Future<bool> hideProgressDialog() async {
    return Future.delayed(Duration(milliseconds: 200)).then((value) {
      return _hideProgressDialogListener!();
    });
  }

  void showErrorDialog({
    @required BuildContext? context,
    @required String? title,
    @required String? positiveText,
    VoidCallback? positiveAction,
    String? description,
    String? negativeText,
    VoidCallback? negativeAction,
  }) {
    _showBaseDialog(
      context: context!,
      request: DialogDataRequest(
        title: title!,
        description: description!,
        negativeButtonText: negativeText!,
        positiveButtonText: positiveText!,
        negativeButtonTextStyle: TextStyle(color: Colors.orange),
      ),
      negativeAction: negativeAction!,
      positiveAction: positiveAction!,
    );
  }

  void showInfoDialog({
    @required BuildContext? context,
    @required String? title,
    @required String? positiveText,
    VoidCallback? positiveAction,
    String? description,
    String? negativeText,
    VoidCallback? negativeAction,
  }) {
    _showBaseDialog(
      context: context!,
      request: DialogDataRequest(
        title: title!,
        description: description!,
        negativeButtonText: negativeText!,
        positiveButtonText: positiveText!,
      ),
      negativeAction: negativeAction!,
      positiveAction: positiveAction!,
    );
  }

  void showSimpleErrorDialog(BuildContext context, String message) {
    _showBaseDialog(
      context: context,
      request: DialogDataRequest(
        title: str(context).defaultErrorTitle,
        description: message,
        positiveButtonText: str(context).close,
        negativeButtonTextStyle: TextStyle(color: Colors.orange),
      ),
    );
  }

  void showSimpleInfoDialog(
    BuildContext context,
    String message,
  ) {
    _showBaseDialog(
      context: context,
      request: DialogDataRequest(
        title: str(context).defaultInfoTitle,
        description: message,
        positiveButtonText: str(context).close,
        negativeButtonTextStyle: TextStyle(color: Colors.orange),
      ),
    );
  }

  void showConnectionErrorDialog({
    @required BuildContext? context,
    VoidCallback? positiveAction,
  }) async {
    await hideProgressDialog();
    if (_dialogCompleter == null) {
      Logger.logTag(this.runtimeType, "_dialogCompleter: ${_dialogCompleter}");
      var dialogResult = await _showCustomDialog(
        context!,
        CustomDialogDataRequest(
          child: EthErrorDialog(),
        ),
      );
      if (dialogResult.action == DialogAction.ACTION_POSITIVE) {
        if (positiveAction != null) positiveAction();
      }
    }
  }

  void showLogoutDialog({
    @required BuildContext? context,
    @required VoidCallback? positiveAction,
    @required VoidCallback? negativeAction,
  }) async {
    if (_dialogCompleter == null) {
      var dialogResult = await _showCustomDialog(
        context!,
        CustomDialogDataRequest(
          child: Container(
              margin: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 2 * 0.5,
                  left: MediaQuery.of(context).size.width / 2 * 0.5),
              width: 500,
              child: LogoutDialog()),
        ),
      );
      if (dialogResult.action == DialogAction.ACTION_POSITIVE) {
        if (positiveAction != null) positiveAction();
      } else {
        if (negativeAction != null) negativeAction();
      }
    }
  }

  void _showBaseDialog({
    DialogDataRequest? request,
    VoidCallback? positiveAction,
    VoidCallback? negativeAction,
    @required BuildContext? context,
  }) async {
    var dialogResult = await _showDefaultDialog(request!, context!);
    if (dialogResult.action == DialogAction.ACTION_POSITIVE) {
      if (positiveAction != null) positiveAction();
    } else {
      if (negativeAction != null) negativeAction();
    }
  }

  Future<DialogResponse> _showDefaultDialog(
      DialogDataRequest dialogRequest, BuildContext context) {
    _dialogCompleter = Completer<DialogResponse>();
    _showDialogListener!(dialogRequest, context);
    return _dialogCompleter!.future;
  }

  Future<DialogResponse> _showCustomDialog(
      BuildContext context, CustomDialogDataRequest type) {
    _dialogCompleter = Completer<DialogResponse>();
    _showCustomDialogListener!(context, type);
    return _dialogCompleter!.future;
  }
}

enum DialogAction { ACTION_POSITIVE, ACTION_NEGATIVE }

enum CustomDialogType { OFFLINE, VISIT_NOT_COMPLETED }

class DialogResponse {
  final DialogAction? action;

  DialogResponse({this.action});
}

class DialogDataRequest {
  String? title;
  String? description;
  String? positiveButtonText;
  String? negativeButtonText;
  final TextStyle? positiveButtonTextStyle;
  final TextStyle? negativeButtonTextStyle;
  bool barrierDismissible;

  DialogDataRequest({
    @required this.title,
    this.description,
    @required this.positiveButtonText,
    this.negativeButtonText,
    this.positiveButtonTextStyle,
    this.negativeButtonTextStyle,
    this.barrierDismissible = true,
  });
}

class CustomDialogDataRequest {
  final Widget? child;

  CustomDialogDataRequest({this.child});
}
