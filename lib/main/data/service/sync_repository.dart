import 'package:d2_remote/modules/data/tracker/entities/event.entity.dart';
import 'package:d2_remote/modules/data/tracker/entities/tracked-entity.entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/common/state.dart';
import 'sync_repository_impl.dart';

part 'sync_repository.g.dart';

@riverpod
SyncRepository syncRepository(SyncRepositoryRef ref) {
  return SyncRepositoryImpl();
}

abstract class SyncRepository {
  Future<List<TrackedEntityInstance>> getTeiByNotInStates(
      String uid, List<State> states);

  Future<List<TrackedEntityInstance>> getTeiByInStates(
      String uid, List<State> states);

  Future<List<Event>> getEventsFromEnrollmentByNotInSyncState(
      String uid /* , List<State> states */);
}
