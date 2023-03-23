import 'package:d2_remote/core/program/section_rendering_type.dart';
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/metadata/option_set/entities/option_group.entity.dart';
import 'package:mass_pro/form/data/data_entry_repository.dart';
import 'package:mass_pro/form/model/field_ui_model.dart';
import 'package:mass_pro/form/ui/field_view_model_factory.dart';

abstract class DataEntryBaseRepository implements DataEntryRepository {
  // D2Remote d2;
  final FieldViewModelFactory fieldFactory;

  DataEntryBaseRepository(this.fieldFactory);

  @override
  FieldUiModel updateSection(FieldUiModel sectionToUpdate, bool isSectionOpen,
      int totalFields, int fieldsWithValue, int errorCount, int warningCount) {
    // TODO: implement updateSection
    throw UnimplementedError();
  }

  @override
  Future<FieldUiModel> updateField(
      FieldUiModel fieldUiModel,
      String? warningMessage,
      List<String> optionsToHide,
      List<String> optionGroupsToHide,
      List<String> optionGroupsToShow) async {
    List<String> optionsInGroupsToHide =
        await _optionsFromGroups(optionGroupsToHide);
    List<String> optionsInGroupsToShow =
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
    List<String> optionsFromGroups = [];
    List<OptionGroup> optionGroups =
        await D2Remote.optionModule.optionGroup.byIds(optionGroupUids).get();
    for (var optionGroup in optionGroups) {
      for (var option in optionGroup.options! /*?? []*/) {
        if (option.id != null && !optionsFromGroups.contains(option.id)) {
          // optionsFromGroups.add(option.id!.split('_').last);
          optionsFromGroups.add(option.option);
        }
      }
    }
    return optionsFromGroups;
  }

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
