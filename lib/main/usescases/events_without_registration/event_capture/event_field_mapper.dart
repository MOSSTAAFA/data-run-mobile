// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:d2_remote/core/common/value_type.dart';

import '../../../../commons/extensions/standard_extensions.dart';
import '../../../../commons/extensions/string_extension.dart';
import '../../../../commons/helpers/collections.dart';
import '../../../../commons/helpers/iterable.dart';
import '../../../../commons/helpers/map.dart';
import '../../../../form/data/form_section_view_model.dart';
import '../../../../form/model/field_ui_model.dart';
import '../../../../form/model/section_ui_model_impl.dart';
import '../../../../form/ui/field_view_model_factory.dart';
import 'event_section_model.dart';

class EventFieldMapper {
  EventFieldMapper(
      {required FieldViewModelFactory fieldFactory,
      required String mandatoryFieldWarning})
      : _fieldFactory = fieldFactory,
        _mandatoryFieldWarning = mandatoryFieldWarning;

  final FieldViewModelFactory _fieldFactory;
  final String _mandatoryFieldWarning;

  int totalFields = 0;
  int unsupportedFields = 0;
  late final List<String?> _visualDataElements;
  late final Map<String?, List<FieldUiModel>> _fieldMap;
  late final List<EventSectionModel> _eventSectionModels;
  late final List<FieldUiModel> _finalFieldList;
  late final Map<String, bool> _finalFields;

  Pair<List<EventSectionModel>, List<FieldUiModel>> map(
      List<FieldUiModel> fields,
      List<FormSectionViewModel> sectionList,
      String currentSection,
      Map<String, String> errors,
      Map<String, String> warnings,
      Map<String, FieldUiModel> emptyMandatoryFields,
      Pair<bool, bool> showErrors) {
    _clearAll();
    _setFieldMap(fields, sectionList, showErrors.first, emptyMandatoryFields);
    sectionList.forEach((FormSectionViewModel it) =>
        _handleSection(fields, sectionList, it, currentSection));

    if (_eventSectionModels.first.sectionName == 'NO_SECTION') {
      _finalFieldList.add(_fieldFactory.createClosingSection());
    }

    final Iterable<SectionUiModelImpl> sections =
        _finalFieldList.whereType<SectionUiModelImpl>();

    sections
        .takeIf((value) => showErrors.first || showErrors.second)
        ?.forEach((section) {
      int errorCounter = 0;
      int mandatoryCounter = 0;
      if (showErrors.first) {
        repeat(
            warnings
                    .filter((MapEntry<String, String> warning) =>
                        fields.firstOrNullWhere((FieldUiModel field) =>
                            field.uid == warning.key &&
                            field.programStageSection == section.uid) !=
                        null)
                    .length +
                emptyMandatoryFields
                    .filter((it) => it.value.programStageSection == section.uid)
                    .length,
            (index) => mandatoryCounter++);
      }
      if (showErrors.second) {
        repeat(
            errors
                .filter((MapEntry<String, String> error) =>
                    fields.firstOrNullWhere((FieldUiModel field) =>
                        field.uid == error.key &&
                        field.programStageSection == section.uid) !=
                    null)
                .length,
            (index) => errorCounter++);
      }
      _finalFieldList[_finalFieldList.indexOf(section)] = section.apply((it) {
        late FieldUiModel sm;
        if (errorCounter != 0) {
          // it.errors = errorCounter;
          sm = it.copyWith(errors: errorCounter);
        } else {
          // it.errors = 0;
          sm = it.copyWith(errors: 0);
        }
        if (mandatoryCounter != 0) {
          // it.warnings = mandatoryCounter;
          sm = sm.copyWith(warnings: mandatoryCounter);
        } else {
          // it.warnings = 0;
          sm = sm.copyWith(warnings: 0);
        }
      });
    });

    return Pair<List<EventSectionModel>, List<FieldUiModel>>(
        _eventSectionModels, _finalFieldList);
  }

  void _clearAll() {
    totalFields = 0;
    unsupportedFields = 0;
    _visualDataElements = [];
    _fieldMap = {};
    _eventSectionModels = [];
    _finalFieldList = [];
    _finalFields = {};
  }

  void _setFieldMap(
      List<FieldUiModel> fields,
      List<FormSectionViewModel> sectionList,
      bool showMandatoryErrors,
      Map<String, FieldUiModel> emptyMandatoryFields) {
    for (final FieldUiModel field in fields) {
      final String fieldSection = _getFieldSection(field);
      if (fieldSection.isNotEmpty || sectionList.length == 1) {
        _updateFieldMap(
            fieldSection,
            showMandatoryErrors && emptyMandatoryFields.containsKey(field.uid)
                ? field.setWarning(_mandatoryFieldWarning)
                : field);

        if (_fieldIsNotVisualOptionSet(field)) {
          totalFields++;
        } else if (!_visualDataElements.contains(field.uid)) {
          _visualDataElements.add(field.uid);
          totalFields++;
        }
        if (_isUnsupported(field.valueType)) {
          totalFields--;
        }
      }
    }
  }

  String _getFieldSection(FieldUiModel field) =>
      field.programStageSection ?? '';

  void _updateFieldMap(String fieldSection, FieldUiModel field) {
    if (!_fieldMap.containsKey(fieldSection)) {
      _fieldMap[fieldSection] = [];
    }
    _fieldMap[fieldSection]!.add(field);
  }

  void _handleSection(
      List<FieldUiModel> fields,
      List<FormSectionViewModel> sectionList,
      FormSectionViewModel sectionModel,
      String section) {
    if (_isValidMultiSection(sectionList, sectionModel)) {
      _handleMultiSection(sectionModel, section);
    } else if (_isValidSingleSection(sectionList, sectionModel)) {
      _handleSingleSection(fields, sectionModel);
    }
  }

  bool _isValidMultiSection(List<FormSectionViewModel> sectionList,
      FormSectionViewModel sectionModel) {
    return sectionList.isNotEmpty && sectionModel.sectionUid!.isNotEmpty;
  }

  bool _isValidSingleSection(List<FormSectionViewModel> sectionList,
      FormSectionViewModel sectionModel) {
    return sectionList.length == 1 && sectionModel.sectionUid?.isEmpty == true;
  }

  void _handleMultiSection(FormSectionViewModel sectionModel, String section) {
    final fieldViewModels = <FieldUiModel>[];
    if (_fieldMap[sectionModel.sectionUid] != null) {
      fieldViewModels.addAll(_fieldMap[sectionModel.sectionUid]!);
    }

    _finalFields = {};
    for (final FieldUiModel fieldViewModel in fieldViewModels) {
      _finalFields[fieldViewModel.uid] = !fieldViewModel.value.isNullOrEmpty;
    }

    int cont = 0;
    for (final String key in _finalFields.keys) {
      if (_finalFields[key] == true) {
        cont++;
      }
    }
    _eventSectionModels.add(
        // {required this.sectionName,
        //   required this.sectionUid,
        //   required this.numberOfCompletedFields,
        //   required this.numberOfTotalFields});
        EventSectionModel(
            sectionName: sectionModel.label!,
            sectionUid: sectionModel.sectionUid!,
            numberOfCompletedFields: cont,
            numberOfTotalFields: _finalFields.keys.length));
    final bool isOpen = sectionModel.sectionUid == section;
    if (_fieldMap[sectionModel.sectionUid]?.isNotEmpty ?? false) {
      _finalFieldList.add(_fieldFactory.createSection(
          sectionModel.sectionUid!,
          sectionModel.label,
          '',
          isOpen,
          _finalFields.keys.length,
          cont,
          sectionModel.renderType));
    }
    if (isOpen && _fieldMap[sectionModel.sectionUid] != null) {
      _finalFieldList.addAll(_fieldMap[sectionModel.sectionUid]!);
    }
  }

  void _handleSingleSection(
      List<FieldUiModel> fields, FormSectionViewModel sectionModel) {
    for (final FieldUiModel fieldViewModel in fields) {
      _finalFields[fieldViewModel.uid] = !fieldViewModel.value.isNullOrEmpty;
    }

    int cont = 0;
    for (final String key in _finalFields.keys) {
      if (_finalFields[key] == true) {
        cont++;
      }
    }
    _eventSectionModels.add(EventSectionModel(
        sectionName: 'NO_SECTION',
        sectionUid: 'no_section',
        numberOfCompletedFields: cont,
        numberOfTotalFields: _finalFields.keys.length));

    /// NMC try adding only if not null
    _finalFieldList.addAll(_fieldMap[sectionModel.sectionUid] ?? []);
  }

  bool _fieldIsNotVisualOptionSet(FieldUiModel field) {
    return field.optionSet == null ||
        field.renderingType?.isVisualOptionSet == false;
  }

  double completedFieldsPercentage() {
    final int completedFields = _eventSectionModels
        .sumBy((EventSectionModel it) => it.numberOfCompletedFields);
    return _calculateCompletionPercentage(completedFields, totalFields);
  }

  bool _isUnsupported(ValueType? type) {
    return when(type, {
      [
        ValueType.TRACKER_ASSOCIATE,
        ValueType.USERNAME,
        ValueType.FILE_RESOURCE
      ]: () => true,
    }).orElse(() => false);
  }

  double _calculateCompletionPercentage(int completedFields, int totals) {
    if (totals == 0) {
      return 100;
    } else {
      return completedFields.toDouble() / totals.toDouble();
    }
  }
}
