import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_item.model.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_items_models_notifier.dart';
import 'package:mass_pro/generated/l10n.dart';

class FormsTiles extends ConsumerWidget {
  const FormsTiles({
    super.key,
    this.onAdd,
    this.onList,
  });

  final void Function(FormListItemModel? formModel)? onAdd;
  final void Function(FormListItemModel? formModel)? onList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formsList = ref.watch(formListItemModelsProvider);

    return formsList.when(
      data: (data) => Column(
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
                          children: [
                            Text(
                              t.formName!,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8.0,
                              runSpacing: 4.0,
                              children: [
                                /// Sent
                                Chip(
                                    avatar: CircleAvatar(
                                        foregroundColor: t.entitiesSynced > 0
                                            ? Colors.green
                                            : Colors.grey,
                                        child: const Icon(Icons.cloud_done)),
                                    label: Text('${t.entitiesSynced}')),

                                /// Finished
                                Chip(
                                  avatar: CircleAvatar(
                                      foregroundColor: t.entitiesToPost > 0
                                          ? Colors.blue
                                          : Colors.grey,
                                      child: const Icon(Icons.cloud_upload)),
                                  label: Text('${t.entitiesToPost}'),
                                ),

                                /// Not Finished
                                Chip(
                                  avatar: CircleAvatar(
                                    foregroundColor: t.entitiesToUpdate > 0
                                        ? Colors.orange
                                        : Colors.grey,
                                    child: const Icon(Icons.update),
                                  ),
                                  label: Text('${t.entitiesToUpdate}'),
                                ),

                                /// Errors
                                Chip(
                                  avatar: CircleAvatar(
                                    foregroundColor: t.entitiesWithError > 0
                                        ? Colors.redAccent
                                        : Colors.grey,
                                    child: Icon(Icons.error),
                                  ),
                                  label: Text('${t.entitiesWithError}'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // ElevatedButton.icon(
                                //   onPressed: () => onList?.call(t),
                                //   icon: const Icon(Icons.list),
                                //   label: Text(S.of(context).viewList),
                                //   style: ElevatedButton.styleFrom(
                                //     backgroundColor: Colors.blue,
                                //     foregroundColor: Colors.white,
                                //   ),
                                // ),
                                // OverlayConfirmButton(
                                //   label: 'Add New',
                                //   icon: Icons.add,
                                //   color: Colors.green,
                                //   onConfirm: () {
                                //     onAdd?.call(t);
                                //   },
                                // ),
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
                                ),
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
      error: (error, _) => Text('Error: $error'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
