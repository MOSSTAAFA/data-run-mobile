import 'package:d2_remote/core/program/section_rendering_type.dart';
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/metadata/option_set/entities/option_group.entity.dart';
import 'package:d2_remote/modules/metadata/option_set/entities/option_group_option.entity.dart';

import '../model/field_ui_model.dart';
import '../model/section_ui_model_impl.dart';
import '../ui/field_view_model_factory.dart';
import 'data_entry_repository.dart';

abstract class DataEntryBaseRepository implements DataEntryRepository {
  DataEntryBaseRepository(this.fieldFactory);

  // D2Remote d2;
  final FieldViewModelFactory fieldFactory;

  @override
  FieldUiModel updateSection(FieldUiModel sectionToUpdate, bool isSectionOpen,
      int totalFields, int fieldsWithValue, int errorCount, int warningCount) {
    return (sectionToUpdate as SectionUiModelImpl).copyWith(
        isOpen: isSectionOpen,
        totalFields: totalFields,
        completedFields: fieldsWithValue,
        errors: errorCount,
        warnings: warningCount);
  }

  @override
  Future<FieldUiModel> updateField(
      FieldUiModel fieldUiModel,
      String? warningMessage,
      List<String> optionsToHide,
      List<String> optionGroupsToHide,
      List<String> optionGroupsToShow) async {
    final List<String> optionsInGroupsToHide =
        await _optionsFromGroups(optionGroupsToHide);
    final List<String> optionsInGroupsToShow =
        await _optionsFromGroups(optionGroupsToShow);
    if (fieldUiModel.optionSet != null) {
      fieldUiModel.optionSetConfiguration?.updateOptionsToHideAndShow(
          optionsToHide: [...optionsToHide, ...optionsInGroupsToHide],
          optionsToShow: optionsInGroupsToShow);
    }

    return warningMessage != null
        ? fieldUiModel.setError(warningMessage)
        : fieldUiModel;
  }

  Future<List<String>> _optionsFromGroups(List<String> optionGroupUids) async {
    if (optionGroupUids.isEmpty) return [];
    final List<String> optionsFromGroups = [];
    final List<OptionGroup> optionGroups =
        await D2Remote.optionModule.optionGroup.byIds(optionGroupUids).get();
    for (final OptionGroup optionGroup in optionGroups) {
      for (final OptionGroupOption option in optionGroup.options! /*?? []*/) {
        if (option.id != null && !optionsFromGroups.contains(option.id)) {
          // optionsFromGroups.add(option.id!.split('_').last);
          optionsFromGroups.add(option.option);
        }
      }
    }
    return optionsFromGroups;
  }

  /// transform Section Entity to [SectionUiModelImpl] for the UI
  FieldUiModel transformSection(
      {required String sectionUid,
      String? sectionName,
      String? sectionDescription,
      bool isOpen = false,
      int totalFields = 0,
      int completedFields = 0}) {
    return fieldFactory.createSection(
        sectionUid,
        sectionName,
        sectionDescription,
        isOpen,
        totalFields,
        completedFields,
        SectionRenderingType.LISTING.name);
  }
}
