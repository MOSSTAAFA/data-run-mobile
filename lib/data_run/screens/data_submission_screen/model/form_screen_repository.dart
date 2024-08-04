import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun_shared/queries/syncable.query.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/constants.dart';
import 'package:d2_remote/core/datarun/utilities/date_utils.dart' as sdk;
import 'package:mass_pro/data_run/form/form_configuration.dart';
import 'package:mass_pro/data_run/form/syncable_status.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/bottom_sheet/q_bottom_sheet_dialog_ui_model.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_screen_repository.g.dart';

@riverpod
FormScreenRepository formScreenRepository(FormScreenRepositoryRef ref) {
  final Bundle eventBundle = Get.arguments as Bundle;
  final String syncableUid = eventBundle.getString(SYNCABLE_UID)!;
  final String formCode = eventBundle.getString(FORM_UID)!;
  final String formVersion = eventBundle.getString(FORM_VERSION)!;
  // final formConfig = ref.watch(formConfigurationProvider(formCode, formVersion).future)
  return FormScreenRepository(entityUid: syncableUid);
}

class FormScreenRepository {
  FormScreenRepository({required String entityUid}) : _entityUid = entityUid;

  final String _entityUid;

  Future<bool> canEditForm() async {
    return D2Remote.formModule.formSubmission.byId(_entityUid).canEdit();
  }

  Future<QBottomSheetDialogUiModel> getBottomSheetModel() async {
    return QBottomSheetDialogUiModel(
      title: 'Final Data',
      subtitle: 'Make the form Final before exiting.',
      iconResource: Icons.info,
      mainButton: QDialogButtonStyle.completeButton(),
      secondaryButton:
          QDialogButtonStyle.neutralButton(textResource: 'Not Now'),
    );
  }

// Future<int> markEntityAsFinal(String uid) async {
//   final String? completedDate =
//   sdk.DateUtils.databaseDateFormat().format(DateTime.now().toUtc());
//   final submission =
//   (await D2Remote.formModule.formSubmission.byId(uid).getOne())
//     ?..status = SyncableStatus.COMPLETED.name
//     ..finishedEntryTime = completedDate;
//
//   return D2Remote.formModule.formSubmission.setData(submission).save();
// }
}
