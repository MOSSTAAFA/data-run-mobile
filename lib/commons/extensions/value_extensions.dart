import 'package:mass_pro/sdk/core/common/value_type.dart';
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/entities/event_data_value.entity.dart';
import 'package:d2_remote/modules/data/tracker/entities/tracked_entity_attribute_value.entity.dart';
import 'package:d2_remote/modules/metadata/data_element/entities/data_element.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/tracked_entity_attribute.entity.dart';

import 'package:mass_pro/commons/extensions/dynamic_extensions.dart';
import 'package:mass_pro/commons/extensions/dynamic_value_extensions.dart';
import 'package:mass_pro/commons/extensions/string_extension.dart';

/// UserFriendlyTrackedEntityAttributeValueExtension
extension UserFriendlyTrackedEntityAttributeValueExtension
    on TrackedEntityAttributeValue {
  Future<String?> userFriendlyValue() async {
    if (value.isNullOrEmpty) {
      return value;
    }

    final TrackedEntityAttribute? attribute = await D2Remote
        .programModule.trackedEntityAttribute
        .byId(this.attribute)
        .getOne();

    if (attribute == null) {
      return value;
    }

    if (await check(
        attribute.valueType.toValueType, attribute.optionSet, value)) {
      String? v;
      if (attribute.optionSet != null) {
        v = await checkOptionSetValue(attribute.optionSet!, value);
      }
      return v ??
          await checkValueTypeValue(attribute.valueType.toValueType, value);
    }
    return null;
  }
}

/// EventDataValueExtensions
///
/// UserFriendlyEventDataValueExtensions
extension UserFriendlyEventDataValueExtension on EventDataValue? {
  Future<String?> userFriendlyValue() async {
    if (this == null) {
      return null;
    } else {
      if (this!.value.isNullOrEmpty) {
        return this!.value;
      }
    }

    final DataElement? dataElement = await D2Remote
        .dataElementModule.dataElement
        .byId(this!.dataElement)
        .getOne();

    if (dataElement == null) {
      return this!.value;
    }

    if (await check(dataElement.valueType.toValueType, dataElement.optionSet,
        this!.value)) {
      String? v;
      if (dataElement.optionSet != null) {
        v = await checkOptionSetValue(dataElement.optionSet!, this!.value);
      }
      return v ??
          await checkValueTypeValue(
              dataElement.valueType.toValueType, this!.value);
    }
    return null;
  }
}

extension ToValueType on String {

  // for(var typevalue in values) {
  //
  // }

  ValueType? get toValueType {
    const List<ValueType> values  = ValueType.values;
    for (final value in values) {
      if(value.name.toLowerCase() == this.toLowerCase()) {
        return value;
      }
    }
    logInfo(info: 'The ValueType $this does not match any Enum Value');
    return null;
  }
}

/// ValueExtensions
///
///
/// WithValueTypeCheckExtension
extension WithValueTypeCheckExtension on String? {
  String? withValueTypeCheck(ValueType? valueType) {
    if (isNullOrEmpty) return this;
    switch (valueType) {
      case ValueType.Percentage:
      case ValueType.Integer:
      case ValueType.IntegerPositive:
      case ValueType.IntegerNegative:
      case ValueType.IntegerZeroOrPositive:
        return (int.tryParse(this!) ?? toDouble().toInt()).toString();
      case ValueType.UnitInterval:
        return (int.tryParse(this!) ?? toDouble()).toString();
      default:
      // break;
    }
    return this;
  }
}
