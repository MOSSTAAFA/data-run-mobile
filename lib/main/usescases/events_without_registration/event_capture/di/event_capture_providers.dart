import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/event_capture_model.dart';

part 'event_capture_providers.g.dart';

@riverpod
class EventCaptureData extends _$EventCaptureData {
  @override
  EventCaptureModel build() {
    return EventCaptureModel();
  }

  void setValue(EventCaptureModel value) {
    state = value;
  }
}

@riverpod
class HasExpired extends _$HasExpired {
  @override
  bool build() {
    return false;
  }

  void setValue(bool value) {
    state = value;
  }
}

//hasExpired