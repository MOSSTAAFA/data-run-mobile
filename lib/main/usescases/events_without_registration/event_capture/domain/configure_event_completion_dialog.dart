import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';

import '../../../../../commons/date/field_with_issue.dart';
import '../../../../../commons/dialogs/bottomsheet/bottom_sheet_dialog_ui_model.dart';
import '../../../../../commons/dialogs/bottomsheet/dialog_button_style.dart';
import '../../../../../commons/extensions/standard_extensions.dart';
import '../model/event_completion_buttons.dart';
import '../model/event_completion_dialog.dart';
import '../provider/event_capture_resources_provider.dart';

class ConfigureEventCompletionDialog {
  ConfigureEventCompletionDialog(this.provider);

  final EventCaptureResourcesProvider provider;

  EventCompletionDialog call(
      IList<FieldWithIssue> errorFields,
      IMap<String, String> mandatoryFields,
      IList<FieldWithIssue> warningFields,
      bool canComplete,
      String? onCompleteMessage) {
    final _DialogType dialogType = _getDialogType(errorFields, mandatoryFields,
        warningFields, !canComplete && onCompleteMessage != null);
    final EventCompletionButtons mainButton = _getMainButton(dialogType);
    final EventCompletionButtons secondaryButton = EventCompletionButtons(
        buttonStyle: DialogButtonStyle.secondaryButton(
            textResource: provider.provideNotNow()),
        action: FormBottomDialogActionType.FINISH);
    final BottomSheetDialogUiModel bottomSheetDialogUiModel =
        BottomSheetDialogUiModel(
            title: _getTitle(dialogType),
            subtitle: _getSubtitle(dialogType),
            iconResource: _getIcon(dialogType),
            fieldsWithIssues: _getFieldsWithIssues(
                errorFields: errorFields,
                mandatoryFields: mandatoryFields.toKeyIList(),
                warningFields: warningFields,
                onCompleteField:
                    _getOnCompleteMessage(canComplete, onCompleteMessage)),
            mainButton: mainButton.buttonStyle,
            secondaryButton: secondaryButton.buttonStyle);

    return EventCompletionDialog(
        bottomSheetDialogUiModel: bottomSheetDialogUiModel,
        mainButtonAction: mainButton.action,
        secondaryButtonAction: secondaryButton.action);
  }

  String _getTitle(_DialogType type) => when(type, {
        _DialogType.ERROR: () => provider.provideNotSavedText(),
      }).orElse(() => provider.provideSavedText());

  String _getSubtitle(_DialogType type) => when(type, {
        _DialogType.ERROR: () => provider.provideErrorInfo(),
        _DialogType.MANDATORY: () => provider.provideMandatoryInfo(),
        _DialogType.WARNING: () => provider.provideWarningInfo(),
        _DialogType.SUCCESSFUL: () => provider.provideCompleteInfo(),
        _DialogType.COMPLETE_ERROR: () => provider.provideOnCompleteErrorInfo(),
      })!;

  Icon _getIcon(_DialogType type) => when(type, {
        [_DialogType.ERROR, _DialogType.COMPLETE_ERROR]: () =>
            provider.provideRedAlertIcon(),
        _DialogType.MANDATORY: () => provider.provideSavedIcon(),
        _DialogType.WARNING: () => provider.provideYellowAlertIcon(),
        _DialogType.SUCCESSFUL: () => provider.provideSavedIcon(),
      })!;

  EventCompletionButtons _getMainButton(_DialogType type) => when(type, {
        [_DialogType.ERROR, _DialogType.MANDATORY, _DialogType.COMPLETE_ERROR]:
            () => EventCompletionButtons(
                buttonStyle: DialogButtonStyle.mainButton(
                    textResource: provider.provideReview()),
                action: FormBottomDialogActionType.CHECK_FIELDS),
        [_DialogType.WARNING, _DialogType.SUCCESSFUL]: () =>
            EventCompletionButtons(
                buttonStyle: DialogButtonStyle.completeButton(),
                action: FormBottomDialogActionType.COMPLETE),
      })!;

  IList<FieldWithIssue> _getFieldsWithIssues(
      {required IList<FieldWithIssue> errorFields,
      required IList<String> mandatoryFields,
      required IList<FieldWithIssue> warningFields,
      required IList<FieldWithIssue> onCompleteField}) {
    return onCompleteField +
        errorFields +
        mandatoryFields
            .map((String it) => FieldWithIssue(
                fieldUid: 'uid',
                fieldName: it,
                issueType: IssueType.MANDATORY,
                message: provider.provideMandatoryField()))
            .toList() +
        warningFields;
  }

  IList<FieldWithIssue> _getOnCompleteMessage(
      bool canComplete, String? onCompleteMessage) {
    final FieldWithIssue? issueOnComplete = onCompleteMessage?.let(
        (String it) => FieldWithIssue(
            fieldUid: '',
            fieldName: it,
            issueType: canComplete
                ? IssueType.ERROR_ON_COMPLETE
                : IssueType.WARNING_ON_COMPLETE,
            message: ''));

    return issueOnComplete?.let((FieldWithIssue it) => IList([it])) ??
        IList([]);
  }

  _DialogType _getDialogType(
      IList<FieldWithIssue> errorFields,
      IMap<String, String> mandatoryFields,
      IList<FieldWithIssue> warningFields,
      bool errorOnComplete) {
    if (errorOnComplete) {
      return _DialogType.COMPLETE_ERROR;
    }
    if (errorFields.isNotEmpty) {
      return _DialogType.ERROR;
    }
    if (mandatoryFields.isNotEmpty) {
      return _DialogType.MANDATORY;
    }
    if (warningFields.isNotEmpty) {
      return _DialogType.WARNING;
    }
    return _DialogType.SUCCESSFUL;
  }
}

enum _DialogType { ERROR, MANDATORY, WARNING, SUCCESSFUL, COMPLETE_ERROR }
