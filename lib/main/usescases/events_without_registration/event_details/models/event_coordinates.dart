import 'package:equatable/equatable.dart';

import '../../../../../form/model/field_ui_model.dart';

/// data class
class EventCoordinates with EquatableMixin {
  const EventCoordinates({this.active = true, this.model});

  final bool active;
  final FieldUiModel? model;

  /// copyWith
  EventCoordinates copyWith({final bool? active, final FieldUiModel? model}) =>
      EventCoordinates(
          active: active ?? this.active, model: model ?? this.model);

  @override
  List<Object?> get props => [
        active,
        model,
      ];
}
