import 'package:d2_remote/core/common/value_type.dart';
import 'package:equatable/equatable.dart';

import 'action_type.dart';

class RowAction with EquatableMixin {
  RowAction(
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
  final ActionType type;
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
