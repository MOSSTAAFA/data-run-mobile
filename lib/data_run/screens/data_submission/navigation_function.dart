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
