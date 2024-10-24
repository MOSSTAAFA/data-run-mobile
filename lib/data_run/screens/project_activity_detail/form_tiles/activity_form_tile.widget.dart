import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
import 'package:mass_pro/data_run/screens/project_activity_detail/form_tiles/submissions_chips.widget.dart';
import 'package:mass_pro/generated/l10n.dart';

class ActivityFormTile extends StatelessWidget {
  const ActivityFormTile({
    super.key,
    required this.onTap,
    required this.onAddNew,
  });

  final void Function()? onTap;
  final void Function()? onAddNew;

  @override
  Widget build(BuildContext context) {
    final formMetadata = FormMetadataWidget.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          formMetadata.formLabel,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${S.of(context).version}: ${formMetadata.version}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const SubmissionsChips(),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        ElevatedButton.icon(
                          onPressed: onAddNew,
                          icon: const Icon(Icons.add),
                          label: Text(S.of(context).addNew),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
