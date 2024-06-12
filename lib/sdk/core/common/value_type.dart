import 'package:mass_pro/sdk/core/common/value_type/validators/validators.dart';

import 'exception/exception.dart';

enum ValueType {
  TEXT(TextValidator()),
  LONG_TEXT(LongTextValidator()),
  LETTER(LetterValidator()),
  PHONE_NUMBER(PhoneNumberValidator()),
  EMAIL(EmailValidator()),
  BOOLEAN(BooleanValidator()),
  TRUE_ONLY(TrueOnlyValidator()),
  DATE(DateValidator()),
  DATETIME(DateTimeValidator()),
  TIME(TimeValidator()),
  NUMBER(NumberValidator()),
  UNIT_INTERVAL(UnitIntervalValidator()),
  PERCENTAGE(PercentageValidator()),
  INTEGER(IntegerValidator()),
  INTEGER_POSITIVE(IntegerPositiveValidator()),
  INTEGER_NEGATIVE(IntegerNegativeValidator()),
  INTEGER_ZERO_OR_POSITIVE(IntegerZeroOrPositiveValidator()),
  TRACKER_ASSOCIATE(UidValidator()),
  USERNAME(TextValidator()),
  COORDINATE(CoordinateValidator()),
  ORGANISATION_UNIT(UidValidator()),
  REFERENCE(TextValidator()),
  AGE(DateValidator()),
  URL(TextValidator()),
  FILE_RESOURCE(UidValidator()),
  IMAGE(UidValidator()),
  GEOJSON(TextValidator());

  const ValueType(this._validator);

  final ValueTypeValidator<ThrowableException> _validator;

  ValueTypeValidator<ThrowableException> get validator => _validator;

  static List<ValueType> get INTEGER_TYPES =>
      [INTEGER, INTEGER_POSITIVE, INTEGER_NEGATIVE, INTEGER_ZERO_OR_POSITIVE];

  static List<ValueType> get NUMERIC_TYPES => [
        INTEGER,
        NUMBER,
        INTEGER_POSITIVE,
        INTEGER_NEGATIVE,
        INTEGER_ZERO_OR_POSITIVE,
        UNIT_INTERVAL,
        PERCENTAGE
      ];

  static List<ValueType> get BOOLEAN_TYPES => [BOOLEAN, TRUE_ONLY];

  static List<ValueType> get TEXT_TYPES =>
      [TEXT, LONG_TEXT, LETTER, COORDINATE, TIME];

  static List<ValueType> get DATE_TYPES => [DATE, DATETIME];

  static List<ValueType> get FILE_TYPES => [IMAGE, FILE_RESOURCE];

  bool get isInteger => INTEGER_TYPES.contains(this);

  bool get isNumeric => NUMERIC_TYPES.contains(this);

  bool get isBoolean => BOOLEAN_TYPES.contains(this);

  bool get isText => TEXT_TYPES.contains(this);

  bool get isDate => DATE_TYPES.contains(this);

  bool get isFile => FILE_TYPES.contains(this);

  bool get isCoordinate => this == COORDINATE;

  static ValueType? valueOf(String? str) =>
      ValueType.values.firstWhere((e) => e.toString() == 'ValueType.' + '$str',
          orElse: () => throw ArgumentError(
              'ValueTypeOfString There is no ValueType of Type: $str'));
}
