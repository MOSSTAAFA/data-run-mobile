import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/commons/extensions/standard_extensions.dart';
import 'package:mass_pro/commons/extensions/string_extension.dart';
import 'package:mass_pro/commons/resources/resource_manager.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';

class MapFieldValueToUser {
  MapFieldValueToUser(this.resources);

  final ResourceManager resources;

// final DataValueRepository repository;
}

String? mapValueToUser(QFieldModel field) {
  final String? value = when<dynamic, String?>(field.valueType, {
    [ValueType.Boolean, ValueType.TrueOnly, ValueType.YesNo]: () {
      if (!field.value.isNullOrEmpty) {
        if (field.value.toBoolean()) {
          return /*resources.getString(*/ 'Yes' /*)*/;
        }
        return /*resources.getString(*/ 'No' /*)*/;
      }
      return field.value;
    },
    // ValueType.Age: () {},
    // [
    //   ValueType.Image,
    //   ValueType.FileResource,
    //   ValueType.TrackerAssociate,
    //   ValueType.Reference,
    //   ValueType.Username,
    //   ValueType.OrganisationUnit
    // ]: () {}
  });

  return value;
}

dynamic mapFieldToValueType(
    {String? value, IList<String>? values, String? valueType}) {
  switch (ValueType.getValueType(valueType)) {
    case ValueType.Percentage:
    case ValueType.Integer:
    case ValueType.IntegerPositive:
    case ValueType.IntegerNegative:
    case ValueType.IntegerZeroOrPositive:
      return int.tryParse(value ?? '') ?? double.tryParse(value ?? '') ?? 0;
    case ValueType.UnitInterval:
      return int.tryParse(value ?? '') ?? double.tryParse(value ?? '') ?? 0;
    case ValueType.Number:
    case ValueType.Age:
      return double.tryParse(value ?? '') ?? 0.0;
    case ValueType.SelectMulti:
      return values?.unlock ?? <String>[];
    // case ValueType.Date:
    // case ValueType.DateTime:
    //   return field?.value.toDate();
    case ValueType.Boolean:
    case ValueType.TrueOnly:
      // case ValueType.YesNo:
      return value.toBoolean() ?? value;
    default:
      return value;
  }
}

// dynamic mapFieldToValueType(QFieldModel? field) {
//   switch (field?.valueType) {
//     case ValueType.Percentage:
//     case ValueType.Integer:
//     case ValueType.IntegerPositive:
//     case ValueType.IntegerNegative:
//     case ValueType.IntegerZeroOrPositive:
//       return int.tryParse(field?.value ?? '') ??
//           double.tryParse(field?.value ?? '') ??
//           0;
//     case ValueType.UnitInterval:
//       return int.tryParse(field?.value ?? '') ??
//           double.tryParse(field?.value ?? '') ??
//           0;
//     case ValueType.Number:
//     case ValueType.Age:
//       return double.tryParse(field?.value ?? '') ?? 0.0;
//     case ValueType.SelectMulti:
//       return field?.values?.unlock ?? <String>[];
//     // case ValueType.Date:
//     // case ValueType.DateTime:
//     //   return field?.value.toDate();
//     case ValueType.Boolean:
//     case ValueType.TrueOnly:
//       // case ValueType.YesNo:
//       return field?.value.toBoolean() ?? field?.value;
//     default:
//       return field?.value;
//   }
// }
