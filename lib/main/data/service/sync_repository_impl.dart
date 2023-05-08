import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/entities/event.entity.dart';
import 'package:d2_remote/modules/data/tracker/entities/tracked-entity.entity.dart';
import 'package:dartx/dartx_io.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../../../core/common/state.dart';
import 'sync_repository.dart';

class SyncRepositoryImpl implements SyncRepository {
  @override
  Future<List<TrackedEntityInstance>> getTeiByNotInStates(
      String uid, List<State> states) {
    if (states.lock.containsAny(State.uploadableStatesIncludingError)) {
      // return dirty
      return D2Remote.trackerModule.trackedEntityInstance
          .byId(uid)
          .where(attribute: 'dirty', value: false)
          .get();
    } else {
      // return synced
      return D2Remote.trackerModule.trackedEntityInstance
          .byId(uid)
          .where(attribute: 'dirty', value: true)
          .get();
    }
  }

  @override
  Future<List<TrackedEntityInstance>> getTeiByInStates(
      String uid, List<State> states) {
    if (states.lock.containsAny(State.uploadableStatesIncludingError)) {
      // return dirty
      return D2Remote.trackerModule.trackedEntityInstance
          .byId(uid)
          .where(attribute: 'dirty', value: true)
          .get();
    } else {
      // return synced
      return D2Remote.trackerModule.trackedEntityInstance
          .byId(uid)
          .where(attribute: 'dirty', value: false)
          .get();
    }
  }

  @override
  Future<List<Event>> getEventsFromEnrollmentByNotInSyncState(
      String uid /* , List<State> states */) {
    return D2Remote.trackerModule.event
        .byEnrollment(uid)
        .where(attribute: 'dirty', value: true)
        .get();
  }
}
