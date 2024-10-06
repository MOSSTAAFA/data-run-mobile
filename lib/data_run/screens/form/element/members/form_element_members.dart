import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_element_members.freezed.dart';

@freezed
class ElementProperties with _$ElementProperties {
  const factory ElementProperties({
    @Default(false) bool hidden,
    @Default(false) bool mandatory,
  }) = _ElementProperties;
}

@immutable
class OptionConfig with EquatableMixin {
  OptionConfig(
      {required this.listName,
        required String name,
        String? label,
        this.order = 0,
        Map<String, String> choiceFilters = const {}})
      : this.name = name,
        this.label = label ?? name {
    this.choiceFilters.addAll(choiceFilters);
  }

  final String listName;
  final String name;
  final String label;
  final int order;

  /// {nameOfFilter:valueOfFilter}
  final Map<String, String> choiceFilters = {};

  @override
  List<Object?> get props => [listName, name, order];
}
