import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/queries/event_data_value.query.dart';
import 'package:d2_remote/modules/metadata/data_element/entities/data_element.entity.dart';
import 'package:d2_remote/modules/metadata/option_set/entities/option.entity.dart';
import 'package:d2_remote/shared/utilities/merge_mode.util.dart';
import 'package:d2_remote/shared/utilities/save_option.util.dart';
import 'base_query_extension.dart';
import 'dynamic_value_extensions.dart';
import 'value_extensions.dart';

/// BlockingSetCheckTrackedEntityAttributeValueExtension
/// TODO BaseQueryWithValue extends BaseQuery on which these extension are put
extension SetCheckTrackedEntityAttributeValueExtension on EventDataValueQuery {
  Future<bool> blockingSetCheck(String deUid, String value) async {
    final DataElement de =
        (await D2Remote.dataElementModule.dataElement.byId(deUid).getOne())!;
    // if (de != null) {
    if (await check(de.valueType.toValueType, de.optionSet, value)) {
      final finalValue = await _assureCodeForOptionSet(de.optionSet, value);
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
      final Option? option = await D2Remote.optionModule.option
          .resetFilters()
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
    final toUpdate = await getOne();
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
    on EventDataValueQuery {
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

extension ExistTrackedEntityAttributeValueExtension on EventDataValueQuery {
  // NMC: TODO throws D2Error
  Future<bool> blockingExists() async {
    final dv = await getOne();
    return dv != null;
  }
}
