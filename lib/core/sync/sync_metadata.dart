import 'package:d2_remote/modules/datarun_shared/sync/sync_metadata.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sync_metadata.g.dart';

@Riverpod(keepAlive: true)
SyncMetadata syncMetadata(SyncMetadataRef ref) {
  return SyncMetadata();
}
