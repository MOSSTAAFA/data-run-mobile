import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/constants.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/form/form_configuration.dart';
import 'package:mass_pro/data_run/screens/form_reactive/form_tab_screen.widget.dart';
import 'package:mass_pro/data_run/screens/form_submission_list/model/submission_list.provider.dart';
import 'package:mass_pro/data_run/screens/form_submission_list/submission_summary.widget.dart';
import 'package:mass_pro/data_run/screens/form_submission_list/submission_creation_dialog.widget.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/get_error_widget.dart';
import 'package:mass_pro/data_run/screens/form_submission_list/submission_sync_dialog.widget.dart';
import 'package:mass_pro/generated/l10n.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';

class SubmissionListScreen extends ConsumerStatefulWidget {
  const SubmissionListScreen({super.key});

  // final FormListItemModel? formModel;

  @override
  SubmissionListState createState() => SubmissionListState();
}

class SubmissionListState extends ConsumerState<SubmissionListScreen> {
  SyncStatus? _selectedStatus;
  late final String form;
  late final String activity;
  late final String team;
  late final int latestFormVersion;

  Future<void> _showSyncDialog(List<String> entityUids) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SyncDialog(
          entityUids: entityUids,
          syncEntity: (uids) async {
            if (uids != null) {
              await ref
                  .read(formSubmissionListProvider(form: form).notifier)
                  .syncEntities(uids);
            }
          },
        );
      },
    );
  }

  @override
  void initState() {
    final Bundle eventBundle = Get.arguments as Bundle;
    form = eventBundle.getString(FORM_UID)!;
    activity = eventBundle.getString(ACTIVITY_UID)!;
    team = eventBundle.getString(TEAM_UID)!;
    latestFormVersion = eventBundle.getInt(FORM_VERSION)!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: ValueKey(form),
        appBar: AppBar(
          title: Consumer(
            builder: (context, ref, child) {
              final AsyncValue<FormConfiguration> formConfig =
                  ref.watch(formConfigurationProvider(form: form));
              return switch (formConfig) {
                AsyncValue(:final Object error?, :final stackTrace) =>
                  getErrorWidget(error, stackTrace),
                AsyncValue(:final FormConfiguration valueOrNull?) =>
                  Text(valueOrNull.label),
                _ => const SizedBox.shrink(),
              };
            },
          ),
        ),
        body: Column(
          children: [
            _buildFilterBar(),
            Expanded(child: _buildEntitiesList()),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddEntityDialog(context, ref);
          },
          tooltip: S.current.addNew,
          child: const Icon(Icons.add),
        ));
  }

  Widget _buildFilterBar() {
    final statusCountModelValue =
        ref.watch(submissionStatusModelProvider(form: form));

    return switch (statusCountModelValue) {
      AsyncValue(:final Object error?, :final stackTrace) =>
        getErrorWidget(error, stackTrace),
      AsyncValue(valueOrNull: final model?) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFilterChip(SyncStatus.SYNCED, model.synced),
                _buildFilterChip(SyncStatus.TO_POST, model.toPost),
                _buildFilterChip(SyncStatus.TO_UPDATE, model.toUpdate),
                _buildFilterChip(SyncStatus.ERROR, model.withError),
              ],
            ),
          ),
        ),
      _ => const SizedBox.shrink(),
    };
  }

  Widget _buildFilterChip(SyncStatus status, int count) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ChoiceChip(
        label: Text(' ($count)'),
        showCheckmark: false,
        tooltip: status.name,
        avatar: buildStatusIcon(status),
        selected: _selectedStatus == status,
        onSelected: (bool selected) {
          setState(() {
            _selectedStatus = selected ? status : null;
          });
        },
      ),
    );
  }

  Widget _buildEntitiesList() {
    final entitiesByStatus = ref.watch(submissionFilteredByStateProvider(
        form: form, syncState: _selectedStatus));

    return entitiesByStatus.when(
        data: (filteredEntities) => ListView.builder(
              itemCount: filteredEntities.length,
              itemBuilder: (BuildContext context, int index) {
                final DataFormSubmission entity = filteredEntities[index];

                return Card(
                  shadowColor: Theme.of(context).colorScheme.shadow,
                  surfaceTintColor: Theme.of(context).colorScheme.primary,
                  elevation: .7,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: SubmissionSummary(
                      // key: ValueKey('${entity.uid}_${entity.version}'),
                      form: form,
                      entity: entity,
                      onSyncPressed: (uid) => _showSyncDialog([entity.uid!]),
                      onTap: () =>
                          _goToDataEntryForm(entity.uid!, entity.version)),
                );
              },
            ),
        error: (Object error, StackTrace s) => getErrorWidget(error, s),
        loading: () => const CircularProgressIndicator());
  }

  Future<void> _showAddEntityDialog(BuildContext context, WidgetRef ref) async {
    if (!context.mounted) {
      return;
    }

    final String? result = await showDialog<String?>(
        context: context,
        builder: (BuildContext context) {
          return SubmissionCreationDialog(
            form: form,
            activity: activity,
            team: team,
          );
        });
    // go to form
    if (result != null) {
      await _goToDataEntryForm(result, latestFormVersion);
      // ref.invalidate(submissionListProvider(form: form));
      // ref.invalidate(projectDetailItemModelProvider);
    } else {
      // Handle cancellation or failure
    }
  }

  Future<void> _goToDataEntryForm(String uid, int version) async {
    final Bundle eventBundle = Get.arguments as Bundle;
    Bundle bundle = eventBundle.putString(SYNCABLE_UID, uid);
    bundle = bundle.putInt(FORM_VERSION, version);

    // await Get.to(DataSubmissionScreen(), arguments: bundle);
    await Get.to(
        FormSubmissionScreen(
          currentPageIndex: 1,
        ),
        arguments: bundle);
    // ref.invalidate(submissionListProvider);
  }
}

Widget buildStatusIcon(SyncStatus? status) {
  switch (status) {
    case SyncStatus.SYNCED:
      return const Icon(Icons.cloud_done, color: Colors.green);
    case SyncStatus.TO_POST:
      return const Icon(Icons.cloud_upload, color: Colors.blue);
    case SyncStatus.TO_UPDATE:
      return const Icon(Icons.update, color: Colors.orange);
    case SyncStatus.ERROR:
      return const Icon(Icons.error, color: Colors.red);
    default:
      return const Icon(Icons.all_inclusive);
  }
}
