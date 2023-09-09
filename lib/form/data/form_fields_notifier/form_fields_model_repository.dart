// // NMC created
// // ignore_for_file: always_specify_types
//
// import 'package:d2_remote/core/common/value_type.dart';
// import 'package:equatable/equatable.dart';
// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:flutter/material.dart';
//
// import '../../../commons/date/field_with_issue.dart';
// import '../../../commons/extensions/standard_extensions.dart';
// import '../../../commons/extensions/string_extension.dart';
// import '../../../commons/helpers/iterable.dart';
// import '../../model/action_type.dart';
// import '../../model/field_ui_model.dart';
// import '../../model/row_action.dart';
// import '../../model/section_ui_model_impl.dart';
// import '../../model/store_result.dart';
// import '../../ui/provider/display_name_provider.dart';
// import '../../ui/validation/field_error_message_provider.dart';
// import '../data_entry_repository.dart';
// import '../data_integrity_check_result.dart';
// import '../form_repository.dart';
// import '../form_value_store.dart';
//
// part 'form_fields_model.dart';
//
// class FormFieldsModelRepository implements FormRepository {
//   FormFieldsModelRepository(
//       {this.formValueStore,
//       required this.fieldErrorMessageProvider,
//       required this.displayNameProvider,
//       this.dataEntryRepository})
//       : _formFieldsModel = const _FormRepositoryModel();
//
//   static const int _loopThreshold = 5;
//
//   _FormRepositoryModel _formFieldsModel;
//   final FormValueStore? formValueStore;
//   final FieldErrorMessageProvider fieldErrorMessageProvider;
//   final DisplayNameProvider displayNameProvider;
//   final DataEntryRepository? dataEntryRepository;
//
//   @override
//   Future<IList<FieldUiModel>> fetchFormItems() async {
//     final IList<String>? sectionUids =
//         (await dataEntryRepository?.sectionUids())?.lock;
//
//     final IList<FieldUiModel>? items =
//         (await dataEntryRepository?.list())?.lock;
//     final itemList = items ?? IList();
//
//     _formFieldsModel = _formFieldsModel.copyWith(
//         itemList: itemList,
//         backupList: itemList,
//         openedSectionUid: sectionUids != null && sectionUids.isNotEmpty
//             ? sectionUids.first
//             : null);
//     return composeList();
//   }
//
//   @override
//   Future<IList<FieldUiModel>> composeList() async {
//     _formFieldsModel = _formFieldsModel.copyWith(calculationLoop: 0);
//
//     return _mergeListWithErrorFields(
//             _formFieldsModel.itemList, _formFieldsModel.itemsWithError)
//         .then((IList<FieldUiModel> listOfItems) {
//           _calculateCompletionPercentage(listOfItems);
//           return listOfItems;
//         })
//         .then(
//             (IList<FieldUiModel> listOfItems) => _setOpenedSection(listOfItems))
//         .then((IList<FieldUiModel> listOfItems) => _setFocusedItem(listOfItems))
//         .then((IList<FieldUiModel> listOfItems) => _setLastItem(listOfItems));
//   }
//
//   @override
//   void updateSectionOpened(RowAction action) {
//     _formFieldsModel = _formFieldsModel.copyWith(openedSectionUid: action.id);
//   }
//
//   @override
//   void updateErrorList(RowAction action) {
//     if (action.error != null) {
//       if (_formFieldsModel.itemsWithError
//               .firstOrNullWhere((RowAction item) => item.id == action.id) ==
//           null) {
//         _formFieldsModel = _formFieldsModel.copyWith(
//             itemsWithError: _formFieldsModel.itemsWithError.add(action));
//       }
//     } else {
//       _formFieldsModel.itemsWithError
//           .firstOrNullWhere((RowAction item) => item.id == action.id)
//           ?.let((RowAction item) => _formFieldsModel =
//               _formFieldsModel.copyWith(
//                   itemsWithError:
//                       _formFieldsModel.itemsWithError.remove(item)));
//     }
//   }
//
//   @override
//   void setFieldRequestingCoordinates(String uid, bool requestInProcess) {
//     _formFieldsModel.itemList.let((IList<FieldUiModel> list) => list
//         .firstOrNullWhere((FieldUiModel item) => item.uid == uid)
//         ?.let((FieldUiModel item) => _formFieldsModel =
//             _formFieldsModel.copyWith(
//                 itemList: list.replace(list.indexOf(item),
//                     item.setIsLoadingData(requestInProcess)))));
//   }
//
//   /// only this methods needs to not notify sometimes
//   @override
//   Future<void> updateValueOnList(
//       String uid, String? value, ValueType? valueType) async {
//     final int itemIndex = _formFieldsModel.itemList
//         .indexWhere((FieldUiModel item) => item.uid == uid);
//     if (itemIndex >= 0) {
//       // TODO(NMC): improve
//       final FieldUiModel item = _formFieldsModel.itemList[itemIndex];
//       // _itemList = _itemList.replace(
//       //     itemIndex,
//       //     item.setValue(value).setDisplayName(await displayNameProvider
//       //         .provideDisplayName(valueType, value, item.optionSet)));
//       // /*   .setLegend(
//       //           legendValueProvider?.provideLegendValue(item.uid, value))*/
//       final displayName = await displayNameProvider.provideDisplayName(
//           valueType, value, item.optionSet);
//       _formFieldsModel = _formFieldsModel.copyWith(
//           itemList: _formFieldsModel.itemList.replace(
//               itemIndex, item.setValue(value).setDisplayName(displayName)));
//     }
//   }
//
//   Future<IList<FieldUiModel>> _mergeListWithErrorFields(
//       IList<FieldUiModel> list, IList<RowAction> fieldsWithError) async {
//     /// _mandatoryItemsWithoutValue.clear();
//     _formFieldsModel = _formFieldsModel.copyWith(
//         mandatoryItemsWithoutValue:
//             _formFieldsModel.mandatoryItemsWithoutValue.clear());
//
//     final List<FieldUiModel> mergedList =
//         await Future.wait<FieldUiModel>(list.map((FieldUiModel item) async {
//       if (item.mandatory && item.value == null) {
//         _formFieldsModel = _formFieldsModel.copyWith(
//             mandatoryItemsWithoutValue: _formFieldsModel
//                 .mandatoryItemsWithoutValue
//                 .update(item.label, (value) => item.programStageSection ?? ''));
//       }
//       final RowAction? action = fieldsWithError
//           .firstOrNullWhere((RowAction action) => action.id == item.uid);
//
//       if (action != null) {
//         final String? error = action.error != null
//             ? fieldErrorMessageProvider.getFriendlyErrorMessage(action.error!)
//             : null;
//
//         final String? displayName = await displayNameProvider
//             .provideDisplayName(action.valueType, action.value);
//         return item
//             .setValue(action.value)
//             .setError(error)
//             .setDisplayName(displayName);
//       } else {
//         return item;
//       }
//     }));
//     return mergedList.lock;
//   }
//
//   Future<IList<FieldUiModel>> _setOpenedSection(
//       IList<FieldUiModel> list) async {
//     IList<FieldUiModel> fields = IList([]);
//     for (final FieldUiModel field in list) {
//       if (field.isSection()) {
//         fields = fields.add(_updateSection(field, list));
//       } else {
//         final FieldUiModel item = await _updateField(field);
//         fields = fields.add(item);
//       }
//     }
//
//     return fields
//         .where((FieldUiModel field) =>
//             field.isSectionWithFields() ||
//             field.programStageSection == _formFieldsModel.openedSectionUid)
//         .toIList();
//   }
//
//   FieldUiModel _updateSection(
//       FieldUiModel sectionFieldUiModel, IList<FieldUiModel> fields) {
//     int total = 0;
//     int values = 0;
//     final bool isOpen =
//         sectionFieldUiModel.uid == _formFieldsModel.openedSectionUid;
//     fields
//         .where((FieldUiModel item) =>
//             item.programStageSection == sectionFieldUiModel.uid &&
//             item.valueType != null)
//         .forEach((FieldUiModel item) {
//       total++;
//       if (!item.value.isNullOrEmpty) {
//         values++;
//       }
//     });
//
//     const int
//         warningCount = /*ruleEffectsResult?.warningMap()?.filter { warning ->
//     fields.firstOrNull { field ->
//     field.uid == warning.key && field.programStageSection == sectionFieldUiModel.uid
//     } != null
//     }?.size ?: */
//         0;
//     //
//
//     final int mandatoryCount = _formFieldsModel.runDataIntegrity
//         ? _formFieldsModel.mandatoryItemsWithoutValue
//             .where((_, mandatory) => mandatory == sectionFieldUiModel.uid)
//             .length
//         : 0;
//
//     final int errorCount = IMap.fromIterable<String, String, FieldWithIssue>(
//       _getFieldsWithError(),
//       keyMapper: (it) => it.fieldUid,
//       valueMapper: (it) => it.message,
//     )
//         .where((key, value) =>
//             fields.firstOrNullWhere((FieldUiModel field) =>
//                 field.uid == key &&
//                 field.programStageSection == sectionFieldUiModel.uid) !=
//             null)
//         .length;
//
//     if (dataEntryRepository != null) {
//       return dataEntryRepository!.updateSection(sectionFieldUiModel, isOpen,
//           total, values, errorCount + mandatoryCount, warningCount);
//     }
//
//     return sectionFieldUiModel;
//   }
//
//   Future<FieldUiModel> _updateField(FieldUiModel fieldUiModel) async {
//     final bool needsMandatoryWarning =
//         fieldUiModel.mandatory && fieldUiModel.value == null;
//
//     if (needsMandatoryWarning) {
//       // _mandatoryItemsWithoutValue[fieldUiModel.label] =
//       //     fieldUiModel.programStageSection ?? '';
//       _formFieldsModel = _formFieldsModel.copyWith(
//           mandatoryItemsWithoutValue:
//               _formFieldsModel.mandatoryItemsWithoutValue.update(
//                   fieldUiModel.label,
//                   (value) => fieldUiModel.programStageSection ?? ''));
//     }
//
//     if (dataEntryRepository != null) {
//       return dataEntryRepository!.updateField(
//           fieldUiModel,
//           fieldErrorMessageProvider.mandatoryWarning().takeIf((_) =>
//               needsMandatoryWarning && _formFieldsModel.runDataIntegrity),
//           /*ruleEffectsResult?.optionsToHide(fieldUiModel.uid) ?:*/ [],
//           /*ruleEffectsResult?.optionGroupsToHide(fieldUiModel.uid) ?:*/ [],
//           /*ruleEffectsResult?.optionGroupsToShow(fieldUiModel.uid) ?:*/ []);
//     }
//
//     return fieldUiModel;
//     // return await dataEntryRepository?.updateField(
//     //         fieldUiModel,
//     //         fieldErrorMessageProvider
//     //             .mandatoryWarning()
//     //             .takeIf((_) => needsMandatoryWarning && _runDataIntegrity),
//     //         /*ruleEffectsResult?.optionsToHide(fieldUiModel.uid) ?:*/ [],
//     //         /*ruleEffectsResult?.optionGroupsToHide(fieldUiModel.uid) ?:*/ [],
//     //         /*ruleEffectsResult?.optionGroupsToShow(fieldUiModel.uid) ?:*/ []) ??
//     //     fieldUiModel;
//   }
//
//   IList<FieldWithIssue> _getFieldsWithError() {
//     return _formFieldsModel.itemsWithError.mapNotNull((RowAction? errorItem) {
//       final FieldUiModel? item = _formFieldsModel.itemList
//           .firstOrNullWhere((FieldUiModel item) => item.uid == errorItem?.id);
//       if (item != null) {
//         return FieldWithIssue(
//             fieldUid: item.uid,
//             fieldName: item.label,
//             issueType: IssueType.ERROR,
//             message: errorItem?.error != null
//                 ? fieldErrorMessageProvider
//                     .getFriendlyErrorMessage(errorItem!.error!)
//                 : '');
//       }
//       return null;
//     }).toIList();
//   }
//
//   IList<FieldUiModel> _setFocusedItem(IList<FieldUiModel> list) {
//     if (_formFieldsModel.focusedItemId != null) {
//       final FieldUiModel? item = list.firstOrNullWhere(
//           (FieldUiModel item) => item.uid == _formFieldsModel.focusedItemId);
//       if (item != null) {
//         list = list.replace(list.indexOf(item), item.setFocus());
//       }
//     }
//     return _formFieldsModel.itemList;
//   }
//
//   @override
//   void setFocusedItem(RowAction action) {
//     when(action.type, {
//       ActionType.ON_NEXT: () => _formFieldsModel =
//           _formFieldsModel.copyWith(focusedItemId: _getNextItem(action.id)),
//       ActionType.ON_FINISH: () =>
//           _formFieldsModel = _formFieldsModel.copyWith(focusedItemId: null),
//     }).orElse(() =>
//         _formFieldsModel = _formFieldsModel.copyWith(focusedItemId: action.id));
//   }
//
//   IList<FieldUiModel> _setLastItem(IList<FieldUiModel> list) {
//     if (list.isEmpty) {
//       return list;
//     }
//     if (list.every((FieldUiModel it) => it is SectionUiModelImpl)) {
//       final FieldUiModel lastItem = _getLastSectionItem(list);
//       if (_usesKeyboard(lastItem.valueType) &&
//           lastItem.valueType != ValueType.LONG_TEXT) {
//         return list.replace(
//             list.indexOf(lastItem), lastItem.setKeyBoardActionDone());
//       }
//     }
//     return list;
//   }
//
//   void _calculateCompletionPercentage(IList<FieldUiModel> list) {
//     const List<ValueType> unsupportedValueTypes = [
//       ValueType.FILE_RESOURCE,
//       ValueType.TRACKER_ASSOCIATE,
//       ValueType.USERNAME
//     ];
//
//     final Iterable<FieldUiModel> fields = list.where((FieldUiModel it) =>
//         it.valueType != null && !unsupportedValueTypes.contains(it.valueType));
//
//     final int totalFields = fields.length;
//     final int fieldsWithValue =
//         fields.where((FieldUiModel it) => it.value != null).length;
//     if (totalFields == 0) {
//       _formFieldsModel = _formFieldsModel.copyWith(completionPercentage: 0);
//     } else {
//       _formFieldsModel = _formFieldsModel.copyWith(
//           completionPercentage:
//               fieldsWithValue.toDouble() / totalFields.toDouble());
//     }
//   }
//
//   FieldUiModel _getLastSectionItem(IList<FieldUiModel> list) {
//     if (list.every((FieldUiModel item) => item is SectionUiModelImpl)) {
//       return list.reversed.first;
//     }
//     return list.reversed
//         .firstWhere((FieldUiModel item) => item.valueType != null);
//   }
//
//   bool _usesKeyboard(ValueType? valueType) {
//     return valueType != null &&
//         (valueType.isText || valueType.isNumeric || valueType.isInteger);
//   }
//
//   String? _getNextItem(String currentItemUid) {
//     _formFieldsModel.itemList.let((IList<FieldUiModel> fields) {
//       // final oldItem = fields.firstOrNullWhere((item) => item.uid == currentItemUid);
//       final int pos = fields
//           .indexWhere((FieldUiModel oldItem) => oldItem.uid == currentItemUid);
//       if (pos < fields.length - 1) {
//         return fields[pos + 1].uid;
//       }
//     });
//     return null;
//   }
//
//   @override
//   IList<FieldUiModel> backupOfChangedItems() {
//     // return backupList.minus(itemList.applyRuleEffects());
//     return _formFieldsModel.backupList;
//   }
//
//   @override
//   bool calculationLoopOverLimit() {
//     return _formFieldsModel.calculationLoop == _loopThreshold;
//   }
//
//   @override
//   void clearFocusItem() {
//     _formFieldsModel.copyWith(focusedItemId: null);
//   }
//
//   @override
//   double completedFieldsPercentage(IList<FieldUiModel> value) {
//     return _formFieldsModel.completionPercentage;
//   }
//
//   @override
//   FieldUiModel? currentFocusedItem() {
//     return _formFieldsModel.itemList.firstOrNullWhere(
//         (FieldUiModel item) => _formFieldsModel.focusedItemId == item.uid);
//   }
//
//   @override
//   void removeAllValues() {
//     _formFieldsModel = _formFieldsModel.copyWith(
//         itemList: _formFieldsModel.itemList
//             .map((FieldUiModel fieldUiModel) =>
//                 fieldUiModel.setValue(null).setDisplayName(null))
//             .toIList());
//   }
//
//   @override
//   DataIntegrityCheckResult runDataIntegrityCheck({required bool allowDiscard}) {
//     _formFieldsModel = _formFieldsModel.copyWith(runDataIntegrity: true);
//
//     final IList<FieldWithIssue> itemsWithErrors = _getFieldsWithError();
//     /*final*/
//     final IList<FieldWithIssue> itemsWithWarning = /*ruleEffectsResult?...??*/
//         IList([]);
//     // final DataIntegrityCheckResult result;
//     if (itemsWithErrors
//         .isNotEmpty /*|| ruleEffectsResult?.canComplete == false*/) {
//       return FieldsWithErrorResult(
//           mandatoryFields: _formFieldsModel.mandatoryItemsWithoutValue,
//           fieldUidErrorList: itemsWithErrors,
//           warningFields: itemsWithWarning,
//           canComplete: /*ruleEffectsResult?.canComplete ??*/ true,
//           onCompleteMessage: /*ruleEffectsResult?.messageOnComplete*/ null,
//           allowDiscard: allowDiscard);
//     }
//
//     if (_formFieldsModel.mandatoryItemsWithoutValue.isNotEmpty) {
//       return MissingMandatoryResult(
//           mandatoryFields: _formFieldsModel.mandatoryItemsWithoutValue,
//           errorFields: itemsWithErrors,
//           warningFields: itemsWithWarning,
//           canComplete: /*ruleEffectsResult?.canComplete ??*/ true,
//           onCompleteMessage: /*ruleEffectsResult?.messageOnComplete*/ null,
//           allowDiscard: allowDiscard);
//     }
//
//     if (itemsWithWarning.isNotEmpty) {
//       return FieldsWithWarningResult(
//           fieldUidWarningList: itemsWithWarning,
//           canComplete: /*ruleEffectsResult?.canComplete ??*/ true,
//           onCompleteMessage: /*ruleEffectsResult?.messageOnComplete*/ null);
//     }
//
//     if (backupOfChangedItems().isNotEmpty && allowDiscard) {
//       return const NotSavedResult();
//     }
//
//     return const SuccessfulResult(
//         canComplete: /*ruleEffectsResult?.canComplete ?? */ true,
//         onCompleteMessage: /*ruleEffectsResult?.messageOnComplete*/ null);
//   }
//
//   @override
//   Future<StoreResult?> save(String id, String? value, String? extraData) {
//     return formValueStore?.save(id, value, extraData) ??
//         Future<StoreResult?>.value();
//   }
// }
