import 'package:d2_remote/d2_remote.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:d2_remote/core/datarun/utilities/date_utils.dart' as sdk;
import 'package:mass_pro/commons/constants.dart';
import 'package:mass_pro/data_run/form/form_configuration.dart';
import 'package:mass_pro/data_run/form/form_fields_repository.dart';
import 'package:mass_pro/data_run/form/submission_status.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/bottom_sheet/bottom_sheet.provider.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/bottom_sheet/bottom_sheet.widget.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/bottom_sheet/q_bottom_sheet_dialog_ui_model.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/form/q_field_widget_factory.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/get_error_widget.dart';
import 'package:mass_pro/data_run/screens/submission_form/model/form_fields_state_notifier.dart';
import 'package:mass_pro/data_run/screens/submission_screen/model/submission_screen.provider.dart';
import 'package:mass_pro/data_run/screens/submission_screen/submission_entry_view.widget.dart';
import 'package:mass_pro/data_run/screens/submission_screen/submission_initial_view.widget.dart';
import 'package:mass_pro/form/ui/intent/form_intent.dart';
import 'package:mass_pro/form/ui/view_model/form_pending_intents.dart';
import 'package:mass_pro/generated/l10n.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';

class DataSubmissionScreen extends ConsumerStatefulWidget {
  const DataSubmissionScreen({super.key, this.currentPageIndex = 0});

  final int currentPageIndex;

  @override
  DataSubmissionScreenState createState() => DataSubmissionScreenState();
}

class DataSubmissionScreenState extends ConsumerState<DataSubmissionScreen> {
  late final String form;
  late final String submissionId;

  @override
  void initState() {
    final Bundle eventBundle = Get.arguments as Bundle;
    form = eventBundle.getString(FORM_UID)!;
    submissionId = eventBundle.getString(SYNCABLE_UID)!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<bool> submissionEditStatus =
        ref.watch(submissionEditStatusProvider);

    return switch (submissionEditStatus) {
      AsyncValue(:final Object error?, :final stackTrace) =>
        getErrorWidget(error, stackTrace),
      AsyncValue(valueOrNull: final editStatus?) => _EagerInitialization(
          form: form,
          submissionId: submissionId,
          child: SubmissionTabScreen(
            editStatus: editStatus,
            currentPageIndex: widget.currentPageIndex,
          ),
        ),
      _ => const SizedBox.shrink(),
    };
  }
}

class SubmissionTabScreen extends ConsumerStatefulWidget {
  const SubmissionTabScreen(
      {super.key, this.currentPageIndex = 0, this.editStatus = true});

  final int currentPageIndex;
  final bool editStatus;

  @override
  ConsumerState<SubmissionTabScreen> createState() =>
      _SubmissionTabScreenState();
}

class _SubmissionTabScreenState extends ConsumerState<SubmissionTabScreen> {
  final _initialFormKey = GlobalKey<FormBuilderState>();
  final _entryFormKey = GlobalKey<FormBuilderState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late int _currentPageIndex;
  bool _isKeyboardVisible = false;
  late final String form;
  late final int formVersion;
  late final String submissionId;

  @override
  void initState() {
    super.initState();
    final Bundle eventBundle = Get.arguments as Bundle;
    form = eventBundle.getString(FORM_UID)!;
    formVersion = eventBundle.getInt(FORM_VERSION)!;
    submissionId = eventBundle.getString(SYNCABLE_UID)!;
    _currentPageIndex = widget.currentPageIndex;
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets viewInsets = MediaQuery.of(context).viewInsets;
    _isKeyboardVisible = viewInsets.bottom > 0.0;

    final formConfigValue = ref
        .watch(formConfigurationProvider(form: form, formVersion: formVersion));

    final ThemeData theme = Theme.of(context);

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        backButtonPressed(context);
      },
      child: switch (formConfigValue) {
        AsyncValue(:final Object error?, :final stackTrace) =>
          getErrorWidget(error, stackTrace),
        AsyncValue(valueOrNull: final formConfig?) => Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(title: Text(formConfig.label)),
            bottomNavigationBar: NavigationBar(
              onDestinationSelected: (int index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              indicatorColor: Colors.amber,
              selectedIndex: _currentPageIndex,
              destinations: <Widget>[
                NavigationDestination(
                  selectedIcon: Icon(Icons.home),
                  icon: Icon(Icons.home_outlined),
                  label: S.of(context).submissionInitialData,
                ),
                NavigationDestination(
                  icon: Badge(child: Icon(Icons.notifications_sharp)),
                  label: S.of(context).submissionDataEntry,
                ),
                NavigationDestination(
                  icon: Badge(
                    label: Text('2'),
                    child: Icon(Icons.messenger_sharp),
                  ),
                  label: S.of(context).notifications,
                ),
              ],
            ),
            body: <Widget>[
              /// Home page
              FormBuilder(
                key: _initialFormKey,
                onChanged: () {
                  _initialFormKey.currentState!.save();
                  debugPrint('${_initialFormKey.currentState!.value}');
                  _initialFormKey.currentState!.save();
                },
                enabled: widget.editStatus,
                child: Card(
                  shadowColor: Colors.transparent,
                  margin: const EdgeInsets.all(8.0),
                  child: SizedBox.expand(
                    child: Center(
                      child: Consumer(
                        builder: (context, ref, child) {
                          final submissionValue = ref.watch(
                              submissionProvider(submissionId: submissionId));
                          return switch (submissionValue) {
                            AsyncValue(
                              :final Object error?,
                              :final stackTrace
                            ) =>
                              getErrorWidget(error, stackTrace),
                            AsyncValue(valueOrNull: final submission?) =>
                              SubmissionInitialView(
                                initialOrgUnit: submission.orgUnit,
                                submissionId: submission.uid!,
                                selectableUids:
                                    formConfig.orgUnitTreeUids.unlock,
                              ),
                            _ => const SizedBox.shrink(),
                          };
                        },
                      ),
                    ),
                  ),
                ),
              ),

              /// Data EntryPage page
              FormBuilder(
                key: _entryFormKey,
                onChanged: () {
                  _entryFormKey.currentState!.save();
                  debugPrint('${_entryFormKey.currentState!.value}');
                  _entryFormKey.currentState!.save();
                },
                enabled: widget.editStatus,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SubmissionEntryView(
                    key: ValueKey('Data_entry_$submissionId'),
                  ),
                ),
              ),

              /// Messages page
              ListView.builder(
                reverse: true,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          'Hello',
                          style: theme.textTheme.bodyLarge!
                              .copyWith(color: theme.colorScheme.onPrimary),
                        ),
                      ),
                    );
                  }
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        'Hi!',
                        style: theme.textTheme.bodyLarge!
                            .copyWith(color: theme.colorScheme.onPrimary),
                      ),
                    ),
                  );
                },
              ),
            ][_currentPageIndex],
            floatingActionButton: _isKeyboardVisible
                ? const SizedBox.shrink()
                : FloatingActionButton(
                    onPressed: () {
                      if (widget.editStatus) {
                        _saveAndShowBottomSheet(context);
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: getFloatIcon(),
                  ),
          ),
        _ => const SizedBox.shrink(),
      },
    );
  }

  Widget getFloatIcon() {
    return widget.editStatus
        ? const Icon(Icons.save)
        : const Icon(Icons.arrow_back);
  }

  Future<void> _saveAndShowBottomSheet(BuildContext context) async {
    await _onSaveForm();
    if (context.mounted) {
      return _showBottomSheet(context);
    }
  }

  void backButtonPressed(BuildContext context) {
    if (_initialFormKey.currentState?.isDirty == true ||
        _entryFormKey.currentState?.isDirty == true) {
      _saveAndShowBottomSheet(context);
    } else {
      Navigator.pop(context);
    }
  }

  /// Save the form
  Future<void> _onSaveForm() async {
    // _initialFormKey.currentState!.save();
    _entryFormKey.currentState?.save();
    ref.read(formPendingIntentsProvider.notifier).submitIntent(
        (FormIntent current) =>
            FormIntent.onFinish(_entryFormKey.currentState?.value));
    debugPrint('Form State: ${_entryFormKey.currentState?.value}');
  }

  Future<void> _showBottomSheet(BuildContext context) async {
    final QBottomSheetDialogUiModel bottomSheetUiModel =
        ref.watch(bottomSheetProvider).formFinishBottomSheet();
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return QBottomSheetDialog(
          uiModel: bottomSheetUiModel,
          onMainClicked: () => _onFinalDataClicked(context),
          onSecondaryClicked: () => Navigator.pop(context),
        );
      },
    );
  }

  Future<void> _onFinalDataClicked(BuildContext context) async {
    if (/*_initialFormKey.currentState!.validate(focusOnInvalid: false) &&*/
        _entryFormKey.currentState?.validate(focusOnInvalid: false) == true) {
      await _markEntityAsFinal();
      ref.read(formPendingIntentsProvider.notifier).submitIntent(
          (FormIntent current) =>
              FormIntent.onFinish(_entryFormKey.currentState?.value));
      if (context.mounted) {
        Navigator.pop(context);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Form contains some errors: ${_entryFormKey.currentState?.errors}')),
      );
    }
  }

  Future<int> _markEntityAsFinal() async {
    final String? completedDate =
        sdk.DateUtils.databaseDateFormat().format(DateTime.now().toUtc());
    final submission =
        (await D2Remote.formModule.formSubmission.byId(submissionId).getOne())
          ?..status = SubmissionStatus.COMPLETED.name
          ..finishedEntryTime = completedDate;

    return D2Remote.formModule.formSubmission.setData(submission).save();
  }
}

class _EagerInitialization extends ConsumerWidget {
  _EagerInitialization(
      {super.key,
      required this.form,
      required this.child,
      required this.submissionId});

  final String form;
  final Widget child;
  final String submissionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadingFieldsRepositoryResult =
        ref.watch(formFieldsRepositoryProvider);
    final formFieldsStateNotifier = ref.watch(formFieldsStateNotifierProvider);

    final submission =
        ref.watch(submissionProvider(submissionId: submissionId));

    ref.watch(fieldWidgetFactoryProvider);
    if (loadingFieldsRepositoryResult.isLoading ||
        formFieldsStateNotifier.isLoading ||
        submission.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (loadingFieldsRepositoryResult.hasError) {
      return Center(
        child: Text(
          'Error Loading FormConfiguration',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.red),
        ),
      );
    }

    return child;
  }
}
