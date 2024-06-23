import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataSubmissionScreen extends StatelessWidget {
  DataSubmissionScreen({super.key});

  // final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  // final DynamicForm form;

  @override
  Widget build(BuildContext context) {
    return EagerInitialization(
      child: DataSubmissionScaffold(),
    );
  }
}

class DataSubmissionScaffold extends ConsumerWidget {
  DataSubmissionScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Placeholder();
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(form.name!),
    //   ),
    //   body: SingleChildScrollView(
    //     child: FormBuilder(
    //       key: _formKey,
    //       child: Column(
    //           children: form.fieldsList!
    //               .map<Widget>((field) => FormInputFieldWidget(
    //                     field: field,
    //                   ))
    //               .toList()),
    //     ),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     mini: true,
    //     onPressed: () {
    //       if (_formKey.currentState!.saveAndValidate(focusOnInvalid: false)) {
    //         ScaffoldMessenger.of(context).showSnackBar(
    //           SnackBar(
    //             backgroundColor: Colors.green,
    //             duration: const Duration(seconds: 10),
    //             content: Text(
    //               'Form successfully validated and saved. Form data: ${_formKey.currentState!.value}',
    //             ),
    //           ),
    //         );
    //       } else {
    //         ScaffoldMessenger.of(context).showSnackBar(
    //           const SnackBar(
    //             backgroundColor: Colors.redAccent,
    //             content: Text('Form validation failed'),
    //           ),
    //         );
    //       }
    //     },
    //     child: const Icon(Icons.save),
    //   ),
    // );
  }
}

class EagerInitialization extends ConsumerWidget {
  const EagerInitialization({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final result = ref.watch(syncableDataEntryRepositoryProvider);

    // Handle error states and loading states
    // if (result.isLoading) {
    //   return const CircularProgressIndicator();
    // } else if (result.hasError) {
    //   return const Text('Oopsy!');
    // }

    return child;
  }
}
