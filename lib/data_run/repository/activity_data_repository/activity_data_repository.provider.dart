import 'package:d2_remote/modules/datarun/shared/entities/syncable.entity.dart';
import 'package:mass_pro/data_run/repository/activity_data_repository/activity_data_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'activity_data_repository.provider.g.dart';

/// Activity Data Repositories
///
// @riverpod
// ActivityDataRepository activityDataRepositoryContext(
//     ActivityDataRepositoryContextRef ref, ActivityType activityType) {
//   return when(activityType, {
//     ActivityType.ITNs: () => ref.read(_activityDataItnsRepositoryProvider),
//     ActivityType.CHVs_Patients: () =>
//         ref.read(_activityDataChvPatientRepositoryProvider),
//     ActivityType.CHVs_Sessions: () =>
//         ref.read(_activityDataChvSessionRepositoryProvider)
//   }).orElse(() => throw Exception('Unknown activity type'));
// }

@riverpod
ActivityDataRepository activityDataRepository(ActivityDataRepositoryRef ref) {
  throw UnimplementedError();
}

//
// @riverpod
// ActivityDataRepository activityDataItnsRepository(
//     ActivityDataItnsRepositoryRef ref) {
//   return ActivityDataItnRepository();
// }
//
// @riverpod
// ActivityDataRepository activityDataChvPatientRepository(
//     ActivityDataChvPatientRepositoryRef ref) {
//   return ActivityDataChvPatientRepository();
// }
//
// @riverpod
// ActivityDataRepository activityDataChvSessionRepository(
//     ActivityDataChvSessionRepositoryRef ref) {
//   return ActivityDataChvSessionRepository();
// }
