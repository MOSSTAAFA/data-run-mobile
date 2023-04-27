import 'package:d2_remote/core/annotations/index.dart';
import 'package:dartx/dartx.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:queue/queue.dart';
import 'package:reflectable/reflectable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../arch/call/d2_progress.dart';

part 'sync_metadata.g.dart';

@Riverpod(keepAlive: true)
SyncMetadata syncMetadata(SyncMetadataRef ref) {
  return SyncMetadata();
}

class SyncMetadata {
  SyncMetadata() {
    metadataSyncInProgress = false;
  }

  late bool metadataSyncInProgress;

  Future<void> download(
      {required Function(
              IList<D2Progress>? progress, bool isComplete, dynamic anyError)
          callback}) async {
    if (!metadataSyncInProgress) {
      metadataSyncInProgress = true;

      try {
        final Iterable<ClassMirror> annotatedClasses =
            AnnotationReflectable.annotatedClasses;

        final IList<ClassMirror> queryMetadataItems = annotatedClasses
            .where((classMirror) {
              final items = classMirror.metadata.whereType<Query>();
              return items.isNotEmpty &&
                  items.first.type == QueryType.METADATA &&

                  /// aut == true Metadata are automatically downloaded
                  /// using sync, but Metadata with aut set to false are
                  /// only downloaded on User Request.
                  items.first.aut;
            })
            .toList()
            .lock;
        IList<D2Progress> requestProgresses = queryMetadataItems
            .map((queryResource) => D2Progress(
                message:
                    'Downloading ${queryResource.simpleName.toUpperCase()} from the server',
                isComplete: false,
                percentage: 0))
            .toIList();

        final IList<
                void Function(D2Progress progress, bool isComplete, dynamic)>
            requestProgressCallbacks =
            queryMetadataItems.mapIndexed((index, queryResource) {
          return (D2Progress progress, bool isComplete, dynamic e) {
            if (requestProgresses.length >= index) {
              requestProgresses = requestProgresses.replace(
                  index, progress.copyWith(isComplete: isComplete));
              callback.call(requestProgresses, isComplete, e);
            }
          };
        }).toIList();

        final queue = Queue(parallel: 2);

        queryMetadataItems.forEachIndexed((queryMetadata, index) {
          final dynamic metadataEntityQuery = queryMetadata
              .newInstance('', [], {const Symbol('database'): null});

          queue.add(
              () => metadataEntityQuery.download((requestProgress, isComplete) {
                    requestProgressCallbacks
                        .getOrNull(index)
                        ?.call(requestProgress, isComplete, null);
                  }));
        });

        await queue.onComplete;

        callback(requestProgresses, true, null);
      } catch (e) {
        callback(null, true, e);
      }
    }
  }
}
