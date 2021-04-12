import 'package:setup_mvvm_architechture/app/app_localization.dart';
import 'package:setup_mvvm_architechture/utils/assets_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'dividers.dart';

enum ProgressDialogType { Normal }

String _dialogMessage = "Loading...";

bool _isShowing = false;
BuildContext? _context, _dismissingContext;
bool _barrierDismissible = true, _showLogs = false;

TextStyle _progressTextStyle = TextStyle(
        color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
    _messageStyle = TextStyle(
        color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600);

double _dialogElevation = 8.0, _borderRadius = 8.0;
Color _backgroundColor = Colors.white;
Curve _insetAnimCurve = Curves.easeInOut;

Widget _progressWidget = Lottie.asset(AssetsUtil.loadingAnimation);

class CustomProgressDialog {
  _Body? _dialog;
  _BodyCustom? _customDialog;

  CustomProgressDialog(BuildContext context,
      {ProgressDialogType? type, bool? isDismissible, bool? showLogs}) {
    _context = context;
    _barrierDismissible = isDismissible ?? true;
    _showLogs = showLogs ?? false;
  }

  void style(
      {double? progress,
      double? maxProgress,
      String? message,
      Widget? progressWidget,
      Color? backgroundColor,
      TextStyle? progressTextStyle,
      TextStyle? messageTextStyle,
      double? elevation,
      double? borderRadius,
      Curve? insetAnimCurve}) {
    if (_isShowing) return;
    _dialogMessage = message ?? _dialogMessage;
    _progressWidget = progressWidget ?? _progressWidget;
    _backgroundColor = backgroundColor ?? _backgroundColor;
    _messageStyle = messageTextStyle ?? _messageStyle;
    _progressTextStyle = progressTextStyle ?? _progressTextStyle;
    _dialogElevation = elevation ?? _dialogElevation;
    _borderRadius = borderRadius ?? _borderRadius;
    _insetAnimCurve = insetAnimCurve ?? _insetAnimCurve;
  }

  void update(
      {double? progress,
      double? maxProgress,
      String? message,
      Widget? progressWidget,
      TextStyle? progressTextStyle,
      TextStyle? messageTextStyle}) {
    _dialogMessage = message ?? _dialogMessage;
    _progressWidget = progressWidget ?? _progressWidget;
    _messageStyle = messageTextStyle ?? _messageStyle;
    _progressTextStyle = progressTextStyle ?? _progressTextStyle;

    if (_isShowing) {
      if (_dialog != null) _dialog!.update();
      if (_customDialog != null) _customDialog!.update();
    }
  }

  bool isShowing() {
    return _isShowing;
  }

  void dismiss() {
    if (_isShowing) {
      try {
        _isShowing = false;
        if (Navigator.of(_dismissingContext!).canPop()) {
          Navigator.of(_dismissingContext!).pop();
          if (_showLogs) debugPrint('ProgressDialog dismissed');
        } else {
          if (_showLogs) debugPrint('Cant pop ProgressDialog');
        }
      } catch (_) {}
    } else {
      if (_showLogs) debugPrint('ProgressDialog already dismissed');
    }
  }

  Future<bool> hide() {
    if (_isShowing) {
      try {
        _isShowing = false;
        Navigator.of(_dismissingContext!).pop(true);
        if (_showLogs) debugPrint('ProgressDialog dismissed');
        return Future.value(true);
      } catch (_) {
        return Future.value(false);
      }
    } else {
      if (_showLogs) debugPrint('ProgressDialog already dismissed');
      return Future.value(false);
    }
  }

  Future<bool> show({String? message, VoidCallback? callback, bool showCloseButton = true}) async {
    if (!_isShowing) {
      try {
        if (message != null) {
          _customDialog = _BodyCustom(message);
        } else {
          _dialog = _Body();
        }
        Widget dialogType;
        if (message == null) {
          dialogType = Dialog(
              backgroundColor: _backgroundColor,
              insetAnimationCurve: _insetAnimCurve,
              insetAnimationDuration: Duration(milliseconds: 100),
              elevation: _dialogElevation,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(_borderRadius))),
              child: _dialog);
        } else if (showCloseButton){
          dialogType = CupertinoAlertDialog(
            title: Text(str(_context!).pleaseWait),
            content: _customDialog,
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text(
                  str(_context!).close,
                ),
                onPressed: () {
                  Navigator.pop(_context!);
                  callback!();
                },
              ),
            ],
          );
        } else {
          dialogType = CupertinoAlertDialog(
            title: Text(str(_context!).pleaseWait),
            content: _customDialog,
          );
        }
        showDialog<dynamic>(
          context: _context!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            _dismissingContext = context;
            return WillPopScope(
              onWillPop: () async => _barrierDismissible,
              child: dialogType,
            );
          },
        );
        await Future.delayed(Duration(milliseconds: 200));
        if (_showLogs) debugPrint('ProgressDialog shown');
        _isShowing = true;
        return true;
      } catch (_) {
        return false;
      }
    } else {
      if (_showLogs) debugPrint("ProgressDialog already shown/showing");
      return false;
    }
  }
}

class _BodyCustom extends StatefulWidget {
  final String message;

  _BodyCustom(this.message);

  _BodyCustomState _dialog = _BodyCustomState();

  update() {
    _dialog.update();
  }

  @override
  State<StatefulWidget> createState() {
    return _dialog;
  }
}

class _BodyCustomState extends State<_BodyCustom> {
  update() {
    setState(() {});
  }

  @override
  void dispose() {
    _isShowing = false;
    if (_showLogs) debugPrint('ProgressDialog dismissed by back button');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          child: Text(
            widget.message,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ),
        Delimiter.width(8),
        SizedBox(
          height: 65,
          child: Container(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 50.0,
              height: 60,
              child: Align(
                alignment: Alignment.centerRight,
                child: _progressWidget,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Body extends StatefulWidget {
  _BodyState _dialog = _BodyState();

  update() {
    _dialog.update();
  }

  @override
  State<StatefulWidget> createState() {
    return _dialog;
  }
}

class _BodyState extends State<_Body> {
  update() {
    setState(() {});
  }

  @override
  void dispose() {
    _isShowing = false;
    if (_showLogs) debugPrint('ProgressDialog dismissed by back button');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Container(
        child: SizedBox(
          width: 80.0,
          height: 80.0,
          child: _progressWidget,
        ),
      ),
    );
  }
}
