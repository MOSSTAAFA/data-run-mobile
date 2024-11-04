import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/bottom_sheet/bottom_sheet_model/bottom_sheet_content_model.dart';
import 'package:mass_pro/generated/l10n.dart';

class AllFieldsBody extends StatelessWidget {
  const AllFieldsBody(
      {super.key, this.onItemClicked, required this.fieldsWithIssues});

  final Function(String? path)? onItemClicked;
  final Map<String, List<FieldWithIssue<dynamic>>> fieldsWithIssues;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: fieldsWithIssues.entries.map((sectionEntry) {
            final sectionName = sectionEntry.key;
            final fields = sectionEntry.value;

            return ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                sectionName,
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              children: fields.map((fieldEntry) {
                final hasError = fieldEntry.message != null;
                return GestureDetector(
                  onTap: () => onItemClicked?.call(fieldEntry.fieldPath),
                  child: ListTile(
                    dense: true,
                    leading: Icon(
                      hasError ? Icons.error : Icons.check_circle,
                      color: hasError ? Colors.red : Colors.green,
                    ),
                    title: Text(
                      '${fieldEntry.fieldName}: ${fieldEntry.value ?? S.of(context).empty}',
                    ),
                    subtitle: hasError ? Text(fieldEntry.message!) : null,
                  ),
                );
              }).toList(),
            );
          }).toList(),
        ),
      ),
    );
  }
}
