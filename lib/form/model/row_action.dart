import 'package:equatable/equatable.dart';
import 'package:mass_pro/commons/global_functions/global_functions.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';

import 'package:mass_pro/form/model/action_type.dart';

/// FieldUpdate model
class RowAction with EquatableMixin {
  RowAction(
      {required this.id,
      this.value,
      this.values,
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
  final List<String>? values;
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
  List<Object?> get props => <Object?>[
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
    return mapPropsToString(runtimeType, <Object?>[
      'uid: $id',
      'value: $value',
      'error: $error',
      'type: $type',
      'valueType:  $valueType',
    ]);
  }
}
