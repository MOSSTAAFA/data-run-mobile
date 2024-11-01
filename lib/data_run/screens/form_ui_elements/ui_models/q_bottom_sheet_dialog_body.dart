import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/ui_models/bottomsheet/bottom_sheet_content_model.dart';

class BottomSheetDialogBodyWidget extends StatelessWidget {
  const BottomSheetDialogBodyWidget({
    super.key,
    required this.bodyModel,
    this.onItemClicked,
  });

  final BottomSheetBodyModel bodyModel;
  final Function(String? path)? onItemClicked;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: bodyModel.when(messageBody: (messageBody) {
            return [
              Text(
                messageBody,
                style: const TextStyle(fontSize: 16.0),
              )
            ];
          }, errorsBody:
              (message, Map<String, List<FieldWithIssue>> fieldsWithIssues) {
            return fieldsWithIssues.entries.map((sectionEntry) {
              final sectionName = sectionEntry.key;
              final fieldErrors = sectionEntry.value;

              return ExpansionTile(
                title: Text(
                  sectionName,
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                children: fieldErrors.map((fieldEntry) {
                  final fieldName = fieldEntry.fieldName;
                  final errorDescription = fieldEntry.message;

                  return GestureDetector(
                    onTap: () => onItemClicked?.call(fieldEntry.fieldPath),
                    child: ListTile(
                      leading: Icon(Icons.error, color: Colors.red),
                      title: Text('$fieldName: $errorDescription'),
                    ),
                  );
                }).toList(),
              );
            }).toList();
          }),
        ),
      ),
    );
  }
}
