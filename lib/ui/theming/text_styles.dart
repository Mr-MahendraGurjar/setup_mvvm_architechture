import 'package:setup_mvvm_architechture/utils/assets_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextStyles extends TextStyle {
  static double? _textSize;
  static FontWeight? _fontWeight;
  static Color? _fontColor;

  factory AppTextStyles.n14(Color color) {
    _fontColor = color;
    _textSize = 14.0;
    _fontWeight = FontWeight.normal;
    return AppTextStyles();
  }

  factory AppTextStyles.n14fw600(Color color) {
    _fontColor = color;
    _textSize = 14.0;
    _fontWeight = FontWeight.w600;
    return AppTextStyles();
  }

  factory AppTextStyles.n16(Color color) {
    _fontColor = color;
    _textSize = 16.0;
    _fontWeight = FontWeight.normal;
    return AppTextStyles();
  }

  factory AppTextStyles.n16fw600(Color color) {
    _fontColor = color;
    _textSize = 16.0;
    _fontWeight = FontWeight.w600;
    return AppTextStyles();
  }

  factory AppTextStyles.n18(Color color) {
    _fontColor = color;
    _textSize = 18.0;
    _fontWeight = FontWeight.normal;
    return AppTextStyles();
  }

  factory AppTextStyles.n18fw600(Color color) {
    _fontColor = color;
    _textSize = 18.0;
    _fontWeight = FontWeight.w600;
    return AppTextStyles();
  }

  factory AppTextStyles.n24(Color color) {
    _fontColor = color;
    _textSize = 24.0;
    _fontWeight = FontWeight.normal;
    return AppTextStyles();
  }

  factory AppTextStyles.n24fw600(Color color) {
    _fontColor = color;
    _textSize = 24.0;
    _fontWeight = FontWeight.w600;
    return AppTextStyles();
  }

  factory AppTextStyles.b20(Color color) {
    _fontColor = color;
    _textSize = 20.0;
    _fontWeight = FontWeight.bold;
    return AppTextStyles();
  }

  AppTextStyles()
      : super(
          color: _fontColor,
          fontSize: _textSize,
          fontWeight: _fontWeight,
          fontFamily: AssetsUtil.fontProximaNova,
        );

  factory AppTextStyles.labelText() {
    _fontColor = Colors.black;
    _textSize = 16.0;
    _fontWeight = FontWeight.w400;
    return AppTextStyles();
  }

  factory AppTextStyles.formHeaders() {
    _fontColor = Colors.black54;
    _textSize = 24.0;
    _fontWeight = FontWeight.bold;
    return AppTextStyles();
  }

  factory AppTextStyles.formSubHeaders() {
    _fontColor = Colors.black54;
    _textSize = 18.0;
    _fontWeight = FontWeight.bold;
    return AppTextStyles();
  }

  factory AppTextStyles.formQuestion() {
    _fontColor = Colors.black54;
    _textSize = 18.0;
    _fontWeight = FontWeight.normal;
    return AppTextStyles();
  }
}
