import 'package:freezed_annotation/freezed_annotation.dart';


part 'form_event.freezed.dart';

@freezed
class FormEvent with _$FormEvent {
  const factory FormEvent.onStatusChange(String source, {dynamic value}) =
      OnStatusChange;
}
