import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_deck/project_detail_item.model.dart';
import 'package:mass_pro/main/data/service/sync_status_data.dart';

abstract class ProjectDetailDeckRepository {
  Future<IList<ProjectDetailItemModel>> projectDetailDeckItems(SyncStatusData syncStatusData);

  Future<IList<ProjectDetailItemModel>> projectDetailDeckCachedItems(
      SyncStatusData syncStatusData);
}
