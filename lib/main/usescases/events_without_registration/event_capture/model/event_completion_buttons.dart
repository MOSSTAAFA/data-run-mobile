import 'package:equatable/equatable.dart';

import '../../../../../commons/dialogs/bottomsheet/dialog_button_style.dart';
import 'event_completion_dialog.dart';

/// data class
class EventCompletionButtons with EquatableMixin {
  const EventCompletionButtons({
    required this.buttonStyle,
    required this.action,
  });

  final DialogButtonStyle buttonStyle;
  final FormBottomDialogActionType action;

  /// copyWith
  EventCompletionButtons copyWith({
    DialogButtonStyle? buttonStyle,
    FormBottomDialogActionType? action,
  }) =>
      EventCompletionButtons(
          buttonStyle: buttonStyle ?? this.buttonStyle,
          action: action ?? this.action);

  @override
  List<Object?> get props => [buttonStyle, action];
}
