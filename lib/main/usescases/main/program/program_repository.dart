import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../../../data/service/sync_status_data.dart';
import 'program_view.model.dart';

abstract class ProgramRepository {
  Future<IList<ProgramViewModel>> homeItems(SyncStatusData syncStatusData);

  Future<IList<ProgramViewModel>> programModels(SyncStatusData syncStatusData);

  Future<IList<ProgramViewModel>> aggregatesModels(
      SyncStatusData syncStatusData);
}
