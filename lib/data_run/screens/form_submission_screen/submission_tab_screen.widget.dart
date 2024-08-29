import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/constants.dart';
import 'package:mass_pro/data_run/form/form_configuration.dart';
import 'package:mass_pro/data_run/form/form_fields_repository.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/bottom_sheet/bottom_sheet.provider.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/bottom_sheet/bottom_sheet.widget.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/bottom_sheet/q_bottom_sheet_dialog_ui_model.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/fields/q_field_widget_factory.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/get_error_widget.dart';
import 'package:mass_pro/data_run/screens/form_submission_list/model/submission_list.provider.dart';
import 'package:mass_pro/data_run/screens/form_submission_screen/model/submission.provider.dart';
import 'package:mass_pro/data_run/screens/form_submission_screen/submission_entry_view.widget.dart';
import 'package:mass_pro/data_run/screens/form_submission_screen/submission_initial_view.widget.dart';
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
  late final int formVersion;

  @override
  void initState() {
    final Bundle eventBundle = Get.arguments as Bundle;
    form = eventBundle.getString(FORM_UID)!;
    formVersion = eventBundle.getInt(FORM_VERSION)!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<bool> submissionEditStatus =
        ref.watch(submissionEditStatusProvider);

    return switch (submissionEditStatus) {
      AsyncValue(:final Object error?, :final stackTrace) =>
        getErrorWidget(error, stackTrace),
      AsyncValue(valueOrNull: final canEdit?) => _EagerInitialization(
          form: form,
          formVersion: formVersion,
          child: SubmissionTabScreen(
            enabled: canEdit,
            currentPageIndex: widget.currentPageIndex,
          ),
        ),
      _ => const SizedBox.shrink(),
    };
  }
}

class SubmissionTabScreen extends ConsumerStatefulWidget {
  const SubmissionTabScreen(
      {super.key, this.currentPageIndex = 0, this.enabled = true});

  final int currentPageIndex;
  final bool enabled;

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

    final formConfig = ref
        .watch(formConfigurationProvider(form: form, formVersion: formVersion))
        .requireValue;

    final ThemeData theme = Theme.of(context);

    final _buildBody = <Widget>[
      FormBuilder(
          key: _initialFormKey,
          enabled: widget.enabled,
          child: SubmissionInitialView(
              enabled: widget.enabled,
              key: ValueKey('SubmissionInitialView_$submissionId'),
              selectableUids: formConfig.orgUnitTreeUids.unlock)),
      FormBuilder(
          key: _entryFormKey,
          enabled: widget.enabled,
          child: SubmissionEntryView(
              key: ValueKey('SubmissionEntryView_$submissionId')))
    ];

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        backButtonPressed(context);
      },
      child: Scaffold(
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
            )
          ],
        ),
        body: Stack(
          children: [
            IndexedStack(
              index: _currentPageIndex,
              children: _buildBody,
            ),
          ],
        ),
        floatingActionButton: _isKeyboardVisible
            ? const SizedBox.shrink()
            : FloatingActionButton(
                onPressed: () {
                  if (widget.enabled) {
                    _saveAndShowBottomSheet(context);
                  } else {
                    Navigator.pop(context);
                  }
                  // Navigator.pop(context);
                },
                child: getFloatIcon(),
              ),
      ),
    );
  }

  Widget getFloatIcon() {
    return widget.enabled
        ? const Icon(Icons.save)
        : const Icon(Icons.arrow_back);
  }

  Future<void> _saveAndShowBottomSheet(BuildContext context) async {
    await _onSaveForm();
    if (context.mounted) {
      return _showBottomSheet(context);
    }
  }

  Future<void> backButtonPressed(BuildContext context) async {
    if (widget.enabled && (_initialFormKey.currentState?.isDirty == true ||
        _entryFormKey.currentState?.isDirty == true)) {
      await _saveAndShowBottomSheet(context);
    } else {
      Navigator.pop(context);
    }
  }

  /// Save the form
  Future<void> _onSaveForm() async {
    _initialFormKey.currentState?.save();
    _entryFormKey.currentState?.save();
    ref.read(formPendingIntentsProvider.notifier).submitIntent(
        (FormIntent current) =>
            FormIntent.onFinish(_entryFormKey.currentState?.value));
  }

  Future<void> _showBottomSheet(BuildContext context) async {
    final QBottomSheetDialogUiModel bottomSheetUiModel =
        ref.watch(bottomSheetProvider).formFinishBottomSheet();
    await showModalBottomSheet(
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
    if (_initialFormKey.currentState?.validate(focusOnInvalid: false) == true &&
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

  Future<void> _markEntityAsFinal() async {
    return ref
        .read(submissionListProvider(form: form).notifier)
        .markSubmissionAsFinal(submissionId);
  }
}

class _EagerInitialization extends ConsumerWidget {
  _EagerInitialization(
      {required this.form, required this.formVersion, required this.child});

  final String form;
  final int formVersion;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formConfigValue = ref
        .watch(formConfigurationProvider(form: form, formVersion: formVersion));

    final formFieldRepository = ref.watch(formFieldsRepositoryProvider);
    // final formFieldsStateNotifier = ref.watch(formFieldsStateNotifierProvider);

    ref.watch(fieldWidgetFactoryProvider);
    if (formFieldRepository.isLoading ||
        // formFieldsStateNotifier.isLoading ||
        formConfigValue.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (formFieldRepository.hasError ||
        // formFieldsStateNotifier.hasError ||
        formConfigValue.hasError) {
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
