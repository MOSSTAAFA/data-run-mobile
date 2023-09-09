import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../form/data/data_integrity_check_result.dart';

part 'event_capture_screen_state_notifier.g.dart';

@riverpod
class EventCaptureScreenStateNotifier
    extends _$EventCaptureScreenStateNotifier {
  @override
  EventCaptureScreenState build() {
    // this.key = key;
    return const EventCaptureScreenState();
  }

  // @override
  // bool updateShouldNotify(EventCaptureScreenState previous, EventCaptureScreenState next) {
  //   return previous != next;
  // }

  void showProgress() {
    state = state.copyWith(progress: true);
  }

  void hideProgress() {
    state = state.copyWith(progress: false);
  }

  void hideNavigationBar() {
    state = state.copyWith(visibleNavigationBar: false);
  }

  void updatePercentage(double percentage) {
    state = state.copyWith(percentage: percentage);
  }

  void handleDataIntegrityResult(DataIntegrityCheckResult result) {
    state = state.copyWith(dataIntegrityResult: result);
  }
// /// set index(int x)
// void selectTabIndex(int index) {
//   state = state.copyWith(index: index);
// }
//
// void selectTabView(ViewAction viewAction) {}
//
// void hideBottomNavBar([bool? hide]) {
//   state = state.copyWith(hideBottomNavBar: hide ?? !state.hideBottomNavBar);
// }
//
// void hideActionBtn([bool? hide]) {
//   state = state.copyWith(hideActionBtn: hide ?? !state.hideActionBtn);
// }
}

class EventCaptureScreenState with EquatableMixin {
  const EventCaptureScreenState([
    this.progress = true,
    this.visibleNavigationBar = false,
    this.percentage = 0,
    this.hasExpired = false,
    this.dataIntegrityResult,
  ]);

  final bool progress;
  final bool visibleNavigationBar;
  final double percentage;
  final bool hasExpired;
  final DataIntegrityCheckResult? dataIntegrityResult;

  @override
  List<Object?> get props => [
        progress,
        visibleNavigationBar,
        percentage,
        hasExpired,
        dataIntegrityResult
      ];

  EventCaptureScreenState copyWith({
    bool? progress,
    bool? visibleNavigationBar,
    double? percentage,
    bool? hasExpired,
    DataIntegrityCheckResult? dataIntegrityResult,
  }) {
    return EventCaptureScreenState(
      progress ?? this.progress,
      visibleNavigationBar ?? this.visibleNavigationBar,
      percentage ?? this.percentage,
      hasExpired ?? this.hasExpired,
      dataIntegrityResult ?? this.dataIntegrityResult,
    );
  }

  @override
  bool? get stringify => true;
}
