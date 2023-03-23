import 'package:d2_remote/core/common/value_type/validators/value_type_validator.dart';
import 'package:dartz/dartz.dart';
import 'package:mass_pro/form/ui/validation/failures/field_mask_failure.dart';

class FieldMaskValidator extends ValueTypeValidator<FieldMaskFailure> {
  String? fieldMask;

  FieldMaskValidator(this.fieldMask);

  String? get formattedFieldMask => null; //fieldMask?.removeSurrounding("\'")

  Either<FieldMaskFailure, String?> validateNullSafe(String? value) {
    return value != null ? validate(value) : right(value);
  }

  @override
  Either<FieldMaskFailure, String> validate(String value) {
    return right(value);
    // implement later
    // if (formattedFieldMask?.isNullOrEmpty() == true || value.isEmpty) {
    //   return right(value);
    // } else if (value == '1') {
    //       return left(const BooleanFailure.oneIsNotTrueException());
    //     } else if (value == 'true' || value == 'false') {
    //       return right(value);
    //     } else {
    //       return left(const BooleanFailure.booleanMalformedException());
    //     }
  }
}
