import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:mass_pro/data_run/screens/data_submission_screen/model/form_screen_repository.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/bottom_sheet/q_bottom_sheet_dialog_ui_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_screen_state.model.g.dart';

@riverpod
Future<FormScreenStateModel> formScreenStateModel(
    FormScreenStateModelRef ref) async {
  final canEditForm =
      await ref.watch(formScreenRepositoryProvider).canEditForm();
  final bottomSheetModel =
      await ref.watch(formScreenRepositoryProvider).getBottomSheetModel();
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
  List<Object?> get props => [canEditForm, loading, bottomSheetModel];
}
