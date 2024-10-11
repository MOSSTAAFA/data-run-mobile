import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'form_element_members.freezed.dart';

@freezed
class ElementProperties with _$ElementProperties {
  const factory ElementProperties({
    @Default(false) bool hidden,
    @Default(false) bool mandatory,
    @Default(ControlStatus.valid) ControlStatus controlStatus,
    // T? value,
  }) = _ElementProperties;
}

