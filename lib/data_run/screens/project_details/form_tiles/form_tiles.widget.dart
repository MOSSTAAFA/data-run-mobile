import 'package:fast_immutable_collections/src/ilist/ilist.dart';
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
    final AsyncValue<IList<FormListItemModel>> formsList = ref.watch(formListItemModelsProvider);

    return formsList.when(
      data: (IList<FormListItemModel> data) => Column(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  t.formName!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${S.of(context).version}: ${t.version}',
                                  style: Theme.of(context).textTheme.bodySmall,
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
                                  avatar: const CircleAvatar(
                                    child: Icon(Icons.error),
                                  ),
                                  label: Text('${t.entitiesWithError}'),
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
      error: (Object error, StackTrace s) {
        debugPrint('error: $error');
        debugPrintStack(stackTrace: s, label: error.toString());
        return Text('Error: $error');
      },
      loading: () => const CircularProgressIndicator(),
    );
  }
}
