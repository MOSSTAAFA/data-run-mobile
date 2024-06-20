import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/data_submission/form/form_input_field.model.dart';
import 'package:mass_pro/data_run/screens/data_submission/form/input_action.dart';

@immutable
class FormDataState with EquatableMixin {
  FormDataState({
    this.itemsWithError = const IListConst([]),
    this.mandatoryItemsWithoutValue = const IMapConst({}),
    this.backupList = const IListConst([]),
    this.itemList = const IListConst([]),
    this.focusedItemId,
    this.completionPercentage = 0.0,
    this.runDataIntegrity = false,
    this.calculationLoop = 0,
  });

  final IList<InputAction> itemsWithError;
  final IMap<String, String> mandatoryItemsWithoutValue;
  final IList<FieldInputModel> backupList;
  final IList<FieldInputModel> itemList;
  final String? focusedItemId;
  final double completionPercentage;
  final bool runDataIntegrity;
  final int calculationLoop;

  FormDataState copyWith(
      {IList<InputAction>? itemsWithError,
      IMap<String, String>? mandatoryItemsWithoutValue,
      IList<FieldInputModel>? backupList,
      String? focusedItemId,
      IList<FieldInputModel>? itemList,
      double? completionPercentage,
      bool? runDataIntegrity,
      bool clearFocusedItem = false,
      int? calculationLoop}) {
    return FormDataState(
        itemsWithError: itemsWithError ?? this.itemsWithError,
        mandatoryItemsWithoutValue:
            mandatoryItemsWithoutValue ?? this.mandatoryItemsWithoutValue,
        backupList: backupList ?? this.backupList,
        focusedItemId:
            clearFocusedItem ? null : focusedItemId ?? this.focusedItemId,
        itemList: itemList ?? this.itemList,
        completionPercentage: completionPercentage ?? this.completionPercentage,
        runDataIntegrity: runDataIntegrity ?? this.runDataIntegrity,
        calculationLoop: calculationLoop ?? this.calculationLoop);
  }

  FormDataState setItemList(IList<FieldInputModel>? itemList) =>
      copyWith(itemList: itemList);

  FormDataState setBackupList([IList<FieldInputModel>? backupList]) =>
      copyWith(backupList: backupList ?? itemList);

  FormDataState setItemsWithError(IList<InputAction>? itemsWithError) =>
      copyWith(itemsWithError: itemsWithError);

  FormDataState setMandatoryItemsWithoutValue(
          IMap<String, String>? mandatoryItemsWithoutValue) =>
      copyWith(mandatoryItemsWithoutValue: mandatoryItemsWithoutValue);

  FormDataState setCompletionPercentage(double? completionPercentage) =>
      copyWith(completionPercentage: completionPercentage);

  FormDataState setRunDataIntegrity(bool? runDataIntegrity) =>
      copyWith(runDataIntegrity: runDataIntegrity);

  FormDataState setCalculationLoop(int? calculationLoop) =>
      copyWith(calculationLoop: calculationLoop);

  FormDataState setFocusedItemId(String? focusedItemId) =>
      copyWith(focusedItemId: focusedItemId);

  FormDataState clearFocusedItem() => copyWith(clearFocusedItem: true);

  @override
  List<Object?> get props {
    return [itemList];
  }
}
