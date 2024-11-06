import 'package:flutter/material.dart';
import 'package:datarun/data_run/screens/form_ui_elements/bottom_sheet/all_fields_body.dart';
import 'package:datarun/data_run/screens/form_ui_elements/bottom_sheet/fields_with_issues_body.dart';
import 'package:datarun/data_run/screens/form_ui_elements/bottom_sheet/form_completion_dialog_config/form_completion_dialog.dart';
import 'package:datarun/generated/l10n.dart';

class QBottomSheet extends StatelessWidget {
  const QBottomSheet({
    super.key,
    required this.completionDialogModel,
    this.onButtonClicked,
    this.onItemClicked,
  });

  final FormCompletionDialog completionDialogModel;
  final Function(FormBottomDialogActionType? action)? onButtonClicked;
  final Function(String? path)? onItemClicked;

  @override
  Widget build(BuildContext context) {
    final fieldsWithIssues =
        completionDialogModel.bottomSheetContentModel.body.fieldsWithIssues;
    final allFields =
        completionDialogModel.bottomSheetContentModel.body.allFields;
    final message = completionDialogModel.bottomSheetContentModel.body.message;
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(completionDialogModel.bottomSheetContentModel.icon, size: 30),
            const SizedBox(height: 10),
            Text(
              completionDialogModel.bottomSheetContentModel.title,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),
            // TabBarView to switch between tabs
            Expanded(
              child: TabBarView(
                children: [
                  fieldsWithIssues.isNotEmpty
                      ? FieldsWithIssuesBody(
                          totalFields: allFields.length,
                          fieldsWithIssues: fieldsWithIssues,
                          onItemClicked: onItemClicked,
                        )
                      : Center(
                          child: Text(
                            S.of(context).markAsFinalData,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ),
                  // "Issues Only" Tab Content

                  // "Full Summary" Tab Content
                  AllFieldsBody(
                    fieldsWithIssues: allFields,
                    onItemClicked: onItemClicked,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Add Tabs
            TabBar(
              tabs: [
                Tab(icon: Icon(Icons.error_outline), text: 'Issues'),
                Tab(icon: Icon(Icons.list_alt), text: 'Summary'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildButton(context, completionDialogModel.secondaryButton),
                _buildButton(context, completionDialogModel.mainButton),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, FormCompletionButton button) {
    return ElevatedButton.icon(
      onPressed: () {
        onButtonClicked?.call(button.action);
        Navigator.pop(context);
      },
      icon: button.buttonStyle.iconData != null
          ? Icon(button.buttonStyle.iconData)
          : const SizedBox.shrink(),
      label: Text(button.buttonStyle.text),
      style: ElevatedButton.styleFrom(
        foregroundColor: button.buttonStyle.color,
        backgroundColor: button.buttonStyle.backgroundColor,
      ),
    );
  }
}
