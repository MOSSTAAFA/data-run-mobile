import 'package:fast_immutable_collections/src/imap/imap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/commons/custom_widgets/async_value.widget.dart';
import 'package:mass_pro/data_run/form/form_fields_repository.dart';
import 'package:mass_pro/data_run/screens/form/bottom_sheet.widget.dart';
import 'package:mass_pro/data_run/screens/form/fields_widgets/q_field.model.dart';
import 'package:mass_pro/data_run/screens/form/form_field.widget.dart';
import 'package:mass_pro/data_run/screens/form/form_state/form_fields_state_notifier.dart';
import 'package:mass_pro/data_run/screens/form/show_dialog.dart';
import 'package:mass_pro/form/ui/intent/form_intent.dart';
import 'package:mass_pro/form/ui/view_model/form_pending_intents.dart';

class FormScreen extends ConsumerWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const _EagerInitialization(
      child: FormScreenScaffold(),
    );
  }
}

class FormScreenScaffold extends ConsumerStatefulWidget {
  const FormScreenScaffold({super.key});

  @override
  ConsumerState<FormScreenScaffold> createState() => FormScreenScaffoldState();
}

class FormScreenScaffoldState extends ConsumerState<FormScreenScaffold>
    with WidgetsBindingObserver {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isKeyboardVisible = false;

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
        await popInvoked(context);
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(title: const Text('Activity Form')),
        body: AsyncValueWidget<IMap<String, QFieldModel>>(
          value: fields,
          data: (data) => FormBuilder(
            key: _formKey,
            onChanged: () {
              _formKey.currentState!.save();
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: data.keys
                    .map(
                      (key) => FormFieldWidget(fieldKey: key),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
        floatingActionButton: _isKeyboardVisible
            ? const SizedBox.shrink()
            : FloatingActionButton(
          onPressed: () => _showBottomSheet(context),
          child: const Icon(Icons.save),
        ),
      ),
    );
  }

  Future<void> popInvoked(BuildContext context) async {
    final bool saveAndPop = await showConfirmationDialog(
        context: context,
        title: 'Unsaved Changes',
        content: 'Do you want to save changes before leaving?',
        confirmButtonText: 'Save',
        cancelButtonText: 'Discard',
        // save
        onConfirm: () {
          // call save
          onSaveForm();
        });
    if (context.mounted) {
      // then pop
      Navigator.pop(context);
    }
  }

  Future<void> _showBottomSheet(BuildContext context) async {
    final bottomSheetUiModel = ref.watch(bottomSheetUiModelProvider);
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return QBottomSheetDialog(
          uiModel: bottomSheetUiModel,
          // complete
          // exit
          onMainClicked: () => onFinalDataClicked(),
          // Not now
          // exit Form
          onSecondaryClicked: () => Navigator.pop(context),
        );
      },
    );
  }

  Future<void> onFinalDataClicked() async {
    if (_formKey.currentState!.saveAndValidate()) {
      print(_formKey.currentState!.value);
      if (context.mounted) {
        // then pop
        Navigator.pop(context);
      }
    } else {
      print("Validation failed");
    }
  }

  /// Save the form
  Future<void> onSaveForm() async {
    _formKey.currentState!.save();
    ref
        .read(formPendingIntentsProvider.notifier)
        .submitIntent((_) => const FormIntent.onFinish());
    debugPrint('Form State: ${_formKey.currentState?.value}');
  }
}

class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fieldsRepository = ref.watch(formFieldsRepositoryProvider);
    // final AsyncValue<IMap<String, QFieldModel>> result =
    //     ref.watch(formFieldsStateNotifierProvider);

    // if (result.isLoading) {
    //   return const CircularProgressIndicator();
    // } else if (result.hasError) {
    //   return const Text('Oopsy!');
    // }

    return child;
  }
}
