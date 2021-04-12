import 'package:setup_mvvm_architechture/app/app_localization.dart';
import 'package:setup_mvvm_architechture/app/service_locator_provider.dart';
import 'package:setup_mvvm_architechture/ui/theming/decorations.dart';
import 'package:setup_mvvm_architechture/ui/theming/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatefulWidget {
  @override
  _CustomTextFieldWidgetState createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
            // focusNode: _companyCodeFocus,
            decoration: DefaultInputDecoration(
              labelText: str(context).companyCodeHint,
            ),
            keyboardType: TextInputType.text,
            style: AppTextStyles.n18(
              colors().editTextColor,
            ),
            // validator: (value) => ,
            // onSaved: (value) =>
            //     viewModel!.companyCode = value!.trim(),
          );
  }
}