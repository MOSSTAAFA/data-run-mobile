import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/constants.dart';
import 'package:mass_pro/commons/custom_widgets/mixins/keyboard_manager.dart';
import 'package:mass_pro/data_run/form/form.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/form_field.widget.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/form_fields_state_notifier.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';
import 'package:mass_pro/data_run/screens/data_submission_screen/model/form_screen_state.model.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/bottom_sheet/bottom_sheet.provider.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/bottom_sheet/bottom_sheet.widget.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/form/q_field_widget_factory.dart';
import 'package:mass_pro/form/ui/intent/form_intent.dart';
import 'package:mass_pro/form/ui/view_model/form_pending_intents.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';
import 'package:mass_pro/utils/mass_utils/colors.dart';

class DataSubmissionScreen extends ConsumerWidget {
  const DataSubmissionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formScreenStateModel = ref.watch(formScreenStateModelProvider);

    return switch (formScreenStateModel) {
      AsyncValue(:final error?) => ErrorWidget(error),
      AsyncValue(:final valueOrNull?) => _EagerInitialization(
          child: DataSubmissionScaffold(
            formScreenStateModel: valueOrNull,
          ),
        ),
      // buildFormBuilder(valueOrNull, context)),
      _ => const SizedBox.shrink(),
    };
  }
}

class DataSubmissionScaffold extends ConsumerStatefulWidget {
  const DataSubmissionScaffold({super.key, required this.formScreenStateModel});

  final FormScreenStateModel formScreenStateModel;

  @override
  ConsumerState<DataSubmissionScaffold> createState() =>
      DataSubmissionScaffoldState();
}

class DataSubmissionScaffoldState extends ConsumerState<DataSubmissionScaffold>
    with WidgetsBindingObserver, KeyboardManager {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isKeyboardVisible = false;
  late final String formCode;
  late final String entityUid;

  @override
  void initState() {
    final Bundle eventBundle = Get.arguments as Bundle;
    formCode = eventBundle.getString(FORM_CODE)!;
    entityUid = eventBundle.getString(SYNCABLE_UID)!;
    super.initState();
  }

  Widget getLoadingWidget() {
    return LinearProgressIndicator(
        valueColor:
            AlwaysStoppedAnimation<Color>(convertHexStringToColor('#FF9800')!),
        semanticsLabel: 'Loading progress indicator',
        minHeight: 8);
  }

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets;
    _isKeyboardVisible = viewInsets.bottom > 0.0;

    final AsyncValue<IMap<String, QFieldModel>> fields =
        ref.watch(formFieldsStateNotifierProvider);

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
        appBar: AppBar(title: Text(formCode)),
        body: switch (fields) {
          AsyncValue(:final error?) => ErrorWidget(error),
          AsyncValue(:final valueOrNull?) => GestureDetector(
              onTap: () => hideTheKeyboard(context),
              child: FormBuilder(
                key: _formKey,
                onChanged: () {
                  _formKey.currentState!.save();
                },
                enabled: widget.formScreenStateModel.canEditForm,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: ListView(
                    children: valueOrNull.entries
                        .map(
                          (entry) => Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: FormFieldWidget(
                                  key: ValueKey<String>(entry.key),
                                  fieldModel: entry.value,
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              )),
          _ => const SizedBox.shrink(),
        },
        floatingActionButton: _isKeyboardVisible
            ? const SizedBox.shrink()
            : FloatingActionButton(
                onPressed: () {
                  if (widget.formScreenStateModel.canEditForm) {
                    _saveAndShowBottomSheet(context);
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: getFloatIcon(),
              ),
      ),
    );
  }

  Widget getFloatIcon() {
    return widget.formScreenStateModel.canEditForm
        ? const Icon(Icons.save)
        : const Icon(Icons.arrow_back);
  }

  void backButtonPressed(BuildContext context) {
    if (_formKey.currentState!.isDirty) {
      _saveAndShowBottomSheet(context);
    } else {
      Navigator.pop(context);
    }
  }

  Future<void> _saveAndShowBottomSheet(BuildContext context) async {
    await _onSaveForm();
    if (context.mounted) {
      return _showBottomSheet(context);
    }
  }

  /// Save the form
  Future<void> _onSaveForm() async {
    _formKey.currentState!.save();
    ref.read(formPendingIntentsProvider.notifier).submitIntent(
        (current) => FormIntent.onFinish(_formKey.currentState?.value));
    debugPrint('Form State: ${_formKey.currentState?.value}');
  }

  Future<void> _showBottomSheet(BuildContext context) async {
    final bottomSheetUiModel =
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
    if (_formKey.currentState!.validate(focusOnInvalid: false)) {
      await _markEntityAsFinal();
      ref.read(formPendingIntentsProvider.notifier).submitIntent(
          (current) => FormIntent.onFinish(_formKey.currentState?.value));
      if (context.mounted) {
        Navigator.pop(context);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Form contains some errors: ${_formKey.currentState!.errors}')),
      );
    }
  }

  Future<int> _markEntityAsFinal() async {
    final SyncableObjectRepository syncableRepository =
        SyncableObjectRepository(entityUid,
            ref.read(databaseSyncableQueryProvider(formCode)).provideQuery());

    return syncableRepository.setStatus(SyncableStatus.COMPLETED);
  }
}

class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadingFieldsRepositoryResult =
        ref.watch(formFieldsRepositoryProvider);

    ref.watch(fieldWidgetFactoryProvider);
    if (loadingFieldsRepositoryResult.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (loadingFieldsRepositoryResult.hasError) {
      return Center(
        child: Text(
          'Error Loading formFields',
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
