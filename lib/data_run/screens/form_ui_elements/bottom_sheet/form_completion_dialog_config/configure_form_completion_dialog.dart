import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
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
    return rootSection.form.hasErrors
        ? BottomSheetBodyModel.errorsBody(
            message: S.of(navigatorKey.currentContext!).fieldsWithErrorInfo,
            fieldsWithIssues: _getFieldsWithIssues(rootSection))
        : BottomSheetBodyModel.messageBody(
            message: S.of(navigatorKey.currentContext!).makeFormFinalOrSaveBody);
  }

  Map<String, List<FieldWithIssue>> _getFieldsWithIssues(
      SectionInstance rootSection) {
    final List<FieldInstance<dynamic>> fieldsWithErrors =
        getFormElementIterator<FieldInstance<dynamic>>(rootSection)
            .where((field) => field.elementControl!.hasErrors)
            .toList();
    fieldsWithErrors.reversed;
    final fieldsIssues = fieldsWithErrors.map((element) => FieldWithIssue(
        parent: element.parentSection?.label,
        fieldPath: element.pathRecursive,
        fieldName: element.label,
        message: _getErrorMessage(element)));

    return fieldsIssues
        .groupListsBy((element) => element.parent ?? 'UnGroupedIssue');
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
