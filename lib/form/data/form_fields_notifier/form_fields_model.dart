// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';

import '../../model/field_ui_model.dart';
import '../../model/row_action.dart';

@immutable
class FormFieldsModel with EquatableMixin {
  FormFieldsModel({
    this.openedSectionUid,
    this.focusedItemId,
    this.completionPercentage = 0.0,
    this.itemsWithError = const IListConst([]),
    this.mandatoryItemsWithoutValue = const IMapConst({}),
    this.itemList = const IListConst([]),
    this.runDataIntegrity = false,
    this.calculationLoop = 0,
    this.backupList = const IListConst([]),
  });

  static const int loopThreshold = 5;

  // private
  final double completionPercentage;

  // private
  final IList<RowAction> itemsWithError;

  // private
  // final Map<String, String> mandatoryItemsWithoutValue;
  final IMap<String, String> mandatoryItemsWithoutValue;

  // private
  final String? openedSectionUid;

  // private
  final IList<FieldUiModel> itemList;

  // private
  final String? focusedItemId;

  // RuleUtilsProviderResult? ruleEffectsResult;
  // private
  final bool runDataIntegrity;

  // private
  final int calculationLoop;

  // private
  final IList<FieldUiModel> backupList;

  FormFieldsModel copyWith({
    double? completionPercentage,
    IList<RowAction>? itemsWithError,
    IMap<String, String>? mandatoryItemsWithoutValue,
    String? openedSectionUid,
    IList<FieldUiModel>? itemList,
    String? focusedItemId,
    bool? runDataIntegrity,
    int? calculationLoop,
    IList<FieldUiModel>? backupList,
  }) {
    return FormFieldsModel(
      completionPercentage: completionPercentage ?? this.completionPercentage,
      itemsWithError: itemsWithError ?? this.itemsWithError,
      mandatoryItemsWithoutValue:
          mandatoryItemsWithoutValue ?? this.mandatoryItemsWithoutValue,
      openedSectionUid: openedSectionUid ?? this.openedSectionUid,
      itemList: itemList ?? this.itemList,
      focusedItemId: focusedItemId ?? this.focusedItemId,
      runDataIntegrity: runDataIntegrity ?? this.runDataIntegrity,
      calculationLoop: calculationLoop ?? this.calculationLoop,
      backupList: backupList ?? this.backupList,
    );
  }

  @override
  List<Object?> get props {
    return [
      completionPercentage,
      itemsWithError,
      mandatoryItemsWithoutValue,
      openedSectionUid,
      itemList,
      focusedItemId,
      runDataIntegrity,
      calculationLoop,
      // backupList,
    ];
  }

  @override
  bool? get stringify => true;
}
