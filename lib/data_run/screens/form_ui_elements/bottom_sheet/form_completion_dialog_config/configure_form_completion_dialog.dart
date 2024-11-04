import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/commons/logging/logging.dart';
import 'package:mass_pro/data_run/form/form_element/form_element_iterators/form_element_iterator.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element/validation/form_element_validator.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/bottom_sheet/bottom_sheet_model/bottom_sheet_content_model.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/bottom_sheet/bottom_sheet_model/dialog_button_style.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/bottom_sheet/form_completion_dialog_config/form_completion_dialog.dart';
import 'package:mass_pro/generated/l10n.dart';
import 'package:mass_pro/utils/navigator_key.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class ConfigureFormCompletionDialog {
  const ConfigureFormCompletionDialog();

  FormCompletionDialog call(SectionInstance rootSection) {
    final FormCompletionButton mainButton = _getMainButton(rootSection);
    final FormCompletionButton secondaryButton =
        _getSecondaryButton(rootSection);

    final DialogContentModel bottomSheetDialogUiModel = DialogContentModel(
        title: rootSection.form.hasErrors
            ? S.of(navigatorKey.currentContext!).formContainsSomeErrors
            : S.of(navigatorKey.currentContext!).finalData,
        subtitle: rootSection.form.hasErrors
            ? S.of(navigatorKey.currentContext!).fieldsWithErrorInfo
            : S.of(navigatorKey.currentContext!).markAsFinalData,
        icon: rootSection.form.hasErrors ? Icons.error : Icons.info,
        body: _getBody(rootSection));

    return FormCompletionDialog(
        bottomSheetContentModel: bottomSheetDialogUiModel,
        mainButton: mainButton,
        secondaryButton: secondaryButton);
  }

  FormCompletionButton _getMainButton(SectionInstance rootSection) {
    if (rootSection.form.hasErrors) {
      return FormCompletionButton(
          buttonStyle: DialogButtonStyle.mainButton(
              text: S.of(navigatorKey.currentContext!).reviewFormData),
          action: FormBottomDialogActionType.CheckFields);
    } else {
      return FormCompletionButton(
          buttonStyle: DialogButtonStyle.finalizeButton(),
          action: FormBottomDialogActionType.MarkAsFinal);
    }
  }

  FormCompletionButton _getSecondaryButton(SectionInstance rootSection) {
    if (rootSection.form.hasErrors) {
      return FormCompletionButton(
          buttonStyle: DialogButtonStyle.secondaryButton(
              text: S.of(navigatorKey.currentContext!).checkFieldsLater),
          action: FormBottomDialogActionType.NotNow);
      ;
    } else {
      return FormCompletionButton(
          buttonStyle: DialogButtonStyle.secondaryButton(
              text: S.of(navigatorKey.currentContext!).notNow),
          action: FormBottomDialogActionType.NotNow);
    }
  }

  BottomSheetBodyModel _getBody(SectionInstance rootSection) {
    final allElements =
        getFormElementIterator<FieldInstance<dynamic>>(rootSection);
    final formHasErrors = rootSection.form.hasErrors;
    return BottomSheetBodyModel(
      message: formHasErrors
          ? S.of(navigatorKey.currentContext!).fieldsWithErrorInfo
          : S.of(navigatorKey.currentContext!).markAsFinalData,
      fieldsWithIssues:
          formHasErrors ? _getFieldsWithIssues(allElements) : const {},
      allFields: _mapToFieldsWithIssues(allElements),
    );
  }

  Map<String, dynamic> _groupFieldsByStructure(SectionInstance rootSection) {
    final fields = getFormElementIterator<FieldInstance<dynamic>>(rootSection);

    final Map<String, dynamic> fieldsGrouped = {
      'sections': {}, // Non-repeated sections only need labels
      'repeatedGroups': [] // For repeated groups, holding fields by index
    };

    fields.forEach((element) {
      final parentPath = element.parentSection?.pathRecursive;
      final fieldData = FieldWithIssue(
          parentPath: element.pathRecursive,
          fieldName: element.name,
          fieldLabel: element.label,
          parentLabel: element.parentSection?.label,
          value: element.value,
          message: element.elementControl!.hasErrors
              ? _getErrorMessage(element)
              : null);

      // Check if the element is within a repeated section
      if (element.type.isRepeatSection) {
        // Extract the index from the element's path for grouping by `index`
        final match = RegExp(r'\.(\d+)\.').firstMatch(element.pathRecursive);
        final index = match != null ? int.parse(match.group(1)!) : -1;

        if (index >= 0) {
          // Ensure repeatedGroups has an entry for this index
          while (fieldsGrouped['repeatedGroups'].length <= index) {
            fieldsGrouped['repeatedGroups'].add({'index': index, 'fields': []});
          }
          fieldsGrouped['repeatedGroups'][index]['fields'].add(fieldData);
        }
      } else {
        // Group non-repeated sections by parent path
        fieldsGrouped['sections'][parentPath] ??= [];
        fieldsGrouped['sections'][parentPath].add(fieldData);
      }
    });

    logDebug(info: 'Fields grouped by structure: $fieldsGrouped');
    return fieldsGrouped;
  }

  Map<String, List<FieldWithIssue<dynamic>>> _getFieldsWithIssues(
      Iterable<FieldInstance<dynamic>> allElements) {
    final fields =
        allElements.where((field) => field.elementControl!.hasErrors).toList();

    final fieldsMergedWithIssues = fields
        .map((element) => FieldWithIssue(
            parentPath: element.parentSection?.pathRecursive,
            parentType: ParentType.fromValueType(element.parentSection?.type),
            parentLabel: element.parentSection?.label,
            fieldName: element.name,
            fieldLabel: element.label,
            value: element.value,
            message: _getErrorMessage(element)))
        .groupListsBy((element) => element.parentPath ?? 'rootParent');

    return fieldsMergedWithIssues;
  }

  Map<String, List<FieldWithIssue<dynamic>>> _mapToFieldsWithIssues(
      Iterable<FieldInstance<dynamic>> allElements) {
    final fieldsMergedWithIssues = allElements
        .where((element) => element.visible)
        .map((element) => FieldWithIssue(
            parentPath: element.parentSection?.pathRecursive,
            parentType: ParentType.fromValueType(element.parentSection?.type),
            parentLabel: element.parentSection?.label,
            fieldName: element.name,
            fieldLabel: element.label,
            value: element.value,
            message: element.elementControl!.hasErrors
                ? _getErrorMessage(element)
                : null))
        .groupListsBy((element) => element.parentPath ?? 'rootParent');

    return fieldsMergedWithIssues;
  }

  String _getErrorMessage(FieldInstance<dynamic> field) {
    final errorKey = field.elementControl!.errors.keys.first;
    final validationMessage = _findValidationMessage(errorKey);

    return validationMessage != null
        ? validationMessage(field.elementControl!.getError(errorKey)!)
        : errorKey;
  }

  ValidationMessageFunction? _findValidationMessage(String errorKey) {
    return validationMessages(navigatorKey.currentContext!)[errorKey];
  }
}
