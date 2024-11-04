import 'package:freezed_annotation/freezed_annotation.dart';
part 'form_item_with_value.freezed.dart';

@freezed
abstract class FormItemWithValue<T> with _$FormItemWithValue<T> {
  factory FormItemWithValue.fieldWithValue({
    String? parent,
    required String fieldPath,
    required String fieldName,
    String? message,
    T? value,
  }) = _FieldWithValue<T>;

  factory FormItemWithValue.tableRowWithValue({
    String? parent,
    required String fieldPath,
    required String fieldName,
    String? message,
   @Default(const []) List<_FieldWithValue<T>> fieldWithValueList,
  }) = _DataRowWithValue<T>;
}
