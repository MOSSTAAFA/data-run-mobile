import 'package:d2_remote/core/common/value_type.dart';
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/entities/event_data_value.entity.dart';
import 'package:d2_remote/modules/data/tracker/entities/tracked_entity_attribute_value.entity.dart';
import 'package:d2_remote/modules/metadata/data_element/entities/data_element.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/tracked_entity_attribute.entity.dart';

import '../../commons/extensions/dynamic_extensions.dart';
import 'dynamic_value_extensions.dart';
import 'string_extension.dart';

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
  ValueType? get toValueType {
    try {
      return ValueType.values.byName(this);
      // return ValueType.values.firstWhere((valueType) => valueType.name == this,
      //     orElse: throw ArgumentError(
      //         'The ValueType $this does not match any Value type'));
    } catch (e) {
      logInfo(info: 'The ValueType $this does not match any Enum Value');
      return null;
    }
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
      case ValueType.PERCENTAGE:
      case ValueType.INTEGER:
      case ValueType.INTEGER_POSITIVE:
      case ValueType.INTEGER_NEGATIVE:
      case ValueType.INTEGER_ZERO_OR_POSITIVE:
        return (int.tryParse(this!) ?? toDouble().toInt()).toString();
      case ValueType.UNIT_INTERVAL:
        return (int.tryParse(this!) ?? toDouble()).toString();
      default:
      // break;
    }
    return this;
  }
}
