import 'package:equatable/equatable.dart';

import '../../../../../commons/dialogs/bottomsheet/bottom_sheet_dialog_ui_model.dart';

/// data class
class EventCompletionDialog with EquatableMixin {
  const EventCompletionDialog({
    required this.bottomSheetDialogUiModel,
    required this.mainButtonAction,
    required this.secondaryButtonAction,
  });

  final BottomSheetDialogUiModel bottomSheetDialogUiModel;
  final FormBottomDialogActionType mainButtonAction;
  final FormBottomDialogActionType secondaryButtonAction;

  /// copyWith
  EventCompletionDialog copyWith({
    BottomSheetDialogUiModel? bottomSheetDialogUiModel,
    FormBottomDialogActionType? mainButtonAction,
    FormBottomDialogActionType? secondaryButtonAction,
  }) =>
      EventCompletionDialog(
          bottomSheetDialogUiModel:
              bottomSheetDialogUiModel ?? this.bottomSheetDialogUiModel,
          mainButtonAction: mainButtonAction ?? this.mainButtonAction,
          secondaryButtonAction:
              secondaryButtonAction ?? this.secondaryButtonAction);

  @override
  List<Object?> get props =>
      [bottomSheetDialogUiModel, mainButtonAction, secondaryButtonAction];
}

enum FormBottomDialogActionType {
  FINISH_ADD_NEW,
  SKIP,
  RESCHEDULE,
  FINISH,
  COMPLETE_ADD_NEW,
  COMPLETE,
  CHECK_FIELDS
}
