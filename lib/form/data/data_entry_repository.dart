import 'dart:async';

import '../model/field_ui_model.dart';

abstract class DataEntryRepository {
  Future<List<FieldUiModel>> list();

  Future<List<String>> sectionUids();

  FieldUiModel updateSection(FieldUiModel sectionToUpdate, bool isSectionOpen,
      int totalFields, int fieldsWithValue, int errorCount, int warningCount);

  Future<FieldUiModel> updateField(
      FieldUiModel fieldUiModel,
      String? warningMessage,
      List<String> optionsToHide,
      List<String> optionGroupsToHide,
      List<String> optionGroupsToShow);

  bool isEvent();
}
