import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/data_run/screens/form/model/option_configuration.dart';
import 'package:mass_pro/data_run/screens/form/model/q_field.model.dart';
import 'package:mass_pro/form/model/key_board_action_type.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';
import 'package:mass_pro/sdk/core/program/section_rendering_type.dart';

class QSectionFieldModel extends QFieldModel with EquatableMixin {
  QSectionFieldModel(
      {Map<String, dynamic>? valuesMap,
      String? optionListName,
      OptionConfiguration? optionConfiguration,
      List<String>? autocompleteList,
      bool? allowFutureDates,
      String? value,
      IList<String>? values,
      bool isEditable = true,
      String? warning,
      bool isMandatory = false,
      required String label,
      String? hint,
      String? description,
      required String uid,
      IList<Rule>? fieldRules,
      bool isFocused = false,
      String? error,
      bool isVisible = true,
      String? displayName,
      ValueType? valueType,
      bool isLoading = false,
      IntentCallback? intentCallback,
      KeyboardActionType? keyboardActionType,
      this.isOpen = false,
      this.totalFields = 0,
      this.completedFields = 0,
      this.errors = 0,
      this.warnings = 0,
      this.sectionRenderingType,
      /// sequential when repeatable
      this.sectionNumber = 0})
      : this.valuesMap = IMap.orNull(valuesMap) ?? IMap(),
        super(
            uid: uid,
            values: values,
            value: value,
            optionListName: optionListName,
            optionConfiguration: optionConfiguration,
            label: label,
            isEditable: isEditable,
            isFocused: isFocused,
            warning: warning,
            isMandatory: isMandatory,
            hint: hint,
            description: description,
            displayName: displayName,
            fieldRules: fieldRules,
            error: error,
            isVisible: isVisible,
            allowFutureDates: allowFutureDates,
            keyboardActionType: keyboardActionType,
            valueType: valueType,
            isLoading: isLoading,
            intentCallback: intentCallback);

  final IMap<String, dynamic> valuesMap;

  final SectionRenderingType? sectionRenderingType;

  final bool isOpen;
  final int totalFields;
  final int completedFields;
  final int errors;
  final int warnings;

  /// sequential when repeatable
  final int sectionNumber;

  @override
  String get formattedLabel => label;

  bool get hasErrorAndWarnings => errors > 0 && warnings > 0;

  bool get hasNotAnyErrorOrWarning => errors == 0 && warnings == 0;

  bool get hasOnlyErrors => errors > 0 && warnings == 0;

  String get getFormattedSectionFieldsInfo => '$completedFields/$totalFields';

  bool get areAllFieldsCompleted => completedFields == totalFields;

  // @override
  // void onItemClick() {
  //   intentCallback?.call(FormIntent.onFocus(uid, value));
  // }

  QSectionFieldModel setSectionNumber(int sectionNumber) {
    return copyWith(sectionNumber: sectionNumber);
  }

  QSectionFieldModel setShowBottomShadow(bool showBottomShadow) {
    return copyWith(showBottomShadow: showBottomShadow);
  }

  @override
  void onNext() {}

  @override
  void onTextChange(String? value) {}

  @override
  void onClear() {}

  @override
  void onSave(String? value) {}

  @override
  void onSaveOptions(List<FormOption>? option) {}

  @override
  void onSaveDate(DateTime? date) {}

  QSectionFieldModel copyWith({
    String? uid,
    Map<String, dynamic>? valuesMap,
    bool? isVisible,
    String? error,
    bool? isEditable,
    String? warning,
    bool? isMandatory,
    String? label,
    String? hint,
    String? description,
    ValueType? valueType,
    bool? allowFutureDates,
    String? displayName,
    bool? isOpen,
    int? totalFields,
    int? completedFields,
    int? errors,
    int? warnings,
    bool? isLoading,
    int? sectionNumber,
    bool? showBottomShadow,
    IntentCallback? intentCallback,
  }) {
    return QSectionFieldModel(
        uid: uid ?? this.uid,
        valuesMap: valuesMap ?? this.valuesMap.unlock,
        isVisible: isVisible ?? this.isVisible,
        error: error ?? this.error,
        isEditable: isEditable ?? this.isEditable,
        warning: warning ?? this.warning,
        isMandatory: isMandatory ?? this.isMandatory,
        label: label ?? this.label,
        hint: hint ?? this.hint,
        description: description ?? this.description,
        valueType: valueType ?? this.valueType,
        displayName: displayName ?? this.displayName,
        isOpen: isOpen ?? this.isOpen,
        totalFields: totalFields ?? this.totalFields,
        completedFields: completedFields ?? this.completedFields,
        errors: errors ?? this.errors,
        warnings: warnings ?? this.warnings,
        isLoading: isLoading ?? this.isLoading,
        sectionNumber: sectionNumber ?? this.sectionNumber,
        intentCallback: intentCallback ?? this.intentCallback);
  }

  @override
  List<Object?> get props => [
        ...super.props,
        isOpen,
        totalFields,
        completedFields,
        errors,
        warnings,
        sectionNumber
      ];
}
