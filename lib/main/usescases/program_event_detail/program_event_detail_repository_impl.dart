import 'package:d2_remote/core/common/feature_type.dart';
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/activity_management/activity/entities/activity.entity.dart';
import 'package:d2_remote/modules/data/tracker/entities/event.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_stage.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:get/get.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../commons/data/event_view_model.dart';
import '../../../commons/data/program_event_view_model.dart';
import '../../../commons/extensions/feature_type_extension.dart';
import '../../../core/d2_remote_extensions/tracker/queries/base_query_extension.dart';
import '../bundle/bundle.dart';
import 'program_event_detail_repository.dart';
import 'program_event_detail_screen.widget.dart';
import 'program_event_map_data.dart';
import 'program_event_mapper.dart';

part 'program_event_detail_repository_impl.g.dart';

/// ProgramEventDetailPresenter
@riverpod
ProgramEventDetailRepository programEventDetailRepository(
    ProgramEventDetailRepositoryRef ref) {
  return ProgramEventDetailRepositoryImpl(ref);
}

class ProgramEventDetailRepositoryImpl implements ProgramEventDetailRepository {
  ProgramEventDetailRepositoryImpl(this.ref)
      : programUid = (Get.arguments as Bundle).getString(EXTRA_PROGRAM_UID)!,
        mapper = ref.read(programEventMapperProvider);

  ProgramEventDetailRepositoryRef ref;
  final String programUid;
  final ProgramEventMapper mapper;

  @override
  Future<IList<EventModel>> programEvents() async {
    final List<Event> events = await D2Remote.trackerModule.event
        .resetFilters()
        .byProgram(programUid)
        .get();

    final List<EventModel> eventsModels = [];
    await Future.forEach(
        events,
        (Event it) async =>
            eventsModels.add(await mapper.eventToEventViewModel(it)));
    return eventsModels.lock;
  }

  @override
  Future<ProgramEventMapData> filteredEventsForMap() {
    // TODO: implement filteredEventsForMap
    throw UnimplementedError();
  }

  @override
  Future<ProgramEventViewModel> getInfoForEvent(String eventUid) async {
    return (await D2Remote.trackerModule.event
            .byId(eventUid)
            .withDataValues()
            .getOne())!
        .let(mapper.eventToProgramEvent);
  }

  @override
  Future<FeatureType> featureType() async {
    return (await D2Remote.programModule.programStage
            .resetFilters()
            .byProgram(programUid)
            .getOne())!
        .let((ProgramStage stage) {
      if (stage.featureType != null)
        return stage.featureType.toFeatureType!;
      else
        return FeatureType.NONE;
    });
  }

  @override
  Future<Activity> getActivity(String selectedActivity) async {
    return (await D2Remote.activityModule.activity
        .byId(selectedActivity)
        .getOne())!;
  }

  @override
  Future<ProgramStage?> programStage() async {
    return D2Remote.programModule.programStage
        .resetFilters()
        .byProgram(programUid)
        .getOne();
  }

  @override
  Future<Program> program() async {
    return (await D2Remote.programModule.program.byId(programUid).getOne())!;
  }

  @override
  Future<bool> getAccessDataWrite() {
    // TODO: implement getAccessDataWrite
    return Future.value(true);
  }

  @override
  Future<bool> hasAccessToAllCatOptions() async {
    // TODO: implement hasAccessToAllCatOptions
    return true;
    // throw UnimplementedError();
  }

  @override
  Future<bool> programHasAnalytics() {
    // TODO: implement programHasAnalytics
    return Future.value(false);
    // throw UnimplementedError();
  }

  @override
  Future<bool> programHasCoordinates() {
    // TODO: implement programHasCoordinates
    return Future.value(false);
    // throw UnimplementedError();
  }
}
