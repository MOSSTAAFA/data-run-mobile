import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/constants.dart';
import 'package:mass_pro/commons/custom_widgets/mixins/keyboard_manager.dart';
import 'package:mass_pro/data_run/form/form_fields_repository.dart';
import 'package:mass_pro/data_run/screens/form/bottom_sheet.widget.dart';
import 'package:mass_pro/data_run/screens/form/form_field.widget.dart';
import 'package:mass_pro/data_run/screens/form/form_state/form_fields_state_notifier.dart';
import 'package:mass_pro/data_run/screens/form/form_state/q_field.model.dart';
import 'package:mass_pro/data_run/screens/form/form_state/q_field_widget_factory.dart';
import 'package:mass_pro/data_run/screens/form/show_dialog.dart';
import 'package:mass_pro/form/ui/intent/form_intent.dart';
import 'package:mass_pro/form/ui/view_model/form_pending_intents.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';
import 'package:mass_pro/utils/mass_utils/colors.dart';

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
    with WidgetsBindingObserver, KeyboardManager {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isKeyboardVisible = false;
  late final String formCode;

  @override
  void initState() {
    final Bundle eventBundle = Get.arguments as Bundle;
    formCode = eventBundle.getString(FORM_CODE)!;
    super.initState();
  }

  Widget getLoadingWidget() {
    return LinearProgressIndicator(
      valueColor:
          AlwaysStoppedAnimation<Color>(convertHexStringToColor('#FF9800')!),
      semanticsLabel: 'Loading progress indicator',
      minHeight: 8,
    );
  }

  // void _handleKeyBoardOnFocusChange(IList<FieldUiModel> items) {
  //   items.firstOrNullWhere((FieldUiModel it) => it.focused)?.let(
  //           (FieldUiModel fieldUiModel) =>
  //           fieldUiModel.valueType?.let((ValueType valueType) {
  //             if (!valueTypeIsTextField(valueType)) {
  //               hideTheKeyboard(context);
  //             }
  //           }));
  // }

  // bool valueTypeIsTextField(ValueType valueType, [UiRenderType? renderType]) {
  //   return valueType.isNumeric ||
  //       valueType.isText && renderType?.isPolygon != true ||
  //       valueType == ValueType.URL ||
  //       valueType == ValueType.Email ||
  //       valueType == ValueType.PhoneNumber;
  // }

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
        await _saveAndShowBottomSheet(context);
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(title: Text(formCode)),
        body: switch (fields) {
          AsyncValue(:final error?) => ErrorWidget(error),
          AsyncValue(:final valueOrNull?) => FormBuilder(
              key: _formKey,
              onChanged: () {
                _formKey.currentState!.save();
              },
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: ListView(
                  children: valueOrNull.entries
                      .map(
                        (entry) => GestureDetector(
                          onTap: () => hideTheKeyboard(context),
                          child: Column(
                            children: [
                              if (fields.isLoading) getLoadingWidget(),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: FormFieldWidget(
                                  key: ValueKey<String>(entry.key),
                                  fieldModel: entry.value,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          _ => const SizedBox.shrink(),
        },
        floatingActionButton: _isKeyboardVisible
            ? const SizedBox.shrink()
            : FloatingActionButton(
                onPressed: () => _saveAndShowBottomSheet(context),
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
          _onSaveForm();
        });
    if (context.mounted) {
      // then pop
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
        (_) => FormIntent.onFinish(_formKey.currentState?.value));
    debugPrint('Form State: ${_formKey.currentState?.value}');
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
          onMainClicked: () => _onFinalDataClicked(context),
          // Not now
          // exit Form
          onSecondaryClicked: () => Navigator.pop(context),
        );
      },
    );
  }

  Future<void> _onFinalDataClicked(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      // markFormAsComplete;
      ref
          .read(formPendingIntentsProvider.notifier)
          .submitIntent((_) => FormIntent.onFinish(_formKey.currentState?.value));
      if (context.mounted) {
        Navigator.pop(context);
      }
    } else {
      showToast('Form contains some errors', alignment: Alignment.center);
    }
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

    // Handle error states and loading states
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
