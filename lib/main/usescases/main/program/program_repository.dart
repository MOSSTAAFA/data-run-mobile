import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'program_view_model.dart';

abstract class ProgramRepository {
  Future<IList<ProgramViewModel>> homeItems(
      /* SyncStatusData syncStatusData */);
  Future<IList<ProgramViewModel>> programModels(
      /* SyncStatusData syncStatusData */);
  Future<IList<ProgramViewModel>> aggregatesModels(
      /* 
      SyncStatusData syncStatusData */
      );
}
