import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/commons/extensions/standard_extensions.dart';
import 'package:mass_pro/data_run/repository/activity_data_repository/activity_data_repoitories.dart';
import 'package:mass_pro/data_run/repository/activity_data_repository/activity_data_repository.provider.dart';
import 'package:mass_pro/data_run/screens/data_submission/data_submission_screen.widget.dart';
import 'package:mass_pro/data_run/screens/data_submission/strategy/activity_type.dart';
import 'package:mass_pro/data_run/screens/data_submission/strategy/form_creation_strategy/strategies.dart';

void navigateToForm(BuildContext context, ActivityType activityType) {
  FormCreationStrategy strategy;
  ActivityDataRepository repository;

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProviderScope(
        overrides: [
          activityDataRepositoryProvider
              .overrideWithValue(_getRepository(activityType)),
          formCreationStrategyProvider
              .overrideWithValue(_getFormCreationStrategy(activityType)),
        ],
        child: DataSubmissionScreen(),
      ),
    ),
  );
}

ActivityDataRepository _getRepository(ActivityType activityType) {
  return when(activityType, <ActivityType, ActivityDataRepository Function()>{
    ActivityType.CHVs_Patients: () => ActivityDataChvPatientRepository(),
    ActivityType.CHVs_Sessions: () => ActivityDataChvSessionRepository(),
    ActivityType.ITNs: () => ActivityDataItnRepository(),
  }).orElse(() => throw Exception('Unknown activity type'));
}

FormCreationStrategy _getFormCreationStrategy(ActivityType activityType) {
  return when(activityType, <ActivityType, FormCreationStrategy Function()>{
    ActivityType.CHVs_Patients: () => CHVPatientFormStrategy(),
    ActivityType.CHVs_Sessions: () => CHVSessionFormStrategy(),
    ActivityType.ITNs: () => ITNFormStrategy(),
  }).orElse(() => throw Exception('Unknown activity type'));
}
