import 'package:equatable/equatable.dart';
import 'package:mass_pro/commons/global_functions/global_functions.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';

import 'action_type.dart';

/// FieldUpdate model
class RowAction with EquatableMixin {
  RowAction(
      {required this.id,
      this.value,
      this.formData,
      this.requiresExactMatch = false,
      this.optionCode,
      this.optionName,
      this.extraData,
      this.error,
      required this.type,
      this.valueType});

  final String id;
  final String? value;
  final Map<String, dynamic>? formData;
  final bool requiresExactMatch;
  final String? optionCode;
  final String? optionName;
  final String? extraData;
  final Exception? error;
  final ActionType type;
  final ValueType? valueType;

  bool get hasError => error != null;

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
  String toString() {
    return mapPropsToString(runtimeType, [
      'uid: $id',
      'value: $value',
      'error: $error',
      'type: $type',
      'valueType:  $valueType',
    ]);
  }
}
