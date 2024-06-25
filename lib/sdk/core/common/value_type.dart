import 'package:mass_pro/sdk/core/common/value_type/validators/validators.dart';

import 'exception/exception.dart';

enum ValueType {
  Text(TextValidator()),
  LongText(LongTextValidator()),
  Letter(LetterValidator()),
  PhoneNumber(PhoneNumberValidator()),
  Email(EmailValidator()),
  Boolean(BooleanValidator()),
  TrueOnly(TrueOnlyValidator()),
  Date(DateValidator()),
  DateTime(DateTimeValidator()),
  Time(TimeValidator()),
  Number(NumberValidator()),
  UnitInterval(UnitIntervalValidator()),
  Percentage(PercentageValidator()),
  Integer(IntegerValidator()),
  IntegerPositive(IntegerPositiveValidator()),
  IntegerNegative(IntegerNegativeValidator()),
  IntegerZeroOrPositive(IntegerZeroOrPositiveValidator()),
  TrackerAssociate(UidValidator()),
  Username(TextValidator()),
  Coordinate(CoordinateValidator()),
  OrganisationUnit(UidValidator()),
  Reference(TextValidator()),
  Age(DateValidator()),
  URL(TextValidator()),
  FileResource(UidValidator()),
  Image(UidValidator()),
  SelectMulti(TextValidator()),
  SelectOne(TextValidator()),
  YesNo(TextValidator()),
  GeoJson(TextValidator());

  const ValueType(this._validator);

  final ValueTypeValidator<ThrowableException> _validator;

  ValueTypeValidator<ThrowableException> get validator => _validator;

  static List<ValueType> get INTEGER_TYPES =>
      [Integer, IntegerPositive, IntegerNegative, IntegerZeroOrPositive];

  static List<ValueType> get NUMERIC_TYPES => [
        Integer,
        Number,
        IntegerPositive,
        IntegerNegative,
        IntegerZeroOrPositive,
        UnitInterval,
        Percentage
      ];

  static List<ValueType> get BOOLEAN_TYPES => [Boolean, TrueOnly];

  static List<ValueType> get TEXT_TYPES =>
      [Text, LongText, Letter, Coordinate, Time];

  static List<ValueType> get DATE_TYPES => [Date, DateTime];

  static List<ValueType> get FILE_TYPES => [Image, FileResource];

  bool get isInteger => INTEGER_TYPES.contains(this);

  bool get isNumeric => NUMERIC_TYPES.contains(this);

  bool get isBoolean => BOOLEAN_TYPES.contains(this);

  bool get isText => TEXT_TYPES.contains(this);

  bool get isDate => DATE_TYPES.contains(this);

  bool get isFile => FILE_TYPES.contains(this);

  bool get isCoordinate => this == Coordinate;

  static ValueType? valueOf(String? str) =>
      ValueType.values.firstWhere((e) => e.toString() == 'ValueType.' + '$str',
          orElse: () => throw ArgumentError(
              'ValueTypeOfString There is no ValueType of Type: $str'));
}
