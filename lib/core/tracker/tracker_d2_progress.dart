import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../arch/call/d2_progress.dart';
import '../arch/call/d2_progress_status.dart';

class TrackerD2Progress extends D2Progress {
  TrackerD2Progress(
      {super.message,
      super.serverMessage,
      super.isComplete,
      super.totalCalls,
      super.percentage,
      super.doneCalls,
      IMap<String, D2ProgressStatus>? programs})
      : programs = IMap.orNull(programs?.unlock) ?? IMap();

  IMap<String, D2ProgressStatus> programs;

  static TrackerD2Progress empty(int? totalCalls) {
    if (totalCalls != null && totalCalls < 0) {
      throw ArgumentError('Negative total calls');
    }
    return TrackerD2Progress(
        isComplete: false,
        totalCalls: totalCalls,
        doneCalls: IList(),
        programs: IMap());
  }

  @override
  TrackerD2Progress copyWith(
      {String? message,
      String? serverMessage,
      bool? isComplete,
      int? totalCalls,
      num? percentage,
      IList<String>? doneCalls,
      IMap<String, D2ProgressStatus>? programs}) {
    return TrackerD2Progress(
        message: message ?? this.message,
        serverMessage: serverMessage ?? this.serverMessage,
        isComplete: isComplete ?? this.isComplete,
        totalCalls: totalCalls ?? this.totalCalls,
        percentage: percentage ?? this.percentage,
        doneCalls: IList.orNull(doneCalls) ?? this.doneCalls,
        programs: IMap.orNull(programs?.unlock) ?? this.programs);
  }

  @override
  List<Object?> get props => super.props + [programs];
}
