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

import '../../../main.dart';
import '../../../main/l10n/app_localizations.dart';
import 'failures/field_mask_failure.dart';

class FieldErrorMessageProvider {
  const FieldErrorMessageProvider();

  String getFriendlyErrorMessage(Exception error) {
    return AppLocalization.of(navigatorKey.currentContext!)!
        .lookup(_parseErrorToMessage(error));
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
    if (error is IntegerZeroOrPositiveFailure)
      return _getIntegerZeroOrPositiveError(error);
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
    return error.when(
        oneIsNotTrueException: (_, __) => 'error_true_only_one_is_not_true',
        falseIsNotAValidValueException: (_, __) =>
            'error_true_only_false_not_valid',
        booleanMalformedException: (_, __) => 'error_true_only_malformed');
  }

  String _getTextError(TextFailure error) {
    return error.when(tooLargeTextException: (_, __) => 'error_text_too_long');
  }

  String _getLetterError(LetterFailure error) {
    return error.when(
        stringIsNotALetterException: (_, __) => 'error_letter_not_a_letter',
        moreThanOneLetterException: (_, __) => 'error_letter_more_than_one',
        emptyStringException: (_, __) => 'error_letter_empty');
  }

  String _getTimeError(TimeFailure error) {
    return error.when(parseException: (_, __) => 'error_time_parsing');
  }

  String _getDateTimeError(DateTimeFailure error) {
    return error.when(parseException: (_, __) => 'error_date_time_parsing');
  }

  String _getDateError(DateFailure error) {
    return error.when(parseException: (_, __) => 'error_date_parsing');
  }

  String _getBooleanError(BooleanFailure error) {
    return error.when(
        oneIsNotTrueException: (_, __) => 'error_boolean_one_is_not_true',
        zeroIsNotFalseException: (_, __) => 'error_boolean_zero_is_not_false',
        booleanMalformedException: (_, __) => 'error_boolean_malformed');
  }

  String _getCoordinateError(CoordinateFailure error) {
    return error.when(coordinateMalformedException: (_, __) => 'wrong_pattern');
  }

  String _getFieldMaskError(FieldMaskFailure error) {
    return error.when(
        wrongPatternException: (_, __) => 'wrong_pattern',
        invalidPatternException: (_, __) => 'pattern_error');
  }

  String _getPhoneNumberError(PhoneNumberFailure error) {
    return error.when(
        malformedPhoneNumberException: (_, __) => 'invalid_phone_number');
  }

  String _getEmailError(EmailFailure error) {
    return error.when(malformedEmailException: (_, __) => 'invalid_email');
  }

  String _getIntegerNegativeError(IntegerNegativeFailure error) {
    return error.when(
        numberFormatException: (_, __) => 'formatting_error',
        integerOverflow: (_, __) => 'formatting_error',
        valueIsZero: (_, __) => 'invalid_negative_number',
        valueIsPositive: (_, __) => 'invalid_negative_number',
        leadingZeroException: (_, __) => 'leading_zero_error');
  }

  String _getIntegerZeroOrPositiveError(IntegerZeroOrPositiveFailure error) {
    return error.when(
        numberFormatException: (_, __) => 'formatting_error',
        integerOverflow: (_, __) => 'formatting_error',
        valueIsNegative: (_, __) => 'invalid_positive_zero',
        leadingZeroException: (_, __) => 'leading_zero_error');
  }

  String _getIntegerPositiveError(IntegerPositiveFailure error) {
    return error.when(
        numberFormatException: (_, __) => 'formatting_error',
        integerOverflow: (_, __) => 'formatting_error',
        valueIsZero: (_, __) => 'invalid_positive',
        valueIsNegative: (_, __) => 'invalid_positive',
        leadingZeroException: (_, __) => 'leading_zero_error');
  }

  String _getUnitIntervalFailure(UnitIntervalFailure error) {
    return error.when(
        scientificNotationException: (_, __) => 'formatting_error',
        numberFormatException: (_, __) => 'formatting_error',
        greaterThanOneException: (_, __) => 'invalid_interval',
        smallerThanZeroException: (_, __) => 'invalid_interval');
  }

  String _getPercentageError(PercentageFailure error) {
    return error.when(
        numberFormatException: (_, __) => 'formatting_error',
        valueGreaterThan100: (_, __) => 'invalid_percentage',
        valueIsNegative: (_, __) => 'invalid_positive');
  }

  String _getUrlError(UrlFailure error) {
    return error.when(malformedUrlException: (_, __) => 'validation_url');
  }

  String _getIntegerError(IntegerFailure error) {
    return error.when(
        numberFormatException: (_, __) => 'invalid_integer',
        integerOverflow: (_, __) => 'formatting_error',
        leadingZeroException: (_, __) => 'leading_zero_error');
  }

  String _getNumberError(NumberFailure error) {
    return error.when(
        scientificNotationException: (_, __) => 'formatting_error',
        numberFormatException: (_, __) => 'formatting_error',
        leadingZeroException: (_, __) => 'leading_zero_error');
  }

  String mandatoryWarning() {
    return AppLocalization.of(navigatorKey.currentContext!)!
        .lookup('field_is_mandatory');
  }

  String defaultValidationErrorMessage() {
    return AppLocalization.of(navigatorKey.currentContext!)!
        .lookup('validation_error_message');
  }
}
