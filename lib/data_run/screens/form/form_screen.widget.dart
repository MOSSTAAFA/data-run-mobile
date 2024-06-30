import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mass_pro/commons/extensions/standard_extensions.dart';
import 'package:mass_pro/data_run/form/form_fields_repository.dart';
import 'package:mass_pro/data_run/screens/data_submission/data_submission_screen.widget.dart';
import 'package:mass_pro/data_run/screens/form/form_field.widget.dart';
import 'package:mass_pro/data_run/screens/form/form_input_field.model.dart';
import 'package:mass_pro/data_run/screens/form/form_state/focus_manager.dart';
import 'package:mass_pro/data_run/screens/form/form_state/form_state_notifier.dart';
import 'package:mass_pro/form/model/key_board_action_type.dart';
import 'package:mass_pro/form/ui/intent/form_intent.dart';
import 'package:mass_pro/form/ui/view_model/form_pending_intents.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';
import 'package:mass_pro/commons/date/date_utils.dart' as sdk;
import 'package:mass_pro/sdk/core/common/value_type_rendering_type.dart';

class FormScreen extends ConsumerWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fieldsRepository = ref.watch(formFieldsRepositoryProvider);
    return const EagerInitialization(
      child: FormScreenScaffold(),
    );
  }
}

class FormScreenScaffold extends ConsumerStatefulWidget {
  const FormScreenScaffold({super.key});

  @override
  ConsumerState<FormScreenScaffold> createState() => FormScreenScaffoldState();
}

class FormScreenScaffoldState extends ConsumerState<FormScreenScaffold> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  @override
  void dispose() {
    // ref.read(focusManagerProvider).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fields = ref.watch(formStateNotifierProvider);
    final focusManager = ref.watch(focusManagerProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Activity Form')),
      body: fields.maybeWhen(
        data: (IList<FormFieldModel> formState) {
          return Stack(children: [
            FormBuilder(
              onPopInvoked: (bool value) {
                /// show confirm, save, complete
              },
              key: _formKey,
              onChanged: () {
                _formKey.currentState!.save();
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                    itemCount: formState.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: FormFieldWidget(
                          fieldIndex: index,
                        ),
                      );
                    }),
              ),
            ),
            if (fields.isLoading)
              const Positioned(
                top: 0,
                right: 0,
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
          ]);
        },
        error: (Object e, _) => Center(
          child: Text(
            e.toString(),
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.red),
          ),
        ),
        orElse: () {},
      ),
    );
  }
}