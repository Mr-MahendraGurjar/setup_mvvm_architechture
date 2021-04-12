import 'package:setup_mvvm_architechture/app/app_localization.dart';
import 'package:setup_mvvm_architechture/arch/base_value_validator.dart';
import 'package:setup_mvvm_architechture/arch/validator_result.dart';
import 'package:flutter/widgets.dart';

class PasswordValidator extends BaseValueValidator<String> {
  @override
  ValidatorResult validate(BuildContext context, String value) {
    var errors = <String>[];
    if (value == null || value.trim().isEmpty) {
      errors.add(str(context).passwordEmptyValidatorErrorText);
      return ValidatorResult(errors);
    }
    return ValidatorResult.success();
  }
}
