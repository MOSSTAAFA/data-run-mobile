import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/metadatarun/activity/entities/d_activity.entity.dart';
import 'package:d2_remote/shared/entities/base.entity.dart';
import 'package:mass_pro/core/common/state.dart';

mixin ProjectActivityRepository<T extends BaseEntity> {
  Future<State> getState([String? id]);

  Future<List<DActivity>> get([String? id]) {
    final query = D2Remote.activityModuleD.activity;
    if (id != null) {
      D2Remote.activityModuleD.activity.byProject(id);
    }
    return query.get();
  }

  Future<int> getCount([String? id]);
}
