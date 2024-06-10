import 'package:d2_remote/shared/entities/base.entity.dart';
import 'package:mass_pro/data_run/repository/project_activity_repository/project_activity_chv_repository.dart';
import 'package:mass_pro/data_run/repository/project_activity_repository/project_activity_itn_repository.dart';
import 'package:mass_pro/data_run/repository/project_activity_repository/project_activity_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_activity_repositories.providers.g.dart';

/// Project Activity Repositories
///
// @riverpod
// ProjectActivityRepository projectActivityRepositoryContext(
//     ProjectActivityRepositoryContextRef ref, ActivityType activityType) {
//   return when(activityType, {
//     ActivityType.ITNs: () => ref.read(_projectActivityItnRepositoryProvider),
//     ActivityType.CHVs_Patients: () =>
//         ref.read(_projectActivityChvRepositoryProvider),
//     ActivityType.CHVs_Sessions: () =>
//         ref.read(_projectActivityChvRepositoryProvider)
//   }).orElse(() => throw Exception('Unknown activity type'));
// }

@riverpod
ProjectActivityRepository _projectActivityItnRepository(
    _ProjectActivityItnRepositoryRef ref) {
  return ProjectActivityItnRepository();
}

@riverpod
ProjectActivityRepository _projectActivityChvRepository(
    _ProjectActivityChvRepositoryRef ref) {
  return ProjectActivityChvRepository();
}
