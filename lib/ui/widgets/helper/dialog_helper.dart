import 'package:setup_mvvm_architechture/app/service_locator_provider.dart';
import 'package:setup_mvvm_architechture/services/dialog_service.dart';
import 'package:setup_mvvm_architechture/ui/widgets/progress_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogHelper extends StatefulWidget {
  final Widget? child;

  DialogHelper({Key? key, this.child}) : super(key: key);

  _DialogHelperState createState() => _DialogHelperState();
}

class _DialogHelperState extends State<DialogHelper> {
  CustomProgressDialog? _progressDialog;

  @override
  void initState() {
    super.initState();
    dialogService().registerDialogListener(_showDialog);
    dialogService().registerCustomDialogListener(_showCustomDialog);
    dialogService().registerShowProgressDialogListener(_showProgressDialog);
    dialogService()
        .registerShowCustomProgressDialogListener(_showCustomProgressDialog);
    dialogService().registerHideProgressDialogListener(_hideProgress);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }

  @override
  void dispose() {
    super.dispose();
    _disposeProgressDialog();
  }

  Future<void> _showProgressDialog(BuildContext context) async {
    if (_progressDialog != null) {
      _disposeProgressDialog();
    }
    _progressDialog = CustomProgressDialog(
      context,
      isDismissible: false,
    )..style(
        elevation: 0,
        backgroundColor: Colors.transparent,
      );
    await _progressDialog?.show();
  }

  Future<void> _showCustomProgressDialog(
      BuildContext context, String message, VoidCallback callback, bool showCloseButton) async {
    if (_progressDialog != null) {
      _disposeProgressDialog();
    }
    _progressDialog = CustomProgressDialog(
      context,
      isDismissible: false,
    )..style(
        elevation: 0,
        backgroundColor: Colors.transparent,
      );
    await _progressDialog?.show(message: message, callback: callback, showCloseButton: showCloseButton);
  }

  Future<bool> _hideProgress() async {
    if (_progressDialog == null) return Future.value(true);
    if (!_progressDialog!.isShowing()) return Future.value(true);
    return _progressDialog!.hide();
  }

  void _disposeProgressDialog() {
    _progressDialog?.dismiss();
    _progressDialog = null;
  }

  void _showDialog(DialogDataRequest request, BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: request.barrierDismissible,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(request.title!),
        content: request.description != null ? Text(request.description!) : null,
        actions: <Widget>[
          if (request.negativeButtonText != null)
            CupertinoDialogAction(
              child: Text(
                request.negativeButtonText!,
                style: request.negativeButtonTextStyle,
              ),
              onPressed: () {
                dialogService().dialogComplete(
                  DialogResponse(action: DialogAction.ACTION_NEGATIVE),
                );
                Navigator.pop(context);
              },
            ),
          if (request.positiveButtonText != null)
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text(
                request.positiveButtonText!,
                style: request.positiveButtonTextStyle,
              ),
              onPressed: () {
                dialogService().dialogComplete(
                  DialogResponse(action: DialogAction.ACTION_POSITIVE),
                );
                Navigator.pop(context);
              },
            ),
        ],
      ),
    );
  }

  void _showCustomDialog(
      BuildContext context, CustomDialogDataRequest request) async {
    showDialog<dynamic>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              viewInsets: EdgeInsets.symmetric(
                horizontal: -16,
              ),
            ),
            child: Dialog(
              backgroundColor: Colors.transparent,
              insetAnimationCurve: Curves.easeInOut,
              insetAnimationDuration: Duration(milliseconds: 100),
              elevation: 8.0,
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  request.child!,
                ],
              ),
            ),
          ),
        );
      },
    );
    await Future.delayed(Duration(milliseconds: 200));
  }
}
