import 'package:flutter/material.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_data_integrity_check_result.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/bottom_sheet/q_bottom_sheet_dialog_ui_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_sheet.provider.g.dart';

@riverpod
QBottomSheetProvider bottomSheet(BottomSheetRef ref) {
  return QBottomSheetProvider();
}

class QBottomSheetProvider {
  QBottomSheetDialogUiModel formFinishBottomSheet(
      [QDataIntegrityCheckResult? result]) {
    return QBottomSheetDialogUiModel(
      title: 'Final Data',
      subtitle: 'Make the form Final before exiting.',
      iconResource: Icons.info,
      mainButton: QDialogButtonStyle.completeButton(),
      secondaryButton:
          QDialogButtonStyle.neutralButton(textResource: 'Not Now'),
    );
  }

  QBottomSheetDialogUiModel syncBottomSheet(SyncableEntityState status) {
    return QBottomSheetDialogUiModel(
      title: 'Send to Server',
      subtitle: 'After Sending, Item will no longer be editable.',
      iconResource: Icons.info,
      mainButton: const QDialogButtonStyle.mainButton(
        textResource: 'Send',
        backgroundColor: Colors.blueAccent,
        colorResource: Colors.white,
        iconResource: Icons.sync,
      ),
      secondaryButton:
          QDialogButtonStyle.neutralButton(textResource: 'Not Now'),
    );
  }
}
