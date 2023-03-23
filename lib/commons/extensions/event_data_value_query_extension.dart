import 'package:d2_remote/core/common/value_type.dart';
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/entities/tracked_entity_attribute_value.entity.dart';
import 'package:d2_remote/modules/data/tracker/queries/event_data_value.query.dart';
import 'package:d2_remote/modules/data/tracker/queries/tracked_entity_attribute_value.query.dart';
import 'package:d2_remote/modules/metadata/data_element/entities/data_element.entity.dart';
import 'package:d2_remote/modules/metadata/option_set/entities/option.entity.dart';
import 'package:d2_remote/shared/queries/base.query.dart';
import 'package:d2_remote/shared/utilities/merge_mode.util.dart';
import 'package:d2_remote/shared/utilities/save_option.util.dart';
import 'package:mass_pro/commons/extensions/dynamic_value_extensions.dart';
import 'package:mass_pro/commons/extensions/string_extension.dart';
import 'package:mass_pro/commons/extensions/value_extensions.dart';

/// BlockingSetCheckTrackedEntityAttributeValueExtension
/// TODO BaseQueryWithValue extends BaseQuery on which these extension are put
extension SetCheckTrackedEntityAttributeValueExtension on EventDataValueQuery {
  Future<bool> blockingSetCheck(String deUid, String value) async {
    DataElement de =
        (await D2Remote.dataElementModule.dataElement.byId(deUid).getOne())!;
    // if (de != null) {
    if (await check(de.valueType.toValueType, de.optionSet, value)) {
      var finalValue = await _assureCodeForOptionSet(de.optionSet, value);
      await blockingSet(finalValue);
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
extension SetTrackedEntityAttributeValueExtension on EventDataValueQuery {
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
    }
  }
}

/// BlockingSetCheckTrackedEntityAttributeValueExtension
extension BlockingDeleteIfExistTrackedEntityAttributeValueExtension
    on EventDataValueQuery {
  // NMC: TODO catch D2Error
  Future<void> blockingDeleteIfExist() async {
    // blockingDelete()
    // delete(blockingGetWithoutChildren())
    var toDelete = await getOne();
    if (toDelete != null) {
      await byId(toDelete.id as String).delete();
    }
  }
}

extension ExistTrackedEntityAttributeValueExtension on EventDataValueQuery {
  // NMC: TODO throws D2Error
  Future<bool> blockingExists() async {
    var dv = await getOne();
    return dv != null;
  }
}
