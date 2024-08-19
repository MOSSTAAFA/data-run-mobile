import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/screens/entities_list_screen/entities_list_screen.widget.dart';
import 'package:mass_pro/data_run/screens/entities_list_screen/state/entity_summary.dart';
import 'package:mass_pro/data_run/screens/entities_list_screen/state/form_submission_list_repository.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/get_error_widget.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/q_sync_icon_button.widget.dart';
import 'package:mass_pro/data_run/screens/sync_dialog/sync_dialog.widget.dart';
import 'package:mass_pro/data_run/screens/sync_dialog/sync_submission_repository.dart';
import 'package:mass_pro/generated/l10n.dart';

class EntityListItemSummary extends ConsumerStatefulWidget {
  const EntityListItemSummary(
      {super.key, this.onTap, required this.form, required this.entity});

  final GestureTapCallback? onTap;
  final DataFormSubmission entity;
  final String form;

  @override
  EntityListItemSummaryState createState() => EntityListItemSummaryState();
}

class EntityListItemSummaryState extends ConsumerState<EntityListItemSummary> {
  @override
  Widget build(BuildContext context) {
    final SyncableEntityState? entitySyncableStatus =
        SyncableEntityState.getEntityStatus(widget.entity);
    final AsyncValue<SubmissionSummary> submissionSummary = ref.watch(
        submissionSummaryProvider(
            submissionUid: widget.entity.uid!, form: widget.form));
    return switch (submissionSummary) {
      AsyncValue(:final Object error?, :final stackTrace) => getErrorWidget(error, stackTrace),
      AsyncValue(:final SubmissionSummary valueOrNull?) => ListTile(
          isThreeLine: true,
          leading: buildStatusIcon(entitySyncableStatus),
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(valueOrNull.orgUnit),
                Text(
                  '${S.of(context).version}: ${widget.entity.version}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ]),
          subtitle: Text(generateFormSummary(valueOrNull.formData)),
          trailing: QSyncIconButton(
            state: entitySyncableStatus,
            onUnsyncedPressed: () =>
                _showSyncDialog(<String>[widget.entity.uid!]),
          ),
          onTap: () {
            widget.onTap?.call();
          },
        ),
      _ => const SizedBox.shrink(),
    };
  }

  Future<void> _showSyncDialog(List<String> entityUids) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SyncDialog(
          entityUids: entityUids,
          syncEntity: (String uid) async {
            await ref
                .read(syncSubmissionRepositoryProvider)
                .syncEntities(<String>[uid]);
          },
        );
      },
    );
  }
}

String generateFormSummary(Map<String, dynamic> fields) {
  final String fieldSummary = fields.entries
      .where((MapEntry<String, dynamic> entry) =>
          entry.key != 'name' &&
          entry.value != null &&
          !syncableVariable.contains(entry.key))
      .take(3)
      .map((MapEntry<String, dynamic> entry) => '${entry.key}: ${entry.value}')
      .join(', ');

  return fieldSummary.isNotEmpty ? fieldSummary : 'No additional data';
}

final List<String> syncableVariable = <String>[
  'id',
  'lastSyncMessage',
  'uid',
  'code',
  'name',
  'createdDate',
  'lastModifiedDate',
  'deleted',
  'synced',
  'syncFailed',
  'lastSyncSummary',
  'lastSyncDate',
  'startEntryTime',
  'finishedEntryTime',
  'activity',
  'team',
  'status',
  'geometry',
  'dirty',
  'version',
  'form',
];
