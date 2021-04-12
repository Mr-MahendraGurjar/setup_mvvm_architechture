import 'package:setup_mvvm_architechture/app/service_locator_provider.dart';
import 'package:setup_mvvm_architechture/ui/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppButton extends StatelessWidget {
  static final double kDefaultButtonHeight = 48.0;
  double _btnHeight = AppButton.kDefaultButtonHeight;

  final RoundedRectangleBorder _btnBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4.0),
  );

  TextStyle get darkBtnTextStyle => AppTextStyles.n16fw600(colors().white);

  TextStyle get lightBtnTextStyle => AppTextStyles.n16fw600(colors().primary);

  String? _title;
  VoidCallback? _onPressed;
  Color? _btnColor;
  TextStyle? _btnTextStyle;
  bool _buttonEnabled = true;

  Widget? _child;
  Widget? _mainChild;

  AppButton._();

  AppButton.dark({
    @required String? title,
    @required VoidCallback? onPressed,
    Widget? childWidget,
    bool buttonEnabled = true,
  }) {
    _buttonEnabled = buttonEnabled;
    _title = title;
    _onPressed = onPressed;
    _btnColor = Colors.amber;
    _btnTextStyle = darkBtnTextStyle;
    _child = childWidget == null ? _buildDefaultContent() : childWidget;
    _mainChild = _buildFlatButton();
  }

  AppButton.light({
    @required String? title,
    @required VoidCallback? onPressed,
    Widget? childWidget,
    bool buttonEnabled = true,
  }) {
    _buttonEnabled = buttonEnabled;
    _title = title;
    _onPressed = onPressed;
    _btnColor = colors().white;
    _btnTextStyle = lightBtnTextStyle;
    _child = childWidget == null ? _buildDefaultContent() : childWidget;
    _mainChild = _buildOutlineButton();
  }

  Widget _buildDefaultContent() => Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            _title!,
            textAlign: TextAlign.center,
            style: _btnTextStyle,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => _mainChild!;

  Widget _buildFlatButton() => FlatButton(
        onPressed: _buttonEnabled ? _onPressed : null,
        child: Container(
          height: _btnHeight,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: double.infinity),
            child: _child,
          ),
        ),
        color: _btnColor,
        shape: _btnBorder,
        highlightColor: colors().btnHighlightColorDark,
        splashColor: colors().btnSplashColorColorDark,
        disabledColor: colors().disabledBtnColor,
      );

  Widget _buildOutlineButton() => OutlineButton(
        onPressed: _buttonEnabled ? _onPressed : null,
        child: Container(
          height: _btnHeight,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: double.infinity),
            child: _child,
          ),
        ),
        color: _btnColor,
        shape: _btnBorder,
        borderSide: BorderSide(color: colors().primary),
        highlightedBorderColor: colors().primary,
        highlightColor: colors().btnHighlightColorLight,
        splashColor: colors().btnSplashColorColorLight,
      );
}
