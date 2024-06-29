import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormFieldInitializationWidget extends ConsumerWidget {
  const FormFieldInitializationWidget({super.key, required this.child});

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
