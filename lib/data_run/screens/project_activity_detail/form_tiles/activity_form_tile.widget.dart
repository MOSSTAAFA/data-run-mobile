import 'package:d2_remote/modules/datarun/form/entities/dynamic_form.entity.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/project_activity_detail/form_tiles/submissions_chips.widget.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:mass_pro/generated/l10n.dart';

class ActivityFormTile extends StatelessWidget {
  const ActivityFormTile({
    super.key,
    required this.template,
    required this.onTap,
    required this.onAddNew,
  });

  final FormTemplate template;
  final void Function()? onTap;
  final void Function()? onAddNew;

  @override
  Widget build(BuildContext context) {
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
                          getItemLocalString(template.label,
                              defaultString: template.name)!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${S.of(context).version}: ${template.version}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    SubmissionsChips(
                      form: template.uid!,
                    ),
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
