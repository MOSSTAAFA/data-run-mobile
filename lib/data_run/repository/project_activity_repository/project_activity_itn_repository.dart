import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/metadatarun/activity/entities/d_activity.entity.dart';
import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/repository/project_activity_repository/project_activity_repository.dart';

class ProjectActivityItnRepository with ProjectActivityRepository<DActivity> {
  ProjectActivityItnRepository();

  @override
  Future<int> getCount([String? id]) async {
    final data = await get();
    return data.length;
  }

  @override
  Future<State> getState([String? id]) async {
    final query = D2Remote.itnsVillageModule.itnsVillage;

    if (id != null) {
      query.where(attribute: 'activity', value: id);
    }

    final withSyncErrorState = await query.withSyncErrorState().count();

    final withUpdateErrorState =
        await query.withUpdateSyncedErrorState().count();

    final withToPostState = await query.withToPostState().count();
    final withToUpdateState = await query.withToUpdateState().count();

    return when(true, {
      withUpdateErrorState > 0 || withSyncErrorState > 0: () => State.WARNING,
      withToPostState > 0: () => State.TO_POST,
      withToUpdateState > 0: () => State.TO_UPDATE,
    }).orElse(() => State.SYNCED);
  }
}
