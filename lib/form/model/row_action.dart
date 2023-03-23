import 'package:d2_remote/core/common/value_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mass_pro/form/model/action_type.dart';

part 'row_action.freezed.dart';

@freezed
class RowAction with _$RowAction {
  const factory RowAction({
    required String id,
    String? value,
    @Default(false) bool requiresExactMatch,
    String? optionCode,
    String? optionName,
    String? extraData,
    Exception? error,
    required ActionType type,
    ValueType? valueType,
  }) = _RowAction;

  const RowAction._();
}
