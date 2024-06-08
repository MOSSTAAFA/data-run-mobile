import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/main/data/service/sync_status_data.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_item.model.dart';

abstract class ProjectDeckRepository {
  Future<IList<ProjectItemModel>> projectItems(SyncStatusData syncStatusData);

  Future<IList<ProjectItemModel>> projectCachedItems(
      SyncStatusData syncStatusData);
}
