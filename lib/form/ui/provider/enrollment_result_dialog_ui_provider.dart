import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../commons/date/field_with_issue.dart';
import '../../../commons/dialogs/bottomsheet/bottom_sheet_dialog_ui_model.dart';
import '../../../commons/dialogs/bottomsheet/dialog_button_style.dart';
import '../../../commons/resources/resource_manager.dart';
import '../../data/data_integrity_check_result.dart';

class EnrollmentResultDialogUiProvider {
  EnrollmentResultDialogUiProvider({required this.resourceManager});

  final ResourceManager resourceManager;

  BottomSheetDialogUiModel? provideDataEntryUiModel(
      DataIntegrityCheckResult result) {
    return result.mapOrNull(
        fieldsWithErrorResult: (result) => BottomSheetDialogUiModel(
            title: resourceManager.getString('string.not_saved'),
            subtitle: _getErrorSubtitle(result.allowDiscard),
            // NMC: fix later
            iconResource: resourceManager.getObjectStyleDrawableResource(
                null, Icons.date_range_outlined),
            fieldsWithIssues: _getFieldsWithIssues(
                errorFields: result.fieldUidErrorList,
                mandatoryFields: result.mandatoryFields.toKeyIList(),
                warningFields: result.warningFields),
            mainButton: const DialogButtonStyle.mainButton(
                textResource: 'string.review'),
            secondaryButton:
                result.allowDiscard ? DialogButtonStyle.discardButton() : null),
        fieldsWithWarningResult: (result) => BottomSheetDialogUiModel(
            title: resourceManager.getString('string.saved'),
            subtitle: resourceManager.getString('string.review_message'),
            iconResource: resourceManager.getObjectStyleDrawableResource(
                null, MdiIcons.alertCircle),
            fieldsWithIssues: result.fieldUidWarningList,
            mainButton:
                const DialogButtonStyle.mainButton(textResource: 'review'),
            secondaryButton: const DialogButtonStyle.secondaryButton(
                textResource: 'not_now')),
        missingMandatoryResult: (result) => BottomSheetDialogUiModel(
              title: resourceManager.getString('not_saved'),
              subtitle: _getMandatorySubtitle(result.allowDiscard),
              iconResource: resourceManager.getObjectStyleDrawableResource(
                  null, Icons.error),
              fieldsWithIssues: _getFieldsWithIssues(
                  mandatoryFields: result.mandatoryFields.toKeyIList(),
                  warningFields: result.warningFields),
              mainButton: DialogButtonStyle.mainButton(
                  textResource: result.allowDiscard
                      ? 'string.keep_editing'
                      : 'string.review'),
              secondaryButton: result.allowDiscard
                  ? DialogButtonStyle.discardButton()
                  : null,
            ),
        notSavedResult: (result) => BottomSheetDialogUiModel(
            title: resourceManager.getString('not_saved'),
            subtitle: resourceManager.getString('discard_go_back'),
            iconResource: resourceManager.getObjectStyleDrawableResource(
                null, MdiIcons.alertCircle),
            mainButton: const DialogButtonStyle.mainButton(
                textResource: 'keep_editing'),
            secondaryButton: DialogButtonStyle.discardButton()));
  }

  IList<FieldWithIssue> _getFieldsWithIssues(
      {IList<FieldWithIssue>? errorFields,
      IList<String>? mandatoryFields,
      IList<FieldWithIssue>? warningFields}) {
    errorFields = errorFields ?? IList([]);
    mandatoryFields = mandatoryFields ?? IList([]);
    warningFields = warningFields ?? IList([]);
    return errorFields +
        mandatoryFields.map((item) => FieldWithIssue(
            fieldUid: 'uid',
            fieldName: item,
            issueType: IssueType.MANDATORY,
            message: resourceManager.getString('string.mandatory_field'))) +
        warningFields;
  }

  String _getErrorSubtitle(bool allowDiscard) =>
      resourceManager._getErrorSubtitle(allowDiscard);

  String _getMandatorySubtitle(bool allowDiscard) =>
      resourceManager._getMandatorySubtitle(allowDiscard);
}

extension _EnrollmentResultDialogUiProviderExt on ResourceManager {
  String _getErrorSubtitle(bool allowDiscard) => allowDiscard
      ? getString('string.field_errors_not_saved_discard')
      : getString('string.field_errors_not_saved');

  String _getMandatorySubtitle(bool allowDiscard) => allowDiscard
      ? getString('string.fields_mandatory_missing_discard')
      : getString('string.fields_mandatory_missing');
}
