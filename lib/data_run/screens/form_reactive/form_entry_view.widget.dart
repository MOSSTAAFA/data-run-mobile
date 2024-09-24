import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/data_run/screens/form_reactive/form_widget_factory.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_instance.dart';

class FormInstanceEntryView extends HookConsumerWidget {
  const FormInstanceEntryView({
    super.key,
    required this.scrollController,
    required this.formInstance,
  });

  final ScrollController scrollController;
  final FormInstance formInstance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: formInstance.elements.values
            .map((element) => FormElementWidgetFactory.createWidget(element))
            .toList(),
      ),
    );
  }
}
