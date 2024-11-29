import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:d2_remote/modules/datarun/form/entities/form_template.entity.dart';
import 'package:d2_remote/modules/datarun/form/entities/form_version.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/field_template/field_template.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/field_template/section_template.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/field_template/template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:datarun/data_run/form/form_submission/submission_list.provider.dart';
import 'package:datarun/data_run/form/form_submission/submission_summary.model.dart';
import 'package:datarun/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
import 'package:datarun/data_run/screens/form_ui_elements/get_error_widget.dart';
import 'package:datarun/data_run/screens/form_ui_elements/q_sync_icon_button.widget.dart';
import 'package:datarun/data_run/screens/form_submission_list/submission_list_screen.widget.dart';
import 'package:datarun/generated/l10n.dart';

class SubmissionInfo extends ConsumerStatefulWidget {
  const SubmissionInfo({
    super.key,
    required this.rootSection,
    this.onTap,
    required this.submissionEntity,
    this.onSyncPressed,
  });

  final GestureTapCallback? onTap;
  final DataFormSubmission submissionEntity;
  final SectionTemplate rootSection;
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
              generateFormSummary(
                  submissionSummary.formData.unlock, widget.rootSection),
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

  String generateFormSummary(
      Map<String, dynamic> fields, SectionTemplate rootSection,
      [int itemsToTake = 5]) {
    final mainValues = extractValues(fields, rootSection.fields.unlockView,
        criteria: (t) => t is FieldTemplate && t.mainField == true);

    final String fieldSummary =
        // fields.entries
        //     .where((MapEntry<String, dynamic> entry) =>
        //         entry.key != 'name' &&
        //         entry.value != null &&
        //         !(entry.value is List) &&
        //         !syncableVariable.contains(entry.key))
        //     .take(itemsToTake)
        //     .map((MapEntry<String, dynamic> entry) => '${entry.key}: ${entry.value}')
        mainValues.join(', ');

    return fieldSummary.isNotEmpty ? fieldSummary : 'No additional data';
  }
}

//
// final List<String> syncableVariable = <String>[
//   'id',
//   'lastSyncMessage',
//   'uid',
//   'code',
//   'name',
//   'orgUnit',
//   'createdDate',
//   'lastModifiedDate',
//   'deleted',
//   'synced',
//   'syncFailed',
//   'lastSyncSummary',
//   'lastSyncDate',
//   'startEntryTime',
//   'finishedEntryTime',
//   'activity',
//   'team',
//   'status',
//   'geometry',
//   'dirty',
//   'version',
//   'form',
//   'formData',
// ];

List<dynamic> extractValues(
  Map<String, dynamic> formValues,
  List<Template> templates, {
  bool Function(Template)? criteria,
}) {
  final extractedValues = <dynamic>[];

  for (final template in templates) {
    // Check if this template matches the criteria
    if (criteria == null || criteria(template)) {
      if (formValues.containsKey(template.name)) {
        final value = formValues[template.name];
        if (template.fields.isNotEmpty && value is Map<String, dynamic>) {
          // If the value is a nested Map, recurse into it
          extractedValues.addAll(extractValues(
              value, template.fields.unlockView,
              criteria: criteria));
        } else if (template.fields.isNotEmpty && value is List) {
          // If the value is a List, iterate through it
          for (final item in value) {
            if (item is Map<String, dynamic>) {
              extractedValues.addAll(extractValues(
                  item, template.fields.unlockView,
                  criteria: criteria));
            } else {
              extractedValues.add(item);
            }
          }
        } else {
          // Otherwise, collect the value
          extractedValues.add(value);
        }
      }
    }
  }

  return extractedValues;
}
