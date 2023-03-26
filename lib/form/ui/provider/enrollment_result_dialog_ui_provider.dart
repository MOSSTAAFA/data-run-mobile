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
                'icon', 'defaultResource'),
            fieldsWithIssues: _getFieldsWithIssues(
                errorFields: result.fieldUidErrorList,
                mandatoryFields: result.mandatoryFields.keys.toList(),
                warningFields: result.warningFields),
            mainButton: const DialogButtonStyle.mainButton(
                textResource: 'string.review'),
            secondaryButton:
                result.allowDiscard ? DialogButtonStyle.discardButton() : null),
        fieldsWithWarningResult: (result) => BottomSheetDialogUiModel(
            title: resourceManager.getString('string.saved'),
            subtitle: resourceManager.getString('string.review_message'),
            iconResource: resourceManager.getObjectStyleDrawableResource(
                'R.drawable.ic_alert', 'defaultResource'),
            fieldsWithIssues: result.fieldUidWarningList,
            mainButton: const DialogButtonStyle.mainButton(
                textResource: 'R.string.review'),
            secondaryButton: const DialogButtonStyle.secondaryButton(
                textResource: 'R.string.not_now')),
        missingMandatoryResult: (result) => BottomSheetDialogUiModel(
              title: resourceManager.getString('R.string.not_saved'),
              subtitle: _getMandatorySubtitle(result.allowDiscard),
              iconResource: resourceManager.getObjectStyleDrawableResource(
                  'R.drawable.ic_error_outline', 'defaultResource'),
              fieldsWithIssues: _getFieldsWithIssues(
                  mandatoryFields: result.mandatoryFields.keys.toList(),
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
            title: resourceManager.getString('R.string.not_saved'),
            subtitle: resourceManager.getString('R.string.discard_go_back'),
            iconResource: resourceManager.getObjectStyleDrawableResource(
                'R.drawable.ic_alert', 'defaultResource'),
            mainButton: const DialogButtonStyle.mainButton(
                textResource: 'R.string.keep_editing'),
            secondaryButton: DialogButtonStyle.discardButton()));
  }

  List<FieldWithIssue> _getFieldsWithIssues(
      {List<FieldWithIssue>? errorFields,
      List<String>? mandatoryFields,
      List<FieldWithIssue>? warningFields}) {
    errorFields = errorFields ?? [];
    mandatoryFields = mandatoryFields ?? [];
    warningFields = warningFields ?? [];
    return errorFields +
        mandatoryFields
            .map((item) => FieldWithIssue(
                fieldUid: 'uid',
                fieldName: item,
                issueType: IssueType.MANDATORY,
                message: resourceManager.getString('string.mandatory_field')))
            .toList() +
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
