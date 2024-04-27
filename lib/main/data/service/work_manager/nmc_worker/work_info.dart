import 'package:equatable/equatable.dart';

class WorkInfo with EquatableMixin {
  WorkInfo(
      {this.progress = 0,
      this.state = WorkInfoState.ENQUEUED,
      this.message = ''});

  final String message;
  final WorkInfoState state;

  // final Bundle mOutputData;
  // final ISet<String> mTags;
  // final Bundle mProgress;
  final int progress;

  WorkInfo copyWith({String? message, WorkInfoState? state, int? progress}) {
    return WorkInfo(
        progress: progress ?? this.progress,
        state: state ?? this.state,
        message: message ?? this.message);
  }

  @override
  List<Object?> get props => [message, state, progress];
}

enum WorkInfoState {
  ///
  /// Used to indicate that the {@link WorkRequest} is enqueued and eligible to run when its
  /// {@link Constraints} are met and resources are available.
  ///
  ENQUEUED,

  ///
  /// Used to indicate that the {@link WorkRequest} is currently being executed.
  ///
  RUNNING,

  ///
  /// Used to indicate that the {@link WorkRequest} has completed in a successful state.  Note
  /// that {@link PeriodicWorkRequest}s will never enter this state (they will simply go back
  /// to {@link #ENQUEUED} and be eligible to run again).
  ///
  SUCCEEDED,

  ///
  /// Used to indicate that the {@link WorkRequest} has completed in a failure state.  All
  /// dependent work will also be marked as {@code #FAILED} and will never run.
  ///
  FAILED,

  ///
  /// Used to indicate that the {@link WorkRequest} is currently blocked because its
  /// prerequisites haven't finished successfully.
  ///
  BLOCKED,

  ///
  /// Used to indicate that the {@link WorkRequest} has been cancelled and will not execute.
  /// All dependent work will also be marked as {@code #CANCELLED} and will not run.
  ///
  CANCELLED;

  ///
  /// Returns {@code true} if this State is considered finished.
  ///
  /// @return {@code true} for {@link #SUCCEEDED}, {@link #FAILED}, and/// {@link #CANCELLED}
  ///         states
  ///
  bool isFinished() {
    return this == SUCCEEDED || this == FAILED || this == CANCELLED;
  }
}
