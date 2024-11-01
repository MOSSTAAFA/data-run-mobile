import 'package:mass_pro/data_run/screens/form/element/form_metadata.dart';
import 'package:mass_pro/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/ui_models/form_completion_dialog_config/configure_form_completion_dialog.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/ui_models/form_completion_dialog_config/form_completion_dialog.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'completion_dialog_config.provider.provider.g.dart';

@riverpod
FormCompletionDialog formCompletionBottomSheet(FormCompletionBottomSheetRef ref,
    {required FormMetadata formMetadata}) {
  final formInstance =
      ref.watch(formInstanceProvider(formMetadata: formMetadata)).requireValue;

  final configurator = const ConfigureFormCompletionDialog();

  return configurator(formInstance.formSection);
}

// class QBottomSheetProvider {
//   QBottomSheetDialogUiModel formFinishBottomSheet() {
//     return QBottomSheetDialogUiModel(
//       title: S.current.finalData,
//       subtitle: S.current.markAsFinalData,
//       iconResource: Icons.info,
//       mainButton: QDialogButtonStyle.completeButton(),
//       secondaryButton:
//           QDialogButtonStyle.neutralButton(textResource: S.current.notNow),
//     );
//   }
//
//   QBottomSheetDialogUiModel syncBottomSheet(SyncStatus status) {
//     return QBottomSheetDialogUiModel(
//       title: 'Send to Server',
//       subtitle: 'After Sending, Item will no longer be editable.',
//       iconResource: Icons.info,
//       mainButton: QDialogButtonStyle.mainButton(
//         textResource: S.current.send,
//         backgroundColor: Colors.blueAccent,
//         colorResource: Colors.white,
//         iconResource: Icons.sync,
//       ),
//       secondaryButton:
//           QDialogButtonStyle.neutralButton(textResource: S.current.notNow),
//     );
//   }
//
//   QBottomSheetDialogUiModel formWithErrorBottomSheet() {
//     return QBottomSheetDialogUiModel(
//       title: S.current.finalData,
//       subtitle: S.current.markAsFinalData,
//       iconResource: Icons.info,
//       mainButton: QDialogButtonStyle.completeButton(),
//       secondaryButton:
//           QDialogButtonStyle.neutralButton(textResource: S.current.notNow),
//     );
//   }
// }
