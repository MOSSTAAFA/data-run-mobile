import 'package:equatable/equatable.dart';

import 'worker_type.dart';

/// Data class
class WorkerItem with EquatableMixin {
  WorkerItem({
    required this.workerName,
    required this.workerType,
    this.delayInSeconds,
    this.data,
    // this.policy,
    this.initialDelay = Duration.zero,
    // this.backoffPolicy,
    // this.constraints,
  });

  final String workerName;
  final WorkerType workerType;
  final double? delayInSeconds;
  final Map<String, dynamic>? data;

  // final ExistingWorkPolicy? policy;
  final Duration initialDelay;

  // final BackoffPolicy? backoffPolicy;
  // final Constraints? constraints;
  // final ExistingPeriodicWorkPolicy? periodicPolicy;

  @override
  List<Object?> get props => [
        workerName,
        workerType,
        delayInSeconds,
        data,
        // policy,
        initialDelay,
        // backoffPolicy,
        // constraints
      ];
}
