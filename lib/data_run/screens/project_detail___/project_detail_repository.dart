// import 'package:mass_pro/sdk/core/common/feature_type.dart';
// import 'package:d2_remote/d2_remote.dart';
// import 'package:d2_remote/modules/activity_management/activity/entities/activity.entity.dart';
// import 'package:d2_remote/modules/data/tracker/entities/event.entity.dart';
// import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
// import 'package:d2_remote/modules/metadata/program/entities/program_stage.entity.dart';
// import 'package:d2_remote/modules/metadatarun/project/entities/d_project.entity.dart';
// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:get/get.dart';
// import 'package:mass_pro/data_run/screens/dashboard/dashboard_screen.widget.dart';
// import 'package:mass_pro/main/usescases/bundle/bundle.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// import 'package:mass_pro/commons/data/event_view_model.dart';
// import 'package:mass_pro/commons/data/program_event_view_model.dart';
// import 'package:mass_pro/commons/extensions/feature_type_extension.dart';
// import 'package:mass_pro/core/d2_remote_extensions/tracker/queries/base_query_extension.dart';
//
// part 'project_detail_repository.g.dart';
//
// /// ProgramEventDetailPresenter
// @riverpod
// ProjectDetailRepository projectDetailRepository(
//     ProjectDetailRepositoryRef ref) {
//   return ProjectDetailRepository(ref);
// }
//
// class ProjectDetailRepository {
//   ProjectDetailRepository(this.ref)
//       : projectUid = (Get.arguments as Bundle).getString(EXTRA_PROJECT_UID)!,
//         mapper = ref.read(programEventMapperProvider);
//
//   ProjectDetailRepositoryRef ref;
//   final String projectUid;
//   final ProgramEventMapper mapper;
//
//   Future<IList<EventModel>> projectActivities() async {
//     final List<Event> events = await D2Remote.trackerModule.event
//         .resetFilters()
//         .byProgram(projectUid)
//         .get();
//
//     final List<EventModel> eventsModels = [];
//     await Future.forEach(
//         events,
//         (Event it) async =>
//             eventsModels.add(await mapper.eventToEventViewModel(it)));
//     return eventsModels.lock;
//   }
//
//   Future<ProgramEventViewModel> getInfoForEvent(String eventUid) async {
//     return (await D2Remote.trackerModule.event
//             .byId(eventUid)
//             .withDataValues()
//             .getOne())!
//         .let(mapper.eventToProgramEvent);
//   }
//
//   Future<FeatureType> featureType() async {
//     return (await D2Remote.programModule.programStage
//             .resetFilters()
//             .byProgram(projectUid)
//             .getOne())!
//         .let((ProgramStage stage) {
//       if (stage.featureType != null)
//         return stage.featureType.toFeatureType!;
//       else
//         return FeatureType.NONE;
//     });
//   }
//
//   Future<Activity> getActivity(String selectedActivity) async {
//     return (await D2Remote.activityModule.activity
//         .byId(selectedActivity)
//         .getOne())!;
//   }
//
//   Future<DProject> project() async {
//     return (await D2Remote.programModule.program.byId(projectUid).getOne())!;
//   }
// }
