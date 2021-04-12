import 'package:setup_mvvm_architechture/app/service_locator_provider.dart';
import 'package:flutter/material.dart';

import '../theming/text_styles.dart';

class DefaultInputDecoration extends InputDecoration {
  DefaultInputDecoration({
    String? labelText,
    String hintText = '',
    Icon? suffixIcon,
    EdgeInsets contentPadding = const EdgeInsets.all(14),
  }) : super(
          labelText: labelText,
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle: AppTextStyles.n18(colors().primaryTextColorLight),
          contentPadding: contentPadding,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colors().editBorderColor,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colors().editBorderColor,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          errorStyle: AppTextStyles.n16(colors().errorColor),
          errorMaxLines: 2,
        );
}
