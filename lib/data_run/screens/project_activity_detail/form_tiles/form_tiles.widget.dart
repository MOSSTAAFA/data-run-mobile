import 'package:fast_immutable_collections/src/ilist/ilist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/project_activity_detail/model/project_detail_item.model.dart';
import 'package:mass_pro/data_run/screens/project_activity_detail/model/project_detail_items_models_notifier.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/get_error_widget.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:mass_pro/generated/l10n.dart';

class FormsTiles extends ConsumerWidget {
  const FormsTiles(
      {super.key,
      this.onAdd,
      this.onList,
      required this.activity,
      required this.team});

  final void Function(FormListItemModel? formModel)? onAdd;
  final void Function(FormListItemModel? formModel)? onList;
  final String activity;
  final String team;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<IList<FormListItemModel>> formModelsList =
        ref.watch(formListItemModelsProvider(activity: activity, team: team));

    return switch (formModelsList) {
      AsyncValue(error: final error?, stackTrace: final stackTrace) =>
        getErrorWidget(error, stackTrace),
      AsyncValue(valueOrNull: final data?) => Column(
          children: data
              .map<Widget>((FormListItemModel t) => Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          onList?.call(t);
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    getItemLocalString(t.form.label, defaultString: t.form.name),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${S.of(context).version}: ${t.form.version}',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 8.0,
                                runSpacing: 4.0,
                                children: <Widget>[
                                  /// Sent
                                  Chip(
                                      avatar: CircleAvatar(
                                          foregroundColor:
                                              t.entityCountByStatus.synced > 0
                                                  ? Colors.green
                                                  : Colors.grey,
                                          child: const Icon(Icons.cloud_done)),
                                      label: Text(
                                          '${t.entityCountByStatus.synced}')),

                                  /// Finished
                                  Chip(
                                    avatar: CircleAvatar(
                                        foregroundColor:
                                            t.entityCountByStatus.toPost > 0
                                                ? Colors.blue
                                                : Colors.grey,
                                        child: const Icon(Icons.cloud_upload)),
                                    label:
                                        Text('${t.entityCountByStatus.toPost}'),
                                  ),

                                  /// Not Finished
                                  Chip(
                                    avatar: CircleAvatar(
                                      foregroundColor:
                                          t.entityCountByStatus.toUpdate > 0
                                              ? Colors.orange
                                              : Colors.grey,
                                      child: const Icon(Icons.update),
                                    ),
                                    label: Text(
                                        '${t.entityCountByStatus.toUpdate}'),
                                  ),

                                  /// Errors
                                  Chip(
                                    avatar: const CircleAvatar(
                                      child: Icon(Icons.error),
                                    ),
                                    label: Text(
                                        '${t.entityCountByStatus.withError}'),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      onAdd?.call(t);
                                    },
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
                    ),
                  ))
              .toList(),
        ),
      _ => const CircularProgressIndicator(),
    };
  }
}
