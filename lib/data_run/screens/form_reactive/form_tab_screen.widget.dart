import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/commons/constants.dart';
import 'package:mass_pro/data_run/screens/form_reactive/form_entry_view.widget.dart';
import 'package:mass_pro/data_run/screens/form_reactive/form_initial_view.widget.dart';
import 'package:mass_pro/data_run/screens/form_submission_screen/hooks/scroll_controller_for_animation.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/bottom_sheet/bottom_sheet.provider.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/bottom_sheet/bottom_sheet.widget.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/bottom_sheet/q_bottom_sheet_dialog_ui_model.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/get_error_widget.dart';
import 'package:mass_pro/data_run/screens/form_submission_list/model/submission_list.provider.dart';
import 'package:mass_pro/data_run/screens/form_submission_screen/model/submission.provider.dart';
import 'package:mass_pro/generated/l10n.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormSubmissionScreen extends StatefulHookConsumerWidget {
  const FormSubmissionScreen({super.key, this.currentPageIndex = 0});

  final int currentPageIndex;

  @override
  FormSubmissionScreenState createState() => FormSubmissionScreenState();
}

class FormSubmissionScreenState extends ConsumerState<FormSubmissionScreen> {
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
          child: FormTabScreen(
            enabled: canEdit,
            currentPageIndex: widget.currentPageIndex,
          ),
        ),
      _ => const SizedBox.shrink(),
    };
  }
}

class FormTabScreen extends StatefulHookConsumerWidget {
  const FormTabScreen(
      {super.key, this.currentPageIndex = 0, this.enabled = true});

  final int currentPageIndex;
  final bool enabled;

  @override
  ConsumerState<FormTabScreen> createState() => _SubmissionTabScreenState();
}

class _SubmissionTabScreenState extends ConsumerState<FormTabScreen> {
  final _initialFormKey = GlobalKey<ReactiveFormBuilderState>();
  final _entryFormKey = GlobalKey<ReactiveFormBuilderState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late int _currentPageIndex;
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

  FormGroup get formGroup => ref
      .read(formInstanceProvider)
      .requireValue
      .form;

  FormGroup get formGroupInit => ref
      .read(formInstanceProvider)
      .requireValue
      .formInit;

  @override
  Widget build(BuildContext context) {
    final hideFabAnimController = useAnimationController(
        duration: kThemeAnimationDuration, initialValue: 1);
    final scrollController =
        useScrollControllerForAnimation(hideFabAnimController);

    final formInstance =
        ref.watch(formInstanceProvider).requireValue;

    final _buildBody = <Widget>[
      ReactiveForm(
          key: _initialFormKey,
          formGroup: formInstance.formInit,
          child: FormInitialView(
              enabled: widget.enabled,
              key: ValueKey('SubmissionInitialView_$submissionId'))),
      ReactiveForm(
        key: _entryFormKey,
        formGroup: formInstance.form,
        child: FormInstanceEntryView(
            scrollController: scrollController, formInstance: formInstance),
      ),
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
        appBar: AppBar(title: Text('NMCP')),
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
              icon: Badge(child: Icon(Icons.data_array)),
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
        floatingActionButton: FadeTransition(
          opacity: hideFabAnimController,
          child: ScaleTransition(
            scale: hideFabAnimController,
            child: FloatingActionButton(
              child: getFloatIcon(),
              // label: const Text('Useless Floating Action Button'),
              onPressed: () {
                if (widget.enabled) {
                  _saveAndShowBottomSheet(context);
                } else {
                  Navigator.pop(context);
                }
                // Navigator.pop(context);
              },
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
    if (widget.enabled && (formGroup.dirty == true || formGroupInit.dirty)) {
      await _saveAndShowBottomSheet(context);
    } else {
      Navigator.pop(context);
    }
  }

  /// Save the form
  Future<void> _onSaveForm() async {
    ref
        .read(formInstanceProvider)
        .requireValue
        .saveFormData();
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
    if (formGroup.valid && formGroupInit.valid) {
      await _markEntityAsFinal();

      if (context.mounted) {
        Navigator.pop(context);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Form contains some errors: ${formGroup.errors}: ${formGroupInit.errors}')),
      );
    }
  }

  Future<void> _markEntityAsFinal() async {
    return ref
        .read(formInstanceProvider)
        .requireValue
        .markSubmissionAsFinal();
  }
}

class _EagerInitialization extends ConsumerWidget {
  _EagerInitialization({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formInstance =
        ref.watch(formInstanceProvider);
    if (formInstance.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (formInstance.hasError) {
      return getErrorWidget(formInstance.error, formInstance.stackTrace);
    }

    return child;
  }
}
