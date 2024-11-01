import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/form/form_submission/submission_list.provider.dart';
import 'package:mass_pro/data_run/form/form_submission/submission_summary.model.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/get_error_widget.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/q_sync_icon_button.widget.dart';
import 'package:mass_pro/data_run/screens/form_submission_list/submission_list_screen.widget.dart';
import 'package:mass_pro/generated/l10n.dart';

class SubmissionInfo extends ConsumerStatefulWidget {
  const SubmissionInfo({
    super.key,
    this.onTap,
    required this.submissionEntity,
    this.onSyncPressed,
  });

  final GestureTapCallback? onTap;
  final DataFormSubmission submissionEntity;
  final Function(String uid)? onSyncPressed;

  @override
  SubmissionInfoState createState() => SubmissionInfoState();
}

class SubmissionInfoState extends ConsumerState<SubmissionInfo> {
  @override
  Widget build(BuildContext context) {
    final AsyncValue<SubmissionItemSummaryModel> submissionSummaryModelValue =
        ref.watch(submissionInfoProvider(
            formMetadata: FormMetadataWidget.of(context)));

    return submissionSummaryModelValue.when(
      error: (error, stackTrace) => getErrorWidget(error, stackTrace),
      data: (submissionSummary) => ListTile(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        leading: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 16,
              child: buildStatusIcon(submissionSummary.syncStatus),
              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            ),
            const SizedBox(height: 4),
            Text(
              'V${widget.submissionEntity.version}',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
        title: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                submissionSummary.orgUnit,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete, size: 20),
              onPressed: () =>
                  _confirmDelete(context, widget.submissionEntity.uid),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (submissionSummary.code != null)
              Text(
                'Code: ${submissionSummary.code}',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            Text(
              generateFormSummary(submissionSummary.formData.unlock),
              style: Theme.of(context).textTheme.labelMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        trailing: QSyncIconButton(
          state: submissionSummary.syncStatus,
          onUnsyncedPressed: () =>
              widget.onSyncPressed?.call(widget.submissionEntity.uid!),
        ),
        onTap: widget.onTap,
      ),
      loading: () => const CircularProgressIndicator(),
    );
  }

  Future<void> _confirmDelete(BuildContext context, String? uid) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).confirm),
          content: Text(S.of(context).deleteConfirmationMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(S.of(context).cancel),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(S.of(context).confirm),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      _showUndoSnackBar(context, uid);
    }
  }

  void _showUndoSnackBar(BuildContext context, String? toDeleteUid) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final formMetadata = FormMetadataWidget.of(context);

    ref
        .read(formSubmissionsProvider(formMetadata.form).notifier)
        .deleteSubmission([toDeleteUid]);

    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: const Text("Item removed"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            // Code to undo deletion
          },
        ),
      ),
    );
  }
}

// class SubmissionInfo extends ConsumerStatefulWidget {
//   const SubmissionInfo(
//       {super.key,
//       this.onTap,
//       required this.submissionEntity,
//       this.onSyncPressed});
//
//   final GestureTapCallback? onTap;
//   final DataFormSubmission submissionEntity;
//   final Function(String uid)? onSyncPressed;
//
//   @override
//   SubmissionInfoState createState() => SubmissionInfoState();
// }
//
// class SubmissionInfoState extends ConsumerState<SubmissionInfo> {
//
//   @override
//   Widget build(BuildContext context) {
//     final AsyncValue<SubmissionItemSummaryModel> submissionSummaryModelValue =
//         ref.watch(submissionInfoProvider(
//             formMetadata: FormMetadataWidget.of(context)));
//     return switch (submissionSummaryModelValue) {
//       AsyncValue(error: final error?, stackTrace: final stackTrace) =>
//         getErrorWidget(error, stackTrace),
//       AsyncValue(valueOrNull: final submissionSummary?) => ListTile(
//           isThreeLine: true,
//           leading: Column(
//             children: [
//               buildStatusIcon(submissionSummary.syncStatus),
//               Text(
//                 'V: ${widget.submissionEntity.version}',
//                 style: TextStyle(
//                     color: Theme.of(context).colorScheme.secondary,
//                     fontSize: Theme.of(context).textTheme.bodySmall?.fontSize),
//               )
//             ],
//           ),
//           title: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text(submissionSummary.orgUnit),
//                 IconButton(
//                     onPressed: () =>
//                         _confirmDelete(context, widget.submissionEntity.uid),
//                     icon: Icon(Icons.delete)),
//               ]),
//           subtitle: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               if (submissionSummary.code != null)
//                 Text(submissionSummary.code!,
//                     style: TextStyle(
//                         color: Theme.of(context).colorScheme.secondary,
//                         fontSize:
//                             Theme.of(context).textTheme.bodySmall?.fontSize)),
//               Divider(),
//               Text(generateFormSummary(submissionSummary.formData.unlock),
//                   style: Theme.of(context).textTheme.bodySmall),
//             ],
//           ),
//           trailing: Column(
//             children: [
//               QSyncIconButton(
//                 state: submissionSummary.syncStatus,
//                 onUnsyncedPressed: () =>
//                     widget.onSyncPressed?.call(widget.submissionEntity.uid!),
//                 // onUnsyncedPressed: () =>
//                 //     _showSyncDialog(<String>[widget.entity.uid!]),
//               ),
//             ],
//           ),
//           onTap: () {
//             widget.onTap?.call();
//           },
//         ),
//       _ => const SizedBox.shrink(),
//     };
//   }
//
//   Future<void> _confirmDelete(BuildContext context, String? uid) async {
//     final confirmed = await showDialog<bool>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(S.of(context).confirm),
//           content: Text(
//             S.of(context).conformDeleteMsg,
//           ),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(false);
//               },
//               child: Text(S.of(context).cancel),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(true);
//               },
//               child: Text(S.of(context).confirm),
//             ),
//           ],
//         );
//       },
//     );
//
//     if (confirmed == true) {
//       _showUndoSnackBar(context, uid);
//     }
//   }
//
//   void _showUndoSnackBar(BuildContext context, String? toDeleteUid) {
//     final scaffoldMessenger = ScaffoldMessenger.of(context);
//     final formMetadata = FormMetadataWidget.of(context);
//
//     ref
//         .read(formSubmissionsProvider(formMetadata.form).notifier)
//         .deleteSubmission([toDeleteUid]);
//
//     scaffoldMessenger.showSnackBar(
//       SnackBar(
//         content: Text(S.of(context).itemRemoved), // Localized: "Item removed"
//         action: SnackBarAction(
//           label: S.of(context).undo, // Localized: "Undo"
//           onPressed: () {
//             // Code to undo deletion
//           },
//         ),
//       ),
//     );
//   }
//
// }

String generateFormSummary(Map<String, dynamic> fields, [int itemsToTake = 5]) {
  final String fieldSummary = fields.entries
      .where((MapEntry<String, dynamic> entry) =>
          entry.key != 'name' &&
          entry.value != null &&
          !(entry.value is List) &&
          !syncableVariable.contains(entry.key))
      .take(itemsToTake)
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
  'orgUnit',
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
  'formData',
];
