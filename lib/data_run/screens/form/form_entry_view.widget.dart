import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
import 'package:mass_pro/data_run/screens/form/element_widgets/form_widget_factory.dart';
import 'package:mass_pro/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class FormInstanceEntryView extends HookConsumerWidget {
  const FormInstanceEntryView({
    super.key,
    required this.scrollController,
    // required this.formInstance,
  });

  final ScrollController scrollController;

  // final FormInstance formInstance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formInstance = ref
        .watch(
            formInstanceProvider)
        .requireValue;
    return ReactiveForm(
      formGroup: formInstance.form,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: formInstance.elements.values
              .map((element) => FormElementWidgetFactory.createWidget(element))
              .toList(),
        ),
      ),
    );
  }
}
