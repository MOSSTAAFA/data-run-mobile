import 'package:mass_pro/data_run/utils/activity_utils.dart';
import 'package:mass_pro/data_run/utils/project_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'utils.providers.g.dart';

@Riverpod(keepAlive: true)
ProjectUtils projectUtils(ProjectUtilsRef ref) {
  return ProjectUtils(ref);
}

@Riverpod(keepAlive: true)
ActivityUtils activityUtils(ActivityUtilsRef ref) {
  return ActivityUtils(ref);
}

