class ValidatorResult {
  List<String> errors = <String>[];

  ValidatorResult(this.errors);

  ValidatorResult.success() {
    errors.clear();
  }

  bool isValid() => errors.isEmpty;

  String asMessage() {
    String message = '';
    if (errors == null || errors.isEmpty) {
      return message;
    }

    for (var i = 0; i < errors.length; i++) {
      message += errors[i];
      if (i < errors.length - 1) {
        message += '\n';
      }
    }
    return message;
  }
}
