import 'package:setup_mvvm_architechture/app/app_localization.dart';
import 'package:setup_mvvm_architechture/arch/base_value_validator.dart';
import 'package:setup_mvvm_architechture/arch/validator_result.dart';
import 'package:flutter/widgets.dart';

class UserNameValidator extends BaseValueValidator<String> {
  @override
  ValidatorResult validate(BuildContext context, String value) {
    var errors = <String>[];
    if (value == null || value.trim().isEmpty) {
      errors.add(str(context).userNameEmptyValidatorErrorText);
      return ValidatorResult(errors);
    }
    if (validateEmail(value.trim()) || value.trim().length > 50) {
      errors.add(str(context).userNameNotValidValidatorErrorText);
      return ValidatorResult(errors);
    }
    return ValidatorResult.success();
  }

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern.toString());
    return !regex.hasMatch(value);
  }
}
