import 'package:equatable/equatable.dart';
import 'package:mass_pro/data_run/screens/data_submission/form/input_action_type.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';

/// **InputAction and StoreResult:** These classes work hand-in-hand
/// to manage actions and their outcomes.
/// `RowAction` represents the action triggered by an intent and the
/// result of processing it. It includes information
/// like the field ID, action type (e.g., save, clear), v
/// alue (optional, for some actions),
/// error (if validation fails), and value type.
///
/// `StoreResult` represents the outcome of saving or
/// updating form data. It contains details like
/// the field ID and any error messages encountered during the process.
///
/// This approach allows the form to track individual field
/// actions and their consequences, facilitating error handling
/// and partial updates.
class InputAction with EquatableMixin {
  InputAction(
      {required this.id,
      this.value,
      this.requiresExactMatch = false,
      this.optionCode,
      this.optionName,
      this.extraData,
      this.error,
      required this.type,
      this.valueType});

  final String id;
  final String? value;
  final bool requiresExactMatch;
  final String? optionCode;
  final String? optionName;
  final String? extraData;
  final Exception? error;
  final InputActionType type;
  final ValueType? valueType;

  @override
  List<Object?> get props => [
        id,
        value,
        requiresExactMatch,
        optionCode,
        optionName,
        extraData,
        error,
        type,
        valueType
      ];

  @override
  bool? get stringify => true;
}
