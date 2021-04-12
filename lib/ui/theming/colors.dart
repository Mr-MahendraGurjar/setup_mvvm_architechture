import 'dart:ui';

class AppColorScheme {
  static const Color pink = const Color(0xFFD80056);
  static const Color pink1 = const Color(0xFFB30047);
  static const Color pink2 = const Color(0xFFF196B6);
  static const Color pink3 = const Color(0xFFFFEAF2);
  static const Color red = const Color(0xFFAB004F);
  static const Color grey = const Color(0xFFDEDEDE);
  static const Color grey1 = const Color(0xFFACB2B6);
  static const Color grey2 = const Color(0xFFF0F0F0);
  static const Color grey3 = const Color(0xFFEEEEEE);
  static const Color grey4 = const Color(0xFFDADADA);
  static const Color grey5 = const Color(0xFFCDCDCD);
  static const Color greyDark = const Color(0xFF2F3E48);
  static const Color black = const Color(0xFF1C1C1C);
  static const Color white = const Color(0xFFFFFFFF);
}

class AppColors {
  Color get primary => AppColorScheme.pink;
  Color get primaryTextColorDark => AppColorScheme.greyDark;
  Color get primaryTextColor => AppColorScheme.greyDark.withOpacity(0.8);
  Color get primaryTextColorLight => primaryTextColorDark.withOpacity(0.4);
  Color get primaryBackgroundColor => AppColorScheme.white;

  Color get editBorderColor => AppColorScheme.grey;
  Color get editTextColor => AppColorScheme.black.withOpacity(0.8);
  Color get inkWellHighlights => AppColorScheme.pink.withOpacity(0.05);
  Color get white => AppColorScheme.white;
  Color get black => AppColorScheme.black;
  Color get disabledText => AppColorScheme.grey1;
  Color get disabledTextLight => AppColorScheme.grey1.withOpacity(0.8);
  Color get disabledBtnColor => AppColorScheme.pink2;

  Color get btnHighlightColorDark => AppColorScheme.pink1;
  Color get btnSplashColorColorDark => AppColorScheme.pink1;
  Color get btnHighlightColorLight => AppColorScheme.pink3;
  Color get btnSplashColorColorLight => AppColorScheme.pink3;
  Color get checkBoxBorderColor => AppColorScheme.grey1;
  Color get errorColor => AppColorScheme.red;
  Color get blockDivider => AppColorScheme.grey2;
  Color get roundedCheckBoxColor => AppColorScheme.grey3;
  Color get emptyResultsTextColor => AppColorScheme.grey4;
  Color get ethErrorColor => AppColorScheme.grey5;
}
