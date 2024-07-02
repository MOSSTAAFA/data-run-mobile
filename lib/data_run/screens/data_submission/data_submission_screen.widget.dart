import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/data_submission/form_input_fields_list.widget.dart';

class DataSubmissionScreen extends StatelessWidget {
  const DataSubmissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EagerInitialization(
      child: DataSubmissionScaffold(),
    );
  }
}

class DataSubmissionScaffold extends ConsumerWidget {
  const DataSubmissionScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('form.name!'),
      ),
      body: FormInputFieldsListWidget(itemsCount: 0),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {},
        child: const Icon(Icons.save),
      ),
    );
  }
}

class EagerInitialization extends ConsumerWidget {
  const EagerInitialization({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final result = ref.watch(syncableEntityMappingRepositoryProvider);

    // Handle error states and loading states
    // if (result.isLoading) {
    //   return const CircularProgressIndicator();
    // } else if (result.hasError) {
    //   return const Text('Oopsy!');
    // }


    return child;
  }
}
