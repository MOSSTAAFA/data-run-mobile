import 'dart:async';

import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:d2_remote/modules/datarun/form/entities/dynamic_form.entity.dart';
import 'package:d2_remote/modules/datarun_shared/queries/syncable.query.dart';
import 'package:d2_remote/modules/datarun_shared/temp/chv_itn_distribution_form.temp.dart';
import 'package:d2_remote/modules/datarun_shared/temp/chv_registers_form.temp.dart';
import 'package:d2_remote/modules/datarun_shared/temp/chv_sessions_form.temp.dart';
import 'package:d2_remote/modules/metadatarun/activity/entities/d_activity.entity.dart';
import 'package:d2_remote/modules/metadatarun/teams/d_team.module.dart';
import 'package:d2_remote/modules/metadatarun/teams/entities/d_team.entity.dart';
import 'package:mass_pro/data_run/utils/activity_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'forms_widget_strategy/strategies.dart';

part 'navigation_function.g.dart';

final itnForms = [dTempItnDistributionForm]
    .map((form) => DynamicForm.fromJson(form))
    .toList();

final chvForms = [dTempChvRegisterForm, dTempChvSessionForm]
    .map((form) => DynamicForm.fromJson(form))
    .toList();

@riverpod
Future<List<DTeam>> teams(TeamsRef ref) async {
  final List<String> activities = (await D2Remote.activityModuleD.activity
          .where(attribute: 'disabled', value: false)
          .get())
      .map((activity) => activity.id!)
      .toList();

  return D2Remote.teamModuleD.team
      .whereIn(attribute: 'activity', values: activities, merge: true)
      .where(attribute: 'disabled', value: false)
      .get();
}

@riverpod
Future<List<DynamicForm>> forms(FormsRef ref, String teamUid) async {
  final DTeam? team = await D2Remote.teamModuleD.team.byId(teamUid).getOne();

  final teamType = team!.teamType;

  final List<DynamicForm> forms = when(team?.teamType, {
    TeamType.CHV_PATIENTS: () => chvForms,
    TeamType.IRS_DISTRIBUTION: () => itnForms,
  }).orElse(() => throw Exception('Form ${team?.teamType} Does not exist'));

  return Future.value(forms);
}

bool? _checkActivityType(String? code, ActivityType type) {
  return code?.toLowerCase().contains(type.name.toLowerCase());
}

@riverpod
Future<SyncableQuery> _activityDataRepository(
    _ActivityDataRepositoryRef ref, DActivity activity) async {
  return when(true, <bool?, SyncableQuery Function()>{
    _checkActivityType(activity.code, ActivityType.CHV_PATIENT): () =>
        D2Remote.iccmModule.patientInfo,
    _checkActivityType(activity.code, ActivityType.CHV_SESSION): () =>
        D2Remote.iccmModule.chvSession,
    _checkActivityType(activity.code, ActivityType.ITN): () =>
        D2Remote.itnsVillageModule.itnsVillage,
  }).orElse(() => throw Exception('Unknown activity type'));
}

@riverpod
Future<FormCreationStrategy> _formCreationStrategy(
    _FormCreationStrategyRef ref, DActivity activity) async {
  return when(true, <bool?, FormCreationStrategy Function()>{
    _checkActivityType(activity.code, ActivityType.CHV_PATIENT): () =>
        CHVPatientFormStrategy(),
    _checkActivityType(activity.code, ActivityType.CHV_SESSION): () =>
        CHVSessionFormStrategy(),
    _checkActivityType(activity.code, ActivityType.ITN): () =>
        ITNFormStrategy(),
  }).orElse(() => throw Exception('Unknown activity type'));
}

//
// Future<void> navigateToForm(BuildContext context, DActivity activity) async {
//   // FormCreationStrategy? strategy;
//   // ActivityDataRepository? repository;
//
//   late final DTeam team;
//
//   // final repository = await _activityDataRepository(activity);
//   // final forms_widget_strategy = await _formCreationStrategy(activity);
//
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => ProviderScope(
//         overrides: [
//           // activityDataRepositoryProvider
//           //     .overrideWithValue(ActivityDataChvSessionRepository()),
//           // formCreationStrategyProvider.overrideWithValue(ITNFormStrategy()),
//         ],
//         child: DataSubmissionScreen(
//           form: null,
//         ),
//       ),
//     ),
//   );
// }
