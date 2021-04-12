import 'package:setup_mvvm_architechture/app/app_localization.dart';
import 'package:setup_mvvm_architechture/arch/base_value_validator.dart';
import 'package:flutter/widgets.dart';
import 'package:setup_mvvm_architechture/arch/validator_result.dart';

class CompanyCodeValidator extends BaseValueValidator<String> {
  @override
  ValidatorResult validate(BuildContext context, String value) {
    var errors = <String>[];
    if (value == null || value.trim().isEmpty) {
      errors.add(str(context).companyCodeEmptyValidatorErrorText);
      return ValidatorResult(errors);
    }
    if (value.trim().length < 3 || value.trim().length > 25) {
      errors.add(str(context).companyCodeNotValidValidatorErrorText);
      return ValidatorResult(errors);
    }
    return ValidatorResult.success();
  }
}
