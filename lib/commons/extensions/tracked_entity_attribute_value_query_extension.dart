import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/queries/tracked_entity_attribute_value.query.dart';
import 'package:d2_remote/modules/metadata/option_set/entities/option.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/tracked_entity_attribute.entity.dart';
import 'package:d2_remote/shared/utilities/merge_mode.util.dart';
import 'package:d2_remote/shared/utilities/save_option.util.dart';

import 'dynamic_value_extensions.dart';
import 'value_extensions.dart';

/// BlockingSetCheckTrackedEntityAttributeValueExtension
/// TODO BaseQueryWithValue extends BaseQuery on which these extension are put
extension SetCheckTrackedEntityAttributeValueExtension
    on TrackedEntityAttributeValueQuery {
  Future<bool> blockingSetCheck(String attrUid, String value,
      Function(String attrUid, String value) onCrash) async {
    TrackedEntityAttribute trackedEntityAttribute = (await D2Remote
        .programModule.trackedEntityAttribute
        .byId(attrUid)
        .getOne())!;
    // if (de != null) {
    if (await check(trackedEntityAttribute.valueType.toValueType,
        trackedEntityAttribute.optionSet, value)) {
      var finalValue = await _assureCodeForOptionSet(
          trackedEntityAttribute.optionSet, value);
      try {
        await blockingSet(finalValue);
      } catch (e) {
        onCrash(attrUid, value);
        return false;
      }
      return true;
    } else {
      await blockingDeleteIfExist();
      return false;
    }
    // }
  }

  Future<String> _assureCodeForOptionSet(
      String? optionSetUid, String value) async {
    if (optionSetUid != null) {
      Option? option = await D2Remote.optionModule.option
          .byOptionSet(optionSetUid)
          .where(attribute: 'name', value: value)
          .getOne();
      return option != null ? option.code! : value;
    }
    return value;
  }
}

/// BlockingSetCheckTrackedEntityAttributeValueExtension
extension SetTrackedEntityAttributeValueExtension
    on TrackedEntityAttributeValueQuery {
  // NMC: TODO throws D2Error
  Future<void> blockingSet(String value) async {
    var toUpdate = await getOne();
    // updateOrInsert
    if (toUpdate != null) {
      mergeMode = MergeMode.Merge;
      toUpdate.value = value;
      toUpdate.synced = false;
      toUpdate.dirty = true;
      await setData(toUpdate)
          .save(saveOptions: SaveOptions(skipLocalSyncStatus: true));
      mergeMode = MergeMode.Replace;
    }
  }
}

/// BlockingSetCheckTrackedEntityAttributeValueExtension
extension BlockingDeleteIfExistTrackedEntityAttributeValueExtension
    on TrackedEntityAttributeValueQuery {
  // NMC: TODO catch D2Error
  Future<void> blockingDeleteIfExist() async {
    // blockingDelete()
    // delete(blockingGetWithoutChildren())
    final toDelete = await getOne();
    if (toDelete != null) {
      await byId(toDelete.id as String).delete();
    }
  }
}

/// BlockingSetCheckTrackedEntityAttributeValueExtension
extension ExistTrackedEntityAttributeValueExtension
    on TrackedEntityAttributeValueQuery {
  // NMC: TODO throws D2Error
  Future<bool> blockingExists() async {
    final teav = await getOne();
    return teav != null;
  }
}

/// ValueExtensions
///
///
/// WithValueTypeCheckExtension
// extension WithValueTypeCheckExtension on String? {
//   String? withValueTypeCheck(ValueType? valueType) {
//     if (isNullOrEmpty) return this;
//     switch (valueType) {
//       case ValueType.PERCENTAGE:
//       case ValueType.INTEGER:
//       case ValueType.INTEGER_POSITIVE:
//       case ValueType.INTEGER_NEGATIVE:
//       case ValueType.INTEGER_ZERO_OR_POSITIVE:
//         return (int.tryParse(this!) ?? toDouble().toInt()).toString();
//       case ValueType.UNIT_INTERVAL:
//         return (int.tryParse(this!) ?? toDouble()).toString();
//       default:
//         return this;
//     }
//   }
// }
