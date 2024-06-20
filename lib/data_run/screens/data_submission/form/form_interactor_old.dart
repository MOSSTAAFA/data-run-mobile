// import 'package:d2_remote/d2_remote.dart';
// import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
// import 'package:equatable/equatable.dart';
// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:mass_pro/commons/date/field_with_issue.dart';
// import 'package:mass_pro/commons/helpers/iterable.dart';
// import 'package:mass_pro/data_run/screens/data_submission/form/form_input_field.model.dart';
// import 'package:mass_pro/data_run/screens/data_submission/form/form_states.dart';
// import 'package:mass_pro/data_run/screens/data_submission/form/input_action.dart';
// import 'package:mass_pro/data_run/screens/data_submission/form/syncable_data_entry_repository.dart';
// import 'package:mass_pro/data_run/utils/activity_type.dart';
// import 'package:mass_pro/form/ui/validation/field_error_message_provider.dart';
// import 'package:mass_pro/sdk/core/common/value_type.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// part 'form_interactor.g.dart';
//
// /// handle data fetching, saving, and updating operations.
// @riverpod
// class FormDataStateNotifier extends _$FormDataStateNotifier {
//   @override
//   FormDataState build() {
//     // final IList<FieldInputModel>? items =
//     //     await syncableDataEntryRepository?.list();
//     // state.copyWithPrevious(previous)
//     return FormDataState();
//   }
//
//   static const int _loopThreshold = 5;
//
//   Future<FormDataState> fetchFormItems() async {
//     FormDataState formDataState = FormDataState()
//         .setItemList(
//             await ref.watch(syncableDataEntryRepositoryProvider).list())
//         .setBackupList();
//     final IList<FieldInputModel>? items =
//         await ref.watch(syncableDataEntryRepositoryProvider).list();
//
//     formDataState = formDataState.setItemList(items);
//     formDataState = formDataState.setBackupList(items);
//     return _composeListInternal(formDataState);
//   }
//
//   Future<FormDataState> _composeListInternal(FormDataState formDataState) {
//     formDataState = formDataState.setCalculationLoop(0);
//
//     return _mergeListWithErrorFields(formDataState)
//         .then((FormDataState formDataState) =>
//             _calculateCompletionPercentage(formDataState))
//         .then((FormDataState formDataState) => _setOpenedSection(formDataState))
//         .then((FormDataState formDataState) => _setFocusedItem(formDataState))
//         .then((FormDataState formDataState) => _setLastItem(formDataState));
//   }
//
//   Future<void> composeList() async {
//     final FormDataState formDataState = state;
//     state = await _composeListInternal(formDataState);
//   }
//
//   Future<FormDataState> _mergeListWithErrorFields(
//       FormDataState formDataState) async {
//     // IList<FieldInputModel> list, IList<InputAction> fieldsWithError) async {
//     formDataState = formDataState.setMandatoryItemsWithoutValue(
//         formDataState.mandatoryItemsWithoutValue.clear());
//
//     final IList<FieldInputModel> mergedList =
//         // await Future.wait<FieldInputModel>(
//         formDataState.itemList.map((FieldInputModel item) {
//       if (item.mandatory && item.value == null) {
//         formDataState = formDataState.setMandatoryItemsWithoutValue(
//             formDataState.mandatoryItemsWithoutValue
//                 .add(item.label, /*item.programStageSection*/ ''));
//       }
//
//       final InputAction? action = formDataState.itemsWithError
//           .firstOrNullWhere((InputAction action) => action.id == item.key);
//
//       if (action != null) {
//         final String? error = action.error != null
//             ? ref
//                 .watch(_fieldErrorMessageProvider)
//                 .getFriendlyErrorMessage(action.error!)
//             : null;
//
//         // final String? displayName = await displayNameProvider
//         //     .provideDisplayName(action.valueType, action.value);
//         return item.setValue(action.value).setError(error);
//       } else {
//         return item;
//       }
//     }).toIList();
//
//     return formDataState.setItemList(mergedList);
//   }
//
//   // /// pure function doesn't effect this class variables
//   // /// runs at finishing data entry, either by clicking back key
//   // /// or save key, if there are errors it will notify in the UI
//   // DataIntegrityCheckResult runDataIntegrityCheck({required bool allowDiscard}) {
//   //   FormDataState formDataState = state.requireValue;
//   //
//   //   state = const AsyncValue.loading();
//   //
//   //   formDataState = formDataState.setRunDataIntegrity(true);
//   //
//   //   final IList<FieldWithIssue> itemsWithErrors =
//   //       _getFieldsWithError(formDataState);
//   //   /*final*/
//   //   final IList<FieldWithIssue> itemsWithWarning = IList([]);
//   //   if (itemsWithErrors.isNotEmpty) {
//   //     return FieldsWithErrorResult(
//   //         mandatoryFields: formDataState.mandatoryItemsWithoutValue,
//   //         fieldUidErrorList: itemsWithErrors,
//   //         warningFields: itemsWithWarning,
//   //         canComplete: /*ruleEffectsResult?.canComplete ??*/ true,
//   //         onCompleteMessage: /*ruleEffectsResult?.messageOnComplete*/ null,
//   //         allowDiscard: allowDiscard);
//   //   }
//   //
//   //   if (formDataState.mandatoryItemsWithoutValue.isNotEmpty) {
//   //     return MissingMandatoryResult(
//   //         mandatoryFields: formDataState.mandatoryItemsWithoutValue,
//   //         errorFields: itemsWithErrors,
//   //         warningFields: itemsWithWarning,
//   //         canComplete: /*ruleEffectsResult?.canComplete ??*/ true,
//   //         onCompleteMessage: /*ruleEffectsResult?.messageOnComplete*/ null,
//   //         allowDiscard: allowDiscard);
//   //   }
//   //
//   //   if (itemsWithWarning.isNotEmpty) {
//   //     return FieldsWithWarningResult(
//   //         fieldUidWarningList: itemsWithWarning,
//   //         canComplete: /*ruleEffectsResult?.canComplete ??*/ true,
//   //         onCompleteMessage: /*ruleEffectsResult?.messageOnComplete*/ null);
//   //   }
//   //
//   //   if (backupOfChangedItems().isNotEmpty && allowDiscard) {
//   //     return const NotSavedResult();
//   //   }
//   //
//   //   return const SuccessfulResult(
//   //       canComplete: /*ruleEffectsResult?.canComplete ?? */ true,
//   //       onCompleteMessage: /*ruleEffectsResult?.messageOnComplete*/ null);
//   // }
//
//   // IList<FieldInputModel> backupOfChangedItems() {
//   //   // return backupList.minus(itemList.applyRuleEffects());
//   //   return state.valueOrNull?.backupList ?? IList([]);
//   // }
//
//   // bool calculationLoopOverLimit() {
//   //   return state.valueOrNull?.calculationLoop == _loopThreshold;
//   // }
//
//   //
//   // Future<void> clearFocusItem() async {
//   //   state = await AsyncValue.guard(() async {
//   //     /// handle null
//   //     return Future.value(state.valueOrNull?.clearFocusedItem());
//   //   });
//   // }
//
//   //
//   // double completedFieldsPercentage(IList<FieldInputModel> value) {
//   //   return state.valueOrNull?.completionPercentage ?? 0.0;
//   // }
//
//   //
//   // FieldInputModel? currentFocusedItem() {
//   //   final focusedItemId = state.valueOrNull?.focusedItemId;
//   //   return state.valueOrNull?.itemList
//   //       .firstOrNullWhere((FieldInputModel item) => focusedItemId == item.key);
//   // }
//
//   // void removeAllValues() {
//   //   state.valueOrNull?.itemList = _itemList
//   //       .map((FieldInputModel fieldUiModel) =>
//   //           fieldUiModel.setValue(null).setDisplayName(null))
//   //       .toIList();
//   // }
//
//   // Future<StoreResult?> save(String id, String? value, String? extraData) {
//   //   final storeResult = formValueStore?.save(id, value, extraData) ??
//   //       Future<StoreResult?>.value();
//   //   return storeResult;
//   // }
//
//   void setFieldRequestingCoordinates(String uid, bool requestInProcess) {
//     // FormDataState formDataState = state.value!;
//     // // TODO(NMC): improve
//     //
//     // formDataState = formDataState.itemList.let((IList<FieldInputModel> list) =>
//     //         list
//     //             .firstOrNullWhere((FieldInputModel item) => item.key == uid)
//     //             ?.let((FieldInputModel item) => formDataState =
//     //                 formDataState.setItemList(list.replace(list.indexOf(item),
//     //                     item.setIsLoadingData(requestInProcess))))) ??
//     //     formDataState;
//     throw UnimplementedError();
//   }
//
//   // void setFocusedItem(InputAction action) {
//   //   when(action.type, {
//   //     ActionType.ON_NEXT: () => _focusedItemId = _getNextItem(action.id),
//   //     ActionType.ON_FINISH: () => _focusedItemId = null,
//   //   }).orElse(() => _focusedItemId = action.id);
//   // }
//
//   void updateErrorList(InputAction action) {
//     FormDataState formDataState = state;
//     if (action.error != null) {
//       if (formDataState.itemsWithError
//               .firstOrNullWhere((InputAction item) => item.id == action.id) ==
//           null) {
//         formDataState = formDataState
//             .setItemsWithError(formDataState.itemsWithError.add(action));
//       }
//     } else {
//       formDataState.itemsWithError
//           .firstOrNullWhere((InputAction item) => item.id == action.id)
//           ?.let((InputAction item) => formDataState = formDataState
//               .setItemsWithError(formDataState.itemsWithError.remove(item)));
//     }
//
//     state = formDataState;
//   }
//
//   // void updateSectionOpened(InputAction action) {
//   //   _openedSectionUid = action.id;
//   // }
//
//   Future<void> updateValueOnList(
//       String uid, String? value, ValueType? valueType) async {
//     // final int itemIndex =
//     //     _itemList.indexWhere((FieldInputModel item) => item.uid == uid);
//     // if (itemIndex >= 0) {
//     //   // TODO(NMC): improve
//     //   final FieldInputModel item = _itemList[itemIndex];
//     //   _itemList = _itemList.replace(
//     //       itemIndex,
//     //       item.setValue(value).setDisplayName(await displayNameProvider
//     //           .provideDisplayName(valueType, value, item.optionSet)));
//     //   /*   .setLegend(
//     //             legendValueProvider?.provideLegendValue(item.uid, value))*/
//     // }
//     throw UnimplementedError();
//   }
//
//   FormDataState _calculateCompletionPercentage(FormDataState formDataState) {
//     const List<ValueType> unsupportedValueTypes = [
//       ValueType.FileResource,
//       ValueType.TrackerAssociate,
//       ValueType.Username
//     ];
//
//     final Iterable<FieldInputModel> fields = formDataState.itemList.where(
//         (FieldInputModel it) =>
//             it.valueType != null &&
//             !unsupportedValueTypes.contains(it.valueType));
//
//     final int totalFields = fields.length;
//     final int fieldsWithValue =
//         fields.where((FieldInputModel it) => it.value != null).length;
//     if (totalFields == 0) {
//       return formDataState.setCompletionPercentage(0);
//     } else {
//       return formDataState.setCompletionPercentage(
//           fieldsWithValue.toDouble() / totalFields.toDouble());
//     }
//   }
//
//   Future<FormDataState> _setOpenedSection(FormDataState formDataState) async {
//     IList<FieldInputModel> fields = IList([]);
//     for (final FieldInputModel field in formDataState.itemList) {
//       // if (field.isSection()) {
//       //   fields.add(_updateSection(field, list));
//       // } else {
//       final FieldInputModel item = await _updateField(field);
//       fields = fields.add(item);
//       // }
//     }
//
//     return formDataState.setItemList(fields);
//   }
//
//   // FieldInputModel _updateSection(
//   //     FieldInputModel sectionFieldUiModel, IList<FieldInputModel> fields) {
//   //   int total = 0;
//   //   int values = 0;
//   //   final bool isOpen = sectionFieldUiModel.uid == _openedSectionUid;
//   //   fields
//   //       .where((FieldInputModel item) =>
//   //           item.programStageSection == sectionFieldUiModel.uid &&
//   //           item.valueType != null)
//   //       .forEach((FieldInputModel item) {
//   //     total++;
//   //     if (!item.value.isNullOrEmpty) {
//   //       values++;
//   //     }
//   //   });
//   //
//   //   const int
//   //       warningCount = /*ruleEffectsResult?.warningMap()?.filter { warning ->
//   //   fields.firstOrNull { field ->
//   //   field.uid == warning.key && field.programStageSection == sectionFieldUiModel.uid
//   //   } != null
//   //   }?.size ?: */
//   //       0;
//   //   //
//   //
//   //   final int mandatoryCount = _runDataIntegrity
//   //       ? _mandatoryItemsWithoutValue
//   //           .where((_, mandatory) => mandatory == sectionFieldUiModel.uid)
//   //           .length
//   //       : 0;
//   //
//   //   final int errorCount = IMap.fromIterable<String, String, FieldWithIssue>(
//   //     _getFieldsWithError(),
//   //     keyMapper: (it) => it.fieldUid,
//   //     valueMapper: (it) => it.message,
//   //   )
//   //       .where((key, value) =>
//   //           fields.firstOrNullWhere((FieldInputModel field) =>
//   //               field.uid == key &&
//   //               field.programStageSection == sectionFieldUiModel.uid) !=
//   //           null)
//   //       .length;
//   //
//   //   if (syncableDataEntryRepository != null) {
//   //     return syncableDataEntryRepository!.updateSection(sectionFieldUiModel,
//   //         isOpen, total, values, errorCount + mandatoryCount, warningCount);
//   //   }
//   //
//   //   return sectionFieldUiModel;
//   // }
//
//   FutureOr<FieldInputModel> _updateField(FieldInputModel fieldUiModel) {
//     // final FormDataState formDataState = state;
//     IMap<String, String> mandatoryItemsWithoutValue =
//         state.mandatoryItemsWithoutValue;
//
//     final bool needsMandatoryWarning =
//         fieldUiModel.mandatory && fieldUiModel.value == null;
//
//     if (needsMandatoryWarning) {
//       mandatoryItemsWithoutValue = mandatoryItemsWithoutValue.add(
//           fieldUiModel.label, /*fieldUiModel.programStageSection ??*/ '');
//     }
//
//     if (ref.watch(syncableDataEntryRepositoryProvider) != null) {
//       final mandatoryWarning = needsMandatoryWarning && state.runDataIntegrity
//           ? ref.watch(_fieldErrorMessageProvider).mandatoryWarning()
//           : null;
//       return ref.watch(syncableDataEntryRepositoryProvider).updateField(
//             fieldUiModel,
//             mandatoryWarning,
//             // /*ruleEffectsResult?.optionsToHide(fieldUiModel.uid) ?:*/ [],
//             // /*ruleEffectsResult?.optionGroupsToHide(fieldUiModel.uid) ?:*/ [],
//             // /*ruleEffectsResult?.optionGroupsToShow(fieldUiModel.uid) ?:*/ []
//           );
//     }
//     return fieldUiModel;
//   }
//
//   IList<FieldWithIssue> _getFieldsWithError(/*FormDataState formDataState*/) {
//     // final FormDataState formDataState = state.value!;
//     return state.itemsWithError.mapNotNull((InputAction? errorItem) {
//       final FieldInputModel? item = state.itemList.firstOrNullWhere(
//           (FieldInputModel item) => item.key == errorItem?.id);
//       if (item != null) {
//         return FieldWithIssue(
//             fieldUid: item.key,
//             fieldName: item.label,
//             issueType: IssueType.ERROR,
//             message: errorItem?.error != null
//                 ? ref
//                     .watch(_fieldErrorMessageProvider)
//                     .getFriendlyErrorMessage(errorItem!.error!)
//                 : '');
//       }
//       return null;
//     }).toIList();
//   }
//
//   FormDataState _setFocusedItem(FormDataState formDataState) {
//     if (formDataState.focusedItemId != null) {
//       final FieldInputModel? item = formDataState.itemList.firstOrNullWhere(
//           (FieldInputModel item) => item.key == formDataState.focusedItemId);
//       if (item != null) {
//         formDataState = formDataState.setItemList(formDataState.itemList
//             .replace(formDataState.itemList.indexOf(item), item.setFocus()));
//         // list = list.replace(list.indexOf(item), item.setFocus());
//       }
//     }
//     return formDataState;
//   }
//
//   FormDataState _setLastItem(FormDataState formDataState) {
//     if (formDataState.itemList.isEmpty) {
//       return formDataState;
//     }
//     // if (formDataState.itemList.every((FieldInputModel it) => it is SectionUiModelImpl)) {
//     //   final FieldInputModel lastItem = _getLastSectionItem(list);
//     //   if (_usesKeyboard(lastItem.valueType) &&
//     //       lastItem.valueType != ValueType.LongText) {
//     //     return list.replace(
//     //         list.indexOf(lastItem), lastItem.setKeyBoardActionDone());
//     //   }
//     // }
//     return formDataState;
//   }
//
//   FieldInputModel _getLastSectionItem(IList<FieldInputModel> list) {
//     // if (list.every((FieldInputModel item) => item is SectionUiModelImpl)) {
//     //   return list.reversed.first;
//     // }
//     return list.reversed
//         .firstWhere((FieldInputModel item) => item.valueType != null);
//   }
//
//   bool _usesKeyboard(ValueType? valueType) {
//     return valueType != null
//         ? valueType.isText || valueType.isNumeric || valueType.isInteger
//         : false;
//   }
//
//   String? _getNextItem(String currentItemUid) {
//     // final FormDataState formDataState = state.value!;
//     state.itemList.let((IList<FieldInputModel> fields) {
//       // final oldItem = fields.firstOrNullWhere((item) => item.uid == currentItemUid);
//       final int pos = fields.indexWhere(
//           (FieldInputModel oldItem) => oldItem.key == currentItemUid);
//       if (pos < fields.length - 1) {
//         return fields[pos + 1].key;
//       }
//     });
//     return null;
//   }
// }
//
// class SyncableFormRecords with EquatableMixin {
//   SyncableFormRecords({required this.uid, required this.activityType});
//
//   final String uid;
//   final ActivityType activityType;
//
//   SyncableFormRecords copyWith({String? uid, ActivityType? activityType}) {
//     return SyncableFormRecords(
//         uid: uid ?? this.uid, activityType: activityType ?? this.activityType);
//   }
//
//   @override
//   List<Object?> get props {
//     return [uid, activityType];
//   }
// }
//
// /// Other Providers
// ///
// ///
// @riverpod
// SyncableFormRecords syncableFormRecords(SyncableFormRecordsRef ref) {
//   throw UnimplementedError(
//       'You need to override record information in order to persist your data');
// }
//
// @riverpod
// SyncableDataEntryRepository syncableDataEntryRepository(
//     SyncableDataEntryRepositoryRef ref) {
//   final records = ref.watch(syncableFormRecordsProvider);
//
//   switch (records.activityType) {
//     case ActivityType.CHV_PATIENT:
//       return ChvPatientDataEntryRepository(
//           syncableQuery: D2Remote.iccmModule.chvRegister,
//           entityUid: records.uid);
//     case ActivityType.CHV_SESSION:
//       return ChvSessionDataEntryRepository(
//           syncableQuery: D2Remote.iccmModule.chvSession,
//           entityUid: records.uid);
//     case ActivityType.ITN:
//       return ItnsDataEntryRepository(
//           syncableQuery: D2Remote.itnsVillageModule.itnsVillage,
//           entityUid: records.uid);
//     default:
//   }
//   return ItnsDataEntryRepository(
//       syncableQuery: D2Remote.itnsVillageModule.itnsVillage,
//       entityUid: records.uid);
// }
//
// @riverpod
// FieldErrorMessageProvider _fieldErrorMessage(_FieldErrorMessageRef ref) {
//   return const FieldErrorMessageProvider();
// }
