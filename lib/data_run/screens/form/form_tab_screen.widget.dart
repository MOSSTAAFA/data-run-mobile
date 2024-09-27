import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/data_run/screens/form/form_entry_view.widget.dart';
import 'package:mass_pro/data_run/screens/form/form_initial_view.widget.dart';
import 'package:mass_pro/data_run/screens/form/form_metadata_inherit_widget.dart';
import 'package:mass_pro/data_run/screens/form/hooks/scroll_controller_for_animation.dart';
import 'package:mass_pro/data_run/screens/form/model/form_instance.provider.dart';
import 'package:mass_pro/data_run/screens/form/model/form_metadata.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/bottom_sheet/bottom_sheet.provider.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/bottom_sheet/bottom_sheet.widget.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/bottom_sheet/q_bottom_sheet_dialog_ui_model.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/get_error_widget.dart';
import 'package:mass_pro/generated/l10n.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormSubmissionScreen extends StatefulHookConsumerWidget {
  const FormSubmissionScreen({super.key, this.currentPageIndex = 0});

  final int currentPageIndex;

  @override
  FormSubmissionScreenState createState() => FormSubmissionScreenState();
}

class FormSubmissionScreenState extends ConsumerState<FormSubmissionScreen> {
  @override
  Widget build(BuildContext context) {
    final AsyncValue<bool> submissionEditStatus = ref.watch(
        submissionEditStatusProvider(
            submission: FormMetadataWidget.of(context).submission!));

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
  final _entryFormKey = GlobalKey<ReactiveFormBuilderState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  FormMetadata metadata(BuildContext context) => FormMetadataWidget.of(context);

  FormGroup formGroup(BuildContext context) => ref
      .read(formInstanceProvider(formMetaData: metadata(context)))
      .requireValue
      .form;

  @override
  Widget build(BuildContext context) {
    final currentPageIndex = useState(widget.currentPageIndex);
    final hideFabAnimController = useAnimationController(
        duration: kThemeAnimationDuration, initialValue: 1);
    final scrollController =
        useScrollControllerForAnimation(hideFabAnimController);

    final formInstance = ref
        .watch(
            formInstanceProvider(formMetaData: FormMetadataWidget.of(context)))
        .requireValue;

    final _buildBody = <Widget>[
      const FormInitialView(),
      FormInstanceEntryView(scrollController: scrollController),
    ];

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('NMCP')),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) => currentPageIndex.value = index,
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex.value,
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
      body: ReactiveForm(
        canPop: (FormGroup formGroup) => false,
        onPopInvoked: (
            FormGroup formGroup, bool didPop) async {
          if (didPop) {
            return;
          }
          backButtonPressed(formGroup);
        },
        key: _entryFormKey,
        formGroup: formInstance.form,
        child: Stack(
          children: [
            IndexedStack(
              index: currentPageIndex.value,
              children: _buildBody,
            ),
          ],
        ),
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
                _saveAndShowBottomSheet(formGroup(context));
              } else {
                Navigator.pop(context);
              }
              // Navigator.pop(context);
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getFloatIcon() {
    return widget.enabled
        ? const Icon(Icons.save)
        : const Icon(Icons.arrow_back);
  }

  Future<void> _saveAndShowBottomSheet(FormGroup form) async {
    await _onSaveForm();
    if (context.mounted) {
      return _showBottomSheet(form);
    }
  }

  Future<void> backButtonPressed(FormGroup form) async {
    if (form.dirty) {
      await _saveAndShowBottomSheet(form);
    } else {
      Navigator.pop(context);
    }
  }

  /// Save the form
  Future<void> _onSaveForm() async {
    ref
        .read(
            formInstanceProvider(formMetaData: FormMetadataWidget.of(context)))
        .requireValue
        .saveFormData();
  }

  Future<void> _showBottomSheet(FormGroup form) async {
    final QBottomSheetDialogUiModel bottomSheetUiModel =
        ref.watch(bottomSheetProvider).formFinishBottomSheet();
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return QBottomSheetDialog(
          uiModel: bottomSheetUiModel,
          onMainClicked: () => _onFinalDataClicked(form),
          onSecondaryClicked: () => Navigator.pop(context),
        );
      },
    );
  }

  Future<void> _onFinalDataClicked(FormGroup form) async {
    if (form.valid) {
      await _markEntityAsFinal(context);

      if (context.mounted) {
        Navigator.pop(context);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Form contains some errors: ${formGroup(context).errors}')),
      );
    }
  }

  Future<void> _markEntityAsFinal(BuildContext context) async {
    return ref
        .read(formInstanceProvider(formMetaData: metadata(context)))
        .requireValue
        .markSubmissionAsFinal();
  }
}

class _EagerInitialization extends ConsumerWidget {
  _EagerInitialization({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formInstance = ref.watch(
        formInstanceProvider(formMetaData: FormMetadataWidget.of(context)));
    if (formInstance.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (formInstance.hasError) {
      return getErrorWidget(formInstance.error, formInstance.stackTrace);
    }

    return child;
  }
}
