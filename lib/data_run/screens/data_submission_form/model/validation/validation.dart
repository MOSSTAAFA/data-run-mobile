class ValidationResult {
  final bool isValid;
  final String? errorMessage;

  ValidationResult({required this.isValid, this.errorMessage});
}

class FormFieldValidator {
  final String fieldName;
  final List<ValidationFunction> validations;

  FormFieldValidator({
    required this.fieldName,
    required this.validations,
  });

  ValidationResult validate(String value) {
    for (var validation in validations) {
      final result = validation(value);
      if (!result.isValid) {
        return result;
      }
    }
    return ValidationResult(isValid: true);
  }
}

typedef ValidationFunction = ValidationResult Function(String value);

ValidationResult requiredField(String value) {
  return value.isEmpty
      ? ValidationResult(isValid: false, errorMessage: 'This field is required')
      : ValidationResult(isValid: true);
}

ValidationFunction minLength(int minLength) {
  return (String value) {
    return value.length < minLength
        ? ValidationResult(isValid: false, errorMessage: 'Minimum length is $minLength')
        : ValidationResult(isValid: true);
  };
}

ValidationResult emailFormat(String value) {
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  return emailRegex.hasMatch(value)
      ? ValidationResult(isValid: true)
      : ValidationResult(isValid: false, errorMessage: 'Invalid email format');
}
