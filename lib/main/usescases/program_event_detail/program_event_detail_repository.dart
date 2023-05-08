import 'package:d2_remote/core/common/feature_type.dart';
import 'package:d2_remote/modules/activity_management/activity/entities/activity.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_stage.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../../../commons/data/event_view_model.dart';
import '../../../commons/data/program_event_view_model.dart';
import 'program_event_map_data.dart';

abstract class ProgramEventDetailRepository {
  Future<IList<EventModel>> programEvents();

  /// Flowable
  Future<ProgramEventMapData> filteredEventsForMap();

  /// Observable
  Future<Program> program();

  Future<bool> getAccessDataWrite();

  /// Single
  Future<bool> hasAccessToAllCatOptions();

  /// Flowable
  Future<ProgramEventViewModel> getInfoForEvent(String eventUid);

  /// Single
  Future<FeatureType> featureType();

  Future<Activity> getActivity(String selectedActivity);

  /// Single
  // Future<List<EventFilter>> workingLists();

  /// Single
  Future<ProgramStage?> programStage();

  Future<bool> programHasCoordinates();

  Future<bool> programHasAnalytics();
}
