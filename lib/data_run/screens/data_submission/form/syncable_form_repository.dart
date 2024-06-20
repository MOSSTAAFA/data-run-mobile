// ignore_for_file: always_specify_types

import 'dart:async';

import 'package:d2_remote/d2_remote.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/data_run/screens/data_submission/form/form_input_field.model.dart';
import 'package:mass_pro/data_run/screens/data_submission/form/syncable_data_entry_repository.dart';
import 'package:mass_pro/data_run/screens/data_submission/form/syncable_form_records.dart';
import 'package:mass_pro/data_run/utils/activity_type.dart';
import 'package:mass_pro/form/model/row_action.dart';
import 'package:mass_pro/form/ui/validation/field_error_message_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'syncable_form_repository.g.dart';

/// Other Providers
///
///
@riverpod
SyncableFormRecords syncableFormRecords(SyncableFormRecordsRef ref) {
  throw UnimplementedError(
      'You need to override record information in order to persist your data');
}

@riverpod
SyncableDataEntryRepository syncableDataEntryRepository(
    SyncableDataEntryRepositoryRef ref) {
  final records = ref.watch(syncableFormRecordsProvider);
  switch (records.activityType) {
    case ActivityType.CHV_PATIENT:
      return ChvPatientDataEntryRepository(
          syncableQuery: D2Remote.iccmModule.chvRegister,
          entityUid: records.uid);
    case ActivityType.CHV_SESSION:
      return ChvSessionDataEntryRepository(
          syncableQuery: D2Remote.iccmModule.chvSession,
          entityUid: records.uid);
    case ActivityType.ITN:
      return ItnsDataEntryRepository(
          syncableQuery: D2Remote.itnsVillageModule.itnsVillage,
          entityUid: records.uid);
    default:
  }
  return ItnsDataEntryRepository(
      syncableQuery: D2Remote.itnsVillageModule.itnsVillage,
      entityUid: records.uid);
}

@riverpod
FieldErrorMessageProvider fieldErrorMessage(FieldErrorMessageRef ref) {
  return const FieldErrorMessageProvider();
}

@riverpod
int formInputFieldListIndex(FormInputFieldListIndexRef ref) {
  throw UnimplementedError();
}

@riverpod
class FieldInputModelNotifier extends _$FieldInputModelNotifier {
  @override
  FieldInputModel build() {
    throw UnimplementedError();
  }
}

/// fetchFormItems
@riverpod
class FormInputFieldsListNotifier extends _$FormInputFieldsListNotifier {
  @override
  IList<FieldInputModel> build() {
    throw UnimplementedError();
  }
}

@riverpod
SyncableFormRepository syncableFormRepository(SyncableFormRepositoryRef ref) {
  return SyncableFormRepository(ref.watch(syncableDataEntryRepositoryProvider));
}

class SyncableFormRepository {
  SyncableFormRepository(
    this.syncableDataEntryRepository,
  );

  final SyncableDataEntryRepository? syncableDataEntryRepository;

  //
  double _completionPercentage = 0;
  IList<RowAction> _itemsWithError = IList();
  IMap<String, String> _mandatoryItemsWithoutValue = IMap({});

  // String? _openedSectionUid;
  IList<FieldInputModel> _itemList = IList();

  String? _focusedItemId;

  // RuleUtilsProviderResult? ruleEffectsResult;
  bool _runDataIntegrity = false;
  int _calculationLoop = 0;
  IList<FieldInputModel> _backupList = IList();

  Future<IList<FieldInputModel>> fetchFormItems() async {
    return await syncableDataEntryRepository?.list() ?? IList();

    // final IList<String>? sectionUids =
    //     (await dataEntryRepository?.sectionUids())?.lock;

    // _openedSectionUid = sectionUids != null && sectionUids.isNotEmpty
    //     ? sectionUids.first
    //     : null;

    // final IList<FieldInputModel>? items = syncableDataEntryRepository?.list();
    // _itemList = items ?? IList();
    //
    // _backupList = _itemList;
    // return composeList();
  }

// Future<IList<FieldInputModel>> composeList() {
//   _calculationLoop = 0;
//
//   return _mergeListWithErrorFields(_itemList, _itemsWithError)
//       .then((IList<FieldInputModel> listOfItems) {
//         _calculateCompletionPercentage(listOfItems);
//         return listOfItems;
//       })
//       // .then((IList<FieldInputModel> listOfItems) => _setOpenedSection(listOfItems))
//       .then((IList<FieldInputModel> listOfItems) =>
//           _setFocusedItem(listOfItems))
//       .then(
//           (IList<FieldInputModel> listOfItems) => _setLastItem(listOfItems));
// }
//
// Future<IList<FieldInputModel>> _mergeListWithErrorFields(
//     IList<FieldInputModel> list, IList<RowAction> fieldsWithError) async {
//   _mandatoryItemsWithoutValue = _mandatoryItemsWithoutValue.clear();
//   final IList<FieldInputModel> mergeList = IList<FieldInputModel>([]);
//   mergeList.map((element) {});
//   // list
//   final List<FieldInputModel> mergedList = await Future.wait<FieldInputModel>(
//       list.map((FieldInputModel item) async {
//     if (item.mandatory && item.value == null) {
//       _mandatoryItemsWithoutValue = _mandatoryItemsWithoutValue.add(
//           item.label, item.programStageSection ?? '');
//     }
//     final RowAction? action = fieldsWithError
//         .firstOrNullWhere((RowAction action) => action.id == item.uid);
//
//     if (action != null) {
//       final String? error = action.error != null
//           ? fieldErrorMessageProvider.getFriendlyErrorMessage(action.error!)
//           : null;
//
//       final String? displayName = await displayNameProvider
//           .provideDisplayName(action.valueType, action.value);
//       return item
//           .setValue(action.value)
//           .setError(error)
//           .setDisplayName(displayName);
//     } else {
//       return item;
//     }
//   }));
//   return mergedList.lock;
// }
//
// /// pure function doesn't effect this class variables
// /// runs at finishing data entry, either by clicking back key
// /// or save key, if there are errors it will notify in the UI
// DataIntegrityCheckResult runDataIntegrityCheck({required bool allowDiscard}) {
//   _runDataIntegrity = true;
//   final IList<FieldWithIssue> itemsWithErrors = _getFieldsWithError();
//   /*final*/
//   final IList<FieldWithIssue> itemsWithWarning = /*ruleEffectsResult?...??*/
//       IList([]);
//   // final DataIntegrityCheckResult result;
//   if (itemsWithErrors
//       .isNotEmpty /*|| ruleEffectsResult?.canComplete == false*/) {
//     return FieldsWithErrorResult(
//         mandatoryFields: _mandatoryItemsWithoutValue,
//         fieldUidErrorList: itemsWithErrors,
//         warningFields: itemsWithWarning,
//         canComplete: /*ruleEffectsResult?.canComplete ??*/ true,
//         onCompleteMessage: /*ruleEffectsResult?.messageOnComplete*/ null,
//         allowDiscard: allowDiscard);
//   }
//
//   if (_mandatoryItemsWithoutValue.isNotEmpty) {
//     return MissingMandatoryResult(
//         mandatoryFields: _mandatoryItemsWithoutValue,
//         errorFields: itemsWithErrors,
//         warningFields: itemsWithWarning,
//         canComplete: /*ruleEffectsResult?.canComplete ??*/ true,
//         onCompleteMessage: /*ruleEffectsResult?.messageOnComplete*/ null,
//         allowDiscard: allowDiscard);
//   }
//
//   if (itemsWithWarning.isNotEmpty) {
//     return FieldsWithWarningResult(
//         fieldUidWarningList: itemsWithWarning,
//         canComplete: /*ruleEffectsResult?.canComplete ??*/ true,
//         onCompleteMessage: /*ruleEffectsResult?.messageOnComplete*/ null);
//   }
//
//   if (backupOfChangedItems().isNotEmpty && allowDiscard) {
//     return const NotSavedResult();
//   }
//
//   return const SuccessfulResult(
//       canComplete: /*ruleEffectsResult?.canComplete ?? */ true,
//       onCompleteMessage: /*ruleEffectsResult?.messageOnComplete*/ null);
// }
//
// @override
// IList<FieldInputModel> backupOfChangedItems() {
//   // return backupList.minus(itemList.applyRuleEffects());
//   return _backupList;
// }
//
// @override
// bool calculationLoopOverLimit() {
//   return _calculationLoop == _loopThreshold;
// }
//
// @override
// void clearFocusItem() {
//   _focusedItemId = null;
// }
//
// @override
// double completedFieldsPercentage(IList<FieldInputModel> value) {
//   return _completionPercentage;
// }
//
// @override
// FieldInputModel? currentFocusedItem() {
//   return _itemList
//       .firstOrNullWhere((FieldInputModel item) => _focusedItemId == item.uid);
// }
//
// @override
// void removeAllValues() {
//   _itemList = _itemList
//       .map((FieldInputModel fieldUiModel) =>
//           fieldUiModel.setValue(null).setDisplayName(null))
//       .toIList();
// }

// @override
// Future<StoreResult?> save(String id, String? value, String? extraData) {
//   final storeResult = formValueStore?.save(id, value, extraData) ??
//       Future<StoreResult?>.value();
//   return storeResult;
// }
//
// @override
// void setFieldRequestingCoordinates(String uid, bool requestInProcess) {
//   _itemList.let((IList<FieldInputModel> list) => list
//       .firstOrNullWhere((FieldInputModel item) => item.uid == uid)
//       ?.let((FieldInputModel item) => _itemList = list.replace(
//           list.indexOf(item), item.setIsLoadingData(requestInProcess))));
// }
//
// @override
// void setFocusedItem(RowAction action) {
//   when(action.type, {
//     ActionType.ON_NEXT: () => _focusedItemId = _getNextItem(action.id),
//     ActionType.ON_FINISH: () => _focusedItemId = null,
//   }).orElse(() => _focusedItemId = action.id);
// }
//
// @override
// void updateErrorList(RowAction action) {
//   if (action.error != null) {
//     if (_itemsWithError
//             .firstOrNullWhere((RowAction item) => item.id == action.id) ==
//         null) {
//       _itemsWithError = _itemsWithError.add(action);
//     }
//   } else {
//     _itemsWithError
//         .firstOrNullWhere((RowAction item) => item.id == action.id)
//         ?.let((RowAction item) =>
//             _itemsWithError = _itemsWithError.remove(item));
//   }
// }
//
// @override
// void updateSectionOpened(RowAction action) {
//   _openedSectionUid = action.id;
// }
//
// @override
// Future<void> updateValueOnList(
//     String uid, String? value, ValueType? valueType) async {
//   final int itemIndex =
//       _itemList.indexWhere((FieldInputModel item) => item.uid == uid);
//   if (itemIndex >= 0) {
//     final FieldInputModel item = _itemList[itemIndex];
//     _itemList = _itemList.replace(
//         itemIndex,
//         item.setValue(value).setDisplayName(await displayNameProvider
//             .provideDisplayName(valueType, value, item.optionSet)));
//     /*   .setLegend(
//               legendValueProvider?.provideLegendValue(item.uid, value))*/
//   }
// }

// void _calculateCompletionPercentage(IList<FieldInputModel> list) {
//   const List<ValueType> unsupportedValueTypes = [
//     ValueType.FileResource,
//     ValueType.TrackerAssociate,
//     ValueType.Username
//   ];
//
//   final Iterable<FieldInputModel> fields = list.where((FieldInputModel it) =>
//       it.valueType != null && !unsupportedValueTypes.contains(it.valueType));
//
//   final int totalFields = fields.length;
//   final int fieldsWithValue =
//       fields.where((FieldInputModel it) => it.value != null).length;
//   if (totalFields == 0) {
//     _completionPercentage = 0;
//   } else {
//     _completionPercentage =
//         fieldsWithValue.toDouble() / totalFields.toDouble();
//   }
// }
//
// Future<IList<FieldInputModel>> _setOpenedSection(
//     IList<FieldInputModel> list) async {
//   final List<FieldInputModel> fields = [];
//   for (final FieldInputModel field in list) {
//     if (field.isSection()) {
//       fields.add(_updateSection(field, list));
//     } else {
//       final FieldInputModel item = await _updateField(field);
//       fields.add(item);
//     }
//   }
//
//   return fields
//       .where((FieldInputModel field) =>
//           field.isSectionWithFields() ||
//           field.programStageSection == _openedSectionUid)
//       .toIList();
// }
//
// FieldInputModel _updateSection(
//     FieldInputModel sectionFieldUiModel, IList<FieldInputModel> fields) {
//   int total = 0;
//   int values = 0;
//   final bool isOpen = sectionFieldUiModel.uid == _openedSectionUid;
//   fields
//       .where((FieldInputModel item) =>
//           item.programStageSection == sectionFieldUiModel.uid &&
//           item.valueType != null)
//       .forEach((FieldInputModel item) {
//     total++;
//     if (!item.value.isNullOrEmpty) {
//       values++;
//     }
//   });
//
//   const int
//       warningCount = /*ruleEffectsResult?.warningMap()?.filter { warning ->
//   fields.firstOrNull { field ->
//   field.uid == warning.key && field.programStageSection == sectionFieldUiModel.uid
//   } != null
//   }?.size ?: */
//       0;
//   //
//
//   final int mandatoryCount = _runDataIntegrity
//       ? _mandatoryItemsWithoutValue
//           .where((_, mandatory) => mandatory == sectionFieldUiModel.uid)
//           .length
//       : 0;
//
//   final int errorCount = IMap.fromIterable<String, String, FieldWithIssue>(
//     _getFieldsWithError(),
//     keyMapper: (it) => it.fieldUid,
//     valueMapper: (it) => it.message,
//   )
//       .where((key, value) =>
//           fields.firstOrNullWhere((FieldInputModel field) =>
//               field.uid == key &&
//               field.programStageSection == sectionFieldUiModel.uid) !=
//           null)
//       .length;
//
//   if (syncableDataEntryRepository != null) {
//     return syncableDataEntryRepository!.updateSection(sectionFieldUiModel, isOpen,
//         total, values, errorCount + mandatoryCount, warningCount);
//   }
//
//   return sectionFieldUiModel;
// }
//
// FutureOr<FieldInputModel> _updateField(FieldInputModel fieldUiModel) {
//   final bool needsMandatoryWarning =
//       fieldUiModel.mandatory && fieldUiModel.value == null;
//
//   if (needsMandatoryWarning) {
//     _mandatoryItemsWithoutValue = _mandatoryItemsWithoutValue.add(
//         fieldUiModel.label, fieldUiModel.programStageSection ?? '');
//   }
//
//   if (syncableDataEntryRepository != null) {
//     final mandatoryWarning = needsMandatoryWarning && _runDataIntegrity
//         ? fieldErrorMessageProvider.mandatoryWarning()
//         : null;
//     return syncableDataEntryRepository!.updateField(
//         fieldUiModel,
//         mandatoryWarning,
//         /*ruleEffectsResult?.optionsToHide(fieldUiModel.uid) ?:*/ [],
//         /*ruleEffectsResult?.optionGroupsToHide(fieldUiModel.uid) ?:*/ [],
//         /*ruleEffectsResult?.optionGroupsToShow(fieldUiModel.uid) ?:*/ []);
//   }
//   return fieldUiModel;
// }
//
// IList<FieldWithIssue> _getFieldsWithError() {
//   return _itemsWithError.mapNotNull((RowAction? errorItem) {
//     final FieldInputModel? item = _itemList.firstOrNullWhere(
//         (FieldInputModel item) => item.uid == errorItem?.id);
//     if (item != null) {
//       return FieldWithIssue(
//           fieldUid: item.uid,
//           fieldName: item.label,
//           issueType: IssueType.ERROR,
//           message: errorItem?.error != null
//               ? fieldErrorMessageProvider
//                   .getFriendlyErrorMessage(errorItem!.error!)
//               : '');
//     }
//     return null;
//   }).toIList();
// }
//
// IList<FieldInputModel> _setFocusedItem(IList<FieldInputModel> list) {
//   if (_focusedItemId != null) {
//     final FieldInputModel? item = list.firstOrNullWhere(
//         (FieldInputModel item) => item.uid == _focusedItemId);
//     if (item != null) {
//       list = list.replace(list.indexOf(item), item.setFocus());
//     }
//   }
//   return list;
// }
//
// IList<FieldInputModel> _setLastItem(IList<FieldInputModel> list) {
//   if (list.isEmpty) {
//     return list;
//   }
//   if (list.every((FieldInputModel it) => it is SectionUiModelImpl)) {
//     final FieldInputModel lastItem = _getLastSectionItem(list);
//     if (_usesKeyboard(lastItem.valueType) &&
//         lastItem.valueType != ValueType.LongText) {
//       return list.replace(
//           list.indexOf(lastItem), lastItem.setKeyBoardActionDone());
//     }
//   }
//   return list;
// }
//
// FieldInputModel _getLastSectionItem(IList<FieldInputModel> list) {
//   if (list.every((FieldInputModel item) => item is SectionUiModelImpl)) {
//     return list.reversed.first;
//   }
//   return list.reversed
//       .firstWhere((FieldInputModel item) => item.valueType != null);
// }
//
// bool _usesKeyboard(ValueType? valueType) {
//   return valueType != null
//       ? valueType.isText || valueType.isNumeric || valueType.isInteger
//       : false;
// }
//
// String? _getNextItem(String currentItemUid) {
//   _itemList.let((IList<FieldInputModel> fields) {
//     // final oldItem = fields.firstOrNullWhere((item) => item.uid == currentItemUid);
//     final int pos = fields.indexWhere(
//         (FieldInputModel oldItem) => oldItem.uid == currentItemUid);
//     if (pos < fields.length - 1) {
//       return fields[pos + 1].uid;
//     }
//   });
//   return null;
// }
}
