import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_event.freezed.dart';

@freezed
class FormEvent with _$FormEvent {
  /// no throttling
  const factory FormEvent.onTextChange(String source, {dynamic value}) =
  OnTextChange;

  /// after changing focus or a certain debounce time fire it
  /// decoupling the management of when to notify listeners
  const factory FormEvent.onValueSaved(String source, {dynamic value}) =
  OnValueSaved;

  const factory FormEvent.onValueCleared(String source) = OnValueCleared;
}
