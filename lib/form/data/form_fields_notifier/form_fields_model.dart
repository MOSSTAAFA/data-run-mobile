// part of 'form_fields_model_repository.dart';
//
// @immutable
// class _FormRepositoryModel with EquatableMixin {
//   const _FormRepositoryModel({
//     this.openedSectionUid,
//     this.focusedItemId,
//     this.completionPercentage = 0.0,
//     this.itemsWithError = const IListConst([]),
//     this.mandatoryItemsWithoutValue = const IMapConst({}),
//     this.itemList = const IListConst([]),
//     this.runDataIntegrity = false,
//     this.calculationLoop = 0,
//     this.backupList = const IListConst([]),
//   });
//
//   static const int loopThreshold = 5;
//
//   // private
//   final double completionPercentage;
//
//   // private
//   final IList<RowAction> itemsWithError;
//
//   // private
//   // final Map<String, String> mandatoryItemsWithoutValue;
//   final IMap<String, String> mandatoryItemsWithoutValue;
//
//   // private
//   final String? openedSectionUid;
//
//   // private
//   final IList<FieldUiModel> itemList;
//
//   // private
//   final String? focusedItemId;
//
//   // RuleUtilsProviderResult? ruleEffectsResult;
//   // private
//   final bool runDataIntegrity;
//
//   // private
//   final int calculationLoop;
//
//   // private
//   final IList<FieldUiModel> backupList;
//
//   _FormRepositoryModel copyWith({
//     double? completionPercentage,
//     IList<RowAction>? itemsWithError,
//     IMap<String, String>? mandatoryItemsWithoutValue,
//     String? openedSectionUid,
//     IList<FieldUiModel>? itemList,
//     String? focusedItemId,
//     bool? runDataIntegrity,
//     int? calculationLoop,
//     IList<FieldUiModel>? backupList,
//   }) {
//     return _FormRepositoryModel(
//       completionPercentage: completionPercentage ?? this.completionPercentage,
//       itemsWithError: itemsWithError ?? this.itemsWithError,
//       mandatoryItemsWithoutValue:
//           mandatoryItemsWithoutValue ?? this.mandatoryItemsWithoutValue,
//       openedSectionUid: openedSectionUid ?? this.openedSectionUid,
//       itemList: itemList ?? this.itemList,
//       focusedItemId: focusedItemId ?? this.focusedItemId,
//       runDataIntegrity: runDataIntegrity ?? this.runDataIntegrity,
//       calculationLoop: calculationLoop ?? this.calculationLoop,
//       backupList: backupList ?? this.backupList,
//     );
//   }
//
//   @override
//   List<Object?> get props {
//     return [
//       completionPercentage,
//       itemsWithError,
//       mandatoryItemsWithoutValue,
//       openedSectionUid,
//       itemList,
//       focusedItemId,
//       runDataIntegrity,
//       calculationLoop,
//       // backupList,
//     ];
//   }
//
//   @override
//   bool? get stringify => true;
// }
