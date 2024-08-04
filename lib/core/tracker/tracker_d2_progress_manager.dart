import 'package:d2_remote/modules/datarun_shared/sync/call/d2_progress_manager.dart';
import 'package:d2_remote/modules/datarun_shared/sync/call/d2_progress_status.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'package:mass_pro/core/tracker/tracker_d2_progress.dart';

class TrackerD2ProgressManager extends D2ProgressManager {
  TrackerD2ProgressManager({super.totalCalls})
      : _progress = TrackerD2Progress.empty(totalCalls);

  TrackerD2Progress _progress;

  @override
  TrackerD2Progress getProgress() {
    return _progress;
  }

  @override
  TrackerD2Progress increaseProgress(
      {required String resourceName,
      required bool isComplete,
      String? message,
      num? percentage}) {
    _progress = _progress.copyWith(
        doneCalls: _progress.doneCalls?.add(resourceName),
        isComplete: isComplete,
        message: message,
        percentage: percentage);
    return _progress;
  }

  TrackerD2Progress setTotalCalls(int totalCalls) {
    _progress = _progress.copyWith(totalCalls: totalCalls);
    return _progress;
  }

  TrackerD2Progress setPrograms(List<String> programs) {
    _progress = _progress.copyWith(
        programs: IMap.fromKeys(
      keys: programs,
      valueMapper: (String p0) => const D2ProgressStatus(),
    ));

    return _progress;
  }

  TrackerD2Progress updateProgramSyncStatus(
      String program, D2ProgressSyncStatus status,
      /* NMC */ {String? message}) {
    final D2ProgressStatus newProgramStatus =
        (_progress.programs[program] ?? const D2ProgressStatus())
            .addSyncStatus(status, message: message);
    _progress = _progress.copyWith(
        programs: _progress.programs.add(program, newProgramStatus));

    return _progress;
  }

  TrackerD2Progress completeProgram(String program) {
    final D2ProgressStatus newProgramStatus =
        (_progress.programs[program] ?? const D2ProgressStatus())
            .copyWith(isComplete: true);
    _progress = _progress.copyWith(
        programs: _progress.programs.add(program, newProgramStatus));

    return _progress;
  }

  TrackerD2Progress completePrograms() {
    _progress = _progress.copyWith(
        programs: _progress.programs.map((String key, D2ProgressStatus value) => MapEntry(
            key,
            value
                .copyWith(isComplete: true)
                .addSyncStatus(D2ProgressSyncStatus.SUCCESS))));

    return _progress;
  }

  TrackerD2Progress complete() {
    _progress = _progress.copyWith(isComplete: true);

    return _progress;
  }
}
