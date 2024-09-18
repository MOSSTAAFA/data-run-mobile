// import 'package:mass_pro/sdk/core/common/exception/validation_exception.dart';
// import 'package:mass_pro/sdk/core/common/value_type/validators/validators.dart';
//
// enum ValueType {
//   Section(TextValidator()),
//   RepeatableSection(TextValidator()),
//   Text(TextValidator()),
//   LongText(LongTextValidator()),
//   Letter(LetterValidator()),
//   PhoneNumber(PhoneNumberValidator()),
//   Email(EmailValidator()),
//   Boolean(BooleanValidator()),
//   TrueOnly(TrueOnlyValidator()),
//   Date(DateValidator()),
//   DateTime(DateTimeValidator()),
//   Time(TimeValidator()),
//   Number(NumberValidator()),
//   UnitInterval(UnitIntervalValidator()),
//   Percentage(PercentageValidator()),
//   Integer(IntegerValidator()),
//   IntegerPositive(IntegerPositiveValidator()),
//   IntegerNegative(IntegerNegativeValidator()),
//   IntegerZeroOrPositive(IntegerZeroOrPositiveValidator()),
//   TrackerAssociate(UidValidator()),
//   Username(TextValidator()),
//   Coordinate(CoordinateValidator()),
//   OrganisationUnit(UidValidator()),
//   Reference(TextValidator()),
//   Age(NumberValidator()),
//   FullName(TextValidator()),
//   URL(TextValidator()),
//   FileResource(UidValidator()),
//   Image(UidValidator()),
//   SelectMulti(TextValidator()),
//   SelectOne(TextValidator()),
//   YesNo(TextValidator()),
//   GeoJson(TextValidator()),
//   Unknown(TextValidator());
//
//   const ValueType(this._validator);
//
//   final ValueTypeValidator<ValidationException> _validator;
//
//   ValueTypeValidator<ValidationException> get validator => _validator;
//
//   static List<ValueType> get INTEGER_TYPES => <ValueType>[
//         Integer,
//         IntegerPositive,
//         IntegerNegative,
//         IntegerZeroOrPositive
//       ];
//
//   static List<ValueType> get NUMERIC_TYPES => <ValueType>[
//         Integer,
//         Number,
//         IntegerPositive,
//         IntegerNegative,
//         IntegerZeroOrPositive,
//         UnitInterval,
//         Percentage
//       ];
//
//   static List<ValueType> get SECTION_TYPES => <ValueType>[
//     Section,
//     RepeatableSection
//   ];
//
//   static List<ValueType> get WITH_OPTIONS_TYPES =>
//       <ValueType>[SelectOne, SelectMulti];
//
//   static List<ValueType> get BOOLEAN_TYPES => <ValueType>[Boolean, TrueOnly];
//
//   static List<ValueType> get TEXT_TYPES =>
//       <ValueType>[Text, LongText, Letter, Coordinate, Time, FullName];
//
//   static List<ValueType> get DATE_TYPES => <ValueType>[Date, DateTime];
//
//   static List<ValueType> get FILE_TYPES => <ValueType>[Image, FileResource];
//
//   bool get isInteger => INTEGER_TYPES.contains(this);
//
//   bool get isSection => SECTION_TYPES.contains(this);
//
//   bool get isWithOptions => WITH_OPTIONS_TYPES.contains(this);
//
//   bool get isNumeric => NUMERIC_TYPES.contains(this);
//
//   bool get isBoolean => BOOLEAN_TYPES.contains(this);
//
//   bool get isText => TEXT_TYPES.contains(this);
//
//   bool get isDateTime => DATE_TYPES.contains(this);
//
//   bool get isDate => this == ValueType.Date;
//
//   bool get isTime => this == ValueType.Time;
//
//   bool get isFile => FILE_TYPES.contains(this);
//
//   bool get isCoordinate => this == Coordinate;
//
//   static ValueType getValueType(String? valueType) {
//     switch (valueType?.toLowerCase()) {
//       case 'section':
//         return ValueType.Section;
//       case 'repeatablesection':
//         return ValueType.RepeatableSection;
//       case 'text':
//         return ValueType.Text;
//       case 'longtext':
//         return ValueType.LongText;
//       case 'letter':
//         return ValueType.Letter;
//       case 'phonenumber':
//         return ValueType.PhoneNumber;
//       case 'email':
//         return ValueType.Email;
//       case 'boolean':
//         return ValueType.Boolean;
//       case 'trueonly':
//         return ValueType.TrueOnly;
//       case 'date':
//         return ValueType.Date;
//       case 'datetime':
//         return ValueType.DateTime;
//       case 'time':
//         return ValueType.Time;
//       case 'number':
//         return ValueType.Number;
//       case 'unitinterval':
//         return ValueType.UnitInterval;
//       case 'percentage':
//         return ValueType.Percentage;
//       case 'integer':
//         return ValueType.Integer;
//       case 'integerpositive':
//         return ValueType.IntegerPositive;
//       case 'integernegative':
//         return ValueType.IntegerNegative;
//       case 'integerzeroorpositive':
//         return ValueType.IntegerZeroOrPositive;
//       case 'trackerassociate':
//         return ValueType.TrackerAssociate;
//       case 'username':
//         return ValueType.Username;
//       case 'coordinate':
//         return ValueType.Coordinate;
//       case 'organisationunit':
//         return ValueType.OrganisationUnit;
//       case 'reference':
//         return ValueType.Reference;
//       case 'age':
//         return ValueType.Age;
//       case 'fullname':
//         return ValueType.FullName;
//       case 'url':
//         return ValueType.URL;
//       case 'fileresource':
//         return ValueType.FileResource;
//       case 'image':
//         return ValueType.Image;
//       case 'selectmulti':
//         return ValueType.SelectMulti;
//       case 'selectone':
//         return ValueType.SelectOne;
//       case 'yesno':
//         return ValueType.YesNo;
//       case 'geojson':
//         return ValueType.GeoJson;
//       default:
//         return ValueType.Unknown;
//       // throw ArgumentError('Invalid value type: $valueType');
//     }
//   }
// }
