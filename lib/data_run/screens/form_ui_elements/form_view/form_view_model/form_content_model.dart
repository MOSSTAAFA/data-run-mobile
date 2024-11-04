import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/form_view/form_view_model_config/form_item_with_value.dart';

part 'form_content_model.freezed.dart';

@freezed
class FormViewContentModel with _$FormViewContentModel {
  const factory FormViewContentModel({
    required String title,
    required String subtitle,
    required IconData icon,
    required FormViewBodyModel body,
  }) = _FormViewContentModel;
}

@freezed
abstract class FormViewBodyModel with _$FormViewBodyModel {
  const factory FormViewBodyModel({
    String? errorsMessage,
    required String message,
    required Map<String, List<FormItemWithValue<dynamic>>> fieldsWithValues,
  }) = _FormViewBodyModel;
}
