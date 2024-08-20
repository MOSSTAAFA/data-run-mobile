import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/screens/submission_list/model/submission_list.provider.dart';
import 'package:mass_pro/data_run/screens/submission_list/model/submission_summary.model.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/get_error_widget.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/q_sync_icon_button.widget.dart';
import 'package:mass_pro/data_run/screens/submission_list/submission_list_screen.widget.dart';
import 'package:mass_pro/generated/l10n.dart';

class SubmissionSummary extends ConsumerStatefulWidget {
  const SubmissionSummary(
      {super.key,
      this.onTap,
      required this.form,
      required this.entity,
      this.onSyncPressed});

  final GestureTapCallback? onTap;
  final DataFormSubmission entity;
  final String form;
  final Function(String uid)? onSyncPressed;

  @override
  SubmissionSummaryState createState() => SubmissionSummaryState();
}

class SubmissionSummaryState extends ConsumerState<SubmissionSummary> {
  @override
  Widget build(BuildContext context) {
    final SyncableEntityState? entitySyncableStatus =
        SyncableEntityState.getEntityStatus(widget.entity);
    final AsyncValue<SubmissionItemSummaryModel> submissionSummaryModelValue =
        ref.watch(submissionItemSummaryModelProvider(
            submissionUid: widget.entity.uid!, form: widget.form));
    return switch (submissionSummaryModelValue) {
      AsyncValue(error: final error?, stackTrace: final stackTrace) =>
        getErrorWidget(error, stackTrace),
      AsyncValue(valueOrNull: final valueOrNull?) => ListTile(
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
                widget.onSyncPressed?.call(widget.entity.uid!),
            // onUnsyncedPressed: () =>
            //     _showSyncDialog(<String>[widget.entity.uid!]),
          ),
          onTap: () {
            widget.onTap?.call();
          },
        ),
      _ => const SizedBox.shrink(),
    };
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
