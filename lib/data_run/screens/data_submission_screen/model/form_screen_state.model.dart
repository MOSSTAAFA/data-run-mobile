import 'dart:async';

import 'package:d2_remote/d2_remote.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/constants.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/bottom_sheet/q_bottom_sheet_dialog_ui_model.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_screen_state.model.g.dart';

@riverpod
Future<FormScreenStateModel> formScreenStateModel(
    FormScreenStateModelRef ref) async {
  final Bundle eventBundle = Get.arguments as Bundle;
  final String syncableUid = eventBundle.getString(SYNCABLE_UID)!;

  final bool canEditForm =
      await D2Remote.formModule.formSubmission.byId(syncableUid).canEdit();
  // await ref.watch(formScreenRepositoryProvider).canEditForm();
  final QBottomSheetDialogUiModel bottomSheetModel = QBottomSheetDialogUiModel(
    title: 'Final Data',
    subtitle: 'Make the form Final before exiting.',
    iconResource: Icons.info,
    mainButton: QDialogButtonStyle.completeButton(),
    secondaryButton: QDialogButtonStyle.neutralButton(textResource: 'Not Now'),
  );
  return FormScreenStateModel(
      bottomSheetModel: bottomSheetModel, canEditForm: canEditForm);
}

class FormScreenStateModel with EquatableMixin {
  FormScreenStateModel(
      {this.canEditForm = false,
      this.loading = true,
      required this.bottomSheetModel});

  final bool canEditForm;
  final bool loading;
  final QBottomSheetDialogUiModel bottomSheetModel;

  FormScreenStateModel copyWith(
      {bool? canEditForm,
      bool? loading,
      QBottomSheetDialogUiModel? bottomSheetModel}) {
    return FormScreenStateModel(
        canEditForm: canEditForm ?? this.canEditForm,
        loading: loading ?? this.loading,
        bottomSheetModel: bottomSheetModel ?? this.bottomSheetModel);
  }

  bool get formIsEnabled => false;

  @override
  List<Object?> get props => <Object?>[canEditForm, loading, bottomSheetModel];
}
