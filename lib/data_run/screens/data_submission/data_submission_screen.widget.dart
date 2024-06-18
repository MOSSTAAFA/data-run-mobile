import 'package:d2_remote/modules/datarun/form/entities/dynamic_form.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/repository/activity_data_repository/activity_data_repository.provider.dart';
import 'package:mass_pro/data_run/screens/data_submission/forms_widget_strategy/form_creation_strategy.provider.dart';

class DataSubmissionScreen extends ConsumerWidget {
  DataSubmissionScreen({super.key, required this.form});

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final DynamicForm form;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formStrategy = ref.watch(formCreationStrategyProvider);
    final repository = ref.watch(activityDataRepositoryProvider);

    final formFields = formStrategy.loadFormFields();

    return Scaffold(
      appBar: AppBar(
        title: Text(form.name!),
      ),
      body: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          child: Column(
              children: form.fieldsList!
                  .map<Widget>((field) => FormInputFieldWidget(
                        field: field,
                      ))
                  .toList()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {
          if (_formKey.currentState!.saveAndValidate(focusOnInvalid: false)) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 10),
                content: Text(
                  'Form successfully validated and saved. Form data: ${_formKey.currentState!.value}',
                ),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text('Form validation failed'),
              ),
            );
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}

class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(myProvider);

    // Handle error states and loading states
    if (result.isLoading) {
      return const CircularProgressIndicator();
    } else if (result.hasError) {
      return const Text('Oopsy!');
    }

    return child;
  }
}