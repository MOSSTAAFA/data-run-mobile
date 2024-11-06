import 'package:flutter/material.dart';
import 'package:datarun/data_run/screens/form_ui_elements/bottom_sheet/bottom_sheet_model/bottom_sheet_content_model.dart';

class FieldsWithIssuesBody extends StatelessWidget {
  const FieldsWithIssuesBody({
    super.key,
    required this.fieldsWithIssues,
    required this.totalFields,
    this.onItemClicked,
  });

  final int totalFields;
  final Function(String? path)? onItemClicked;
  final Map<String, List<FieldWithIssue<dynamic>>> fieldsWithIssues;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children:
              fieldsWithIssues.entries.toList().reversed.map((sectionEntry) {
            final sectionName = sectionEntry.key;
            final fields = sectionEntry.value.reversed;

            return ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                sectionName,
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              children: fields.map((fieldEntry) {
                return GestureDetector(
                  onTap: () => onItemClicked?.call(fieldEntry.fieldPath),
                  child: ListTile(
                    dense: true,
                    leading: const Icon(Icons.error, color: Colors.red),
                    title:
                        Text('${fieldEntry.fieldName}: ${fieldEntry.message}'),
                  ),
                );
              }).toList(),
            );
          }).toList(),
        ),
      ),
    );
    ;
  }
}
