import 'package:d2_remote/core/common/value_type/failures/boolean_failure.dart';
import 'package:d2_remote/core/common/value_type/failures/coordinate_failure.dart';
import 'package:d2_remote/core/common/value_type/failures/date_failure.dart';
import 'package:d2_remote/core/common/value_type/failures/date_time_failure.dart';
import 'package:d2_remote/core/common/value_type/failures/email_failure.dart';
import 'package:d2_remote/core/common/value_type/failures/integer_failure.dart';
import 'package:d2_remote/core/common/value_type/failures/integer_negative_failure.dart';
import 'package:d2_remote/core/common/value_type/failures/integer_positive_failure.dart';
import 'package:d2_remote/core/common/value_type/failures/integer_zero_or_positive_failure.dart';
import 'package:d2_remote/core/common/value_type/failures/letter_failure.dart';
import 'package:d2_remote/core/common/value_type/failures/number_failure.dart';
import 'package:d2_remote/core/common/value_type/failures/percentage_failure.dart';
import 'package:d2_remote/core/common/value_type/failures/phone_number_failure.dart';
import 'package:d2_remote/core/common/value_type/failures/text_failure.dart';
import 'package:d2_remote/core/common/value_type/failures/time_failure.dart';
import 'package:d2_remote/core/common/value_type/failures/true_only_failure.dart';
import 'package:d2_remote/core/common/value_type/failures/unit_interval_failure.dart';
import 'package:d2_remote/core/common/value_type/failures/url_failure.dart';
import 'package:flutter/cupertino.dart';
import 'package:mass_pro/form/ui/validation/failures/field_mask_failure.dart';
import 'package:mass_pro/main/l10n/app_localizations.dart';

class FieldErrorMessageProvider {
  BuildContext context;

  FieldErrorMessageProvider(this.context);

  String getFriendlyErrorMessage(Exception error) {
    return AppLocalization.of(context)!.lookup(
        _parseErrorToMessage(error));
  }

  String _parseErrorToMessage(Exception error) {
    if (error is BooleanFailure) return _getBooleanError(error);
    if (error is DateFailure) return _getDateError(error);
    if (error is DateTimeFailure) return _getDateTimeError(error);
    if (error is LetterFailure) return _getLetterError(error);
    if (error is TextFailure) return _getTextError(error);
    if (error is TimeFailure) return _getTimeError(error);
    if (error is TrueOnlyFailure) return _getTrueOnlyError(error);
    if (error is PhoneNumberFailure) return _getPhoneNumberError(error);
    if (error is EmailFailure) return _getEmailError(error);
    if (error is IntegerNegativeFailure) return _getIntegerNegativeError(error);
    if (error is IntegerZeroOrPositiveFailure) return _getIntegerZeroOrPositiveError(error);
    if (error is IntegerPositiveFailure) return _getIntegerPositiveError(error);
    if (error is UnitIntervalFailure) return _getUnitIntervalFailure(error);
    if (error is PercentageFailure) return _getPercentageError(error);
    if (error is UrlFailure) return _getUrlError(error);
    if (error is IntegerFailure) return _getIntegerError(error);
    if (error is NumberFailure) return _getNumberError(error);
    if (error is FieldMaskFailure) return _getFieldMaskError(error);
    if (error is CoordinateFailure) return _getCoordinateError(error);
    return 'invalid_field';
  }

  String _getTrueOnlyError(TrueOnlyFailure error) {
    return error.when(oneIsNotTrueException: (_) => 'error_true_only_one_is_not_true',
        falseIsNotAValidValueException: (_) => 'error_true_only_false_not_valid',
        booleanMalformedException: (_) => 'error_true_only_malformed');
  }

  String _getTextError(TextFailure error) {
    return error.when(tooLargeTextException: (_) => 'error_text_too_long');
  }

  String _getLetterError(LetterFailure error) {
    return error.when(
        stringIsNotALetterException: (_) => 'error_letter_not_a_letter',
        moreThanOneLetterException: (_) => 'error_letter_more_than_one',
        emptyStringException: (_) => 'error_letter_empty');
  }

  String _getTimeError(TimeFailure error) {
    return error.when(parseException: (_) => 'error_time_parsing');
  }

  String _getDateTimeError(DateTimeFailure error) {
    return error.when(parseException: (_) => 'error_date_time_parsing');
  }

  String _getDateError(DateFailure error) {
    return error.when(parseException: (_) => 'error_date_parsing');
  }

  String _getBooleanError(BooleanFailure error) {
    return error.when(
        oneIsNotTrueException: (_) => 'error_boolean_one_is_not_true',
        zeroIsNotFalseException: (_) => 'error_boolean_zero_is_not_false',
        booleanMalformedException: (_) => 'error_boolean_malformed');
  }

  String _getCoordinateError(CoordinateFailure error) {
    return error.when(coordinateMalformedException: (_) => 'wrong_pattern');
  }

  String _getFieldMaskError(FieldMaskFailure error) {
    return error.when(
        wrongPatternException: (_) => 'wrong_pattern',
        invalidPatternException: (_) => 'pattern_error');
  }

  String _getPhoneNumberError(PhoneNumberFailure error) {
    return error.when(
        malformedPhoneNumberException: (_) => 'invalid_phone_number');
  }

  String _getEmailError(EmailFailure error) {
    return error.when(malformedEmailException: (_) => 'invalid_email');
  }

  String _getIntegerNegativeError(IntegerNegativeFailure error) {
    return error.when(
        numberFormatException: (_) => 'formatting_error',
        integerOverflow: (_) => 'formatting_error',
        valueIsZero: (_) => 'invalid_negative_number',
        valueIsPositive: (_) => 'invalid_negative_number',
        leadingZeroException: (_) => 'leading_zero_error');
  }

  String _getIntegerZeroOrPositiveError(IntegerZeroOrPositiveFailure error) {
    return error.when(
        numberFormatException: (_) => 'formatting_error',
        integerOverflow: (_) => 'formatting_error',
        valueIsNegative: (_) => 'invalid_positive_zero',
        leadingZeroException: (_) => 'leading_zero_error');
  }

  String _getIntegerPositiveError(IntegerPositiveFailure error) {
    return error.when(
        numberFormatException: (_) => 'formatting_error',
        integerOverflow: (_) => 'formatting_error',
        valueIsZero: (_) => 'invalid_positive',
        valueIsNegative: (_) => 'invalid_positive',
        leadingZeroException: (_) => 'leading_zero_error');
  }

  String _getUnitIntervalFailure(UnitIntervalFailure error) {
    return error.when(
        scientificNotationException: (_) => 'formatting_error',
        numberFormatException: (_) => 'formatting_error',
        greaterThanOneException: (_) => 'invalid_interval',
        smallerThanZeroException: (_) => 'invalid_interval');
  }

  String _getPercentageError(PercentageFailure error) {
    return error.when(
        numberFormatException: (_) => 'formatting_error',
        valueGreaterThan100: (_) => 'invalid_percentage',
        valueIsNegative: (_) => 'invalid_positive');
  }

  String _getUrlError(UrlFailure error) {
    return error.when(malformedUrlException: (_) => 'validation_url');
  }

  String _getIntegerError(IntegerFailure error) {
    return error.when(
        numberFormatException: (_) => 'invalid_integer',
        integerOverflow: (_) => 'formatting_error',
        leadingZeroException: (_) => 'leading_zero_error');
  }

  String _getNumberError(NumberFailure error) {
    return error.when(
        scientificNotationException: (_) => 'formatting_error',
        numberFormatException: (_) => 'formatting_error',
        leadingZeroException: (_) => 'leading_zero_error');
  }

  String mandatoryWarning() {
    return AppLocalization.of(context)!.lookup('field_is_mandatory');
  }

  String defaultValidationErrorMessage() {
    return AppLocalization.of(context)!.lookup('validation_error_message');
  }
}