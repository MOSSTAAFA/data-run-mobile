import 'package:d2_remote/core/datarun/utilities/date_utils.dart';
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/entities/event_data_value.entity.dart';
import 'package:d2_remote/modules/data/tracker/queries/event_data_value.query.dart';
import 'package:d2_remote/modules/metadata/data_element/entities/data_element.entity.dart';
import 'package:d2_remote/modules/metadata/option_set/entities/option.entity.dart';
import 'package:d2_remote/shared/utilities/merge_mode.util.dart';
import 'package:d2_remote/shared/utilities/save_option.util.dart';
import 'package:mass_pro/commons/extensions/dynamic_value_extensions.dart';
import 'package:mass_pro/core/d2_remote_extensions/tracker/queries/base_query_extension.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';

/// BlockingSetCheckTrackedEntityAttributeValueExtension
// TODOBaseQueryWithValue extends BaseQuery on which these extension are put
extension SetCheckTrackedEntityAttributeValueExtension on EventDataValueQuery {
  // NMC: TODO throws D2Error
  Future<bool> blockingExists() async {
    final EventDataValue? value = await getOne();
    // return value == null ? Boolean.FALSE : value.deleted() != Boolean.TRUE;
    return value != null;
  }

  // NMC: TODO catch D2Error
  Future<void> blockingDeleteIfExist() async {
    // blockingDelete()
    // delete(blockingGetWithoutChildren())
    final EventDataValue? toDelete = await getOne();
    if (toDelete != null) {
      await byId(toDelete.uid!).delete();
    }
  }

  Future<bool> blockingSetCheck(String deUid, String value) async {
    final DataElement de =
        (await D2Remote.dataElementModule.dataElement.byId(deUid).getOne())!;
    // if (de != null) {
    final bool checkResult =
        await check(ValueType.getValueType(de.valueType), de.optionSet, value);
    if (checkResult) {
      final String finalValue = await _assureCodeForOptionSet(de.optionSet, value);
      await blockingSet(finalValue);
      return true;
    } else {
      await blockingDeleteIfExist();
      return false;
    }
    // }
  }

  // NMC: TODO throws D2Error
  Future<void> blockingSet(String value) async {
    final String date = DateUtils.databaseDateFormat().format(DateTime.now().toUtc());
    final EventDataValue? toUpdate = await getOne();
    // updateOrInsert
    if (toUpdate != null) {
      mergeMode = MergeMode.Merge;
      toUpdate.synced = false;
      toUpdate.dirty = true;
      // return toUpdate
      //   ..value = value
      //   ..synced = false
      //   ..dirty = true
      //   ..lastUpdated = date;
      await setData(toUpdate
            ..value = value
            ..synced = false
            ..dirty = true
            ..lastModifiedDate = date)
          .save(saveOptions: SaveOptions(skipLocalSyncStatus: true));
      mergeMode = MergeMode.Replace;
    }

    await setData(EventDataValue(
            dirty: true,
            dataElement: dataElement!,
            event: event,
            value: value,
            providedElsewhere: false,
            createdDate: date,
            lastModifiedDate: date))
        .save(saveOptions: SaveOptions(skipLocalSyncStatus: true));
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
