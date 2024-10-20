import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_element_members.freezed.dart';

@freezed
class ElementProperties with _$ElementProperties {
  const factory ElementProperties({
    @Default(0) int order,
    String? label,
    String? placeholder,
    @Default(false) bool disabled,
    @Default(false) bool hidden,
    @Default(false) bool readonly,
    @Default(false) bool mandatory,
  }) = _ElementProperties;
}
