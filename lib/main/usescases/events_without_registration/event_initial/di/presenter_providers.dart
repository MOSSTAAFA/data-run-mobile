import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'presenter_providers.g.dart';

@riverpod
class OnEventCreated extends _$OnEventCreated {
  @override
  String? build() {
    return null;
  }

  void setValue(String value) {
    state = value;
  }
}

@riverpod
class ErrorRender extends _$ErrorRender {
  @override
  String? build() {
    return null;
  }

  void setValue(String value) {
    state = value;
  }
}

@riverpod
class PercentageUpdater extends _$PercentageUpdater {
  @override
  double? build() {
    return null;
  }

  void setValue(double value) {
    state = value;
  }
}
