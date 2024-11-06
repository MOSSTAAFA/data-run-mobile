import 'package:datarun/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:datarun/data_run/screens/form/element_widgets/form_widget_factory.dart';
import 'package:datarun/data_run/screens/form/form_with_sliver/repeat_table_view.dart';
import 'package:datarun/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:datarun/data_run/screens/form/hooks/register_dependencies.dart';
import 'package:datarun/data_run/screens/form/element/form_element.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SectionElementSliver extends HookConsumerWidget {
  const SectionElementSliver({super.key, required this.element});

  final SectionElement<dynamic> element;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useRegisterDependencies(element);

    final elementPropertiesSnapshot = useStream(element.propertiesChanged);

    if (!elementPropertiesSnapshot.hasData) {
      return const CircularProgressIndicator();
    }

    return switch (element) {
      final SectionInstance element => Builder(builder: (context) {
        final formInstance = ref
            .watch(formInstanceProvider(
            formMetadata: FormMetadataWidget.of(context)))
            .requireValue;
          if (elementPropertiesSnapshot.data!.hidden) {
            return const SizedBox.shrink();
          } else {
            return ReactiveForm(
              formGroup:
                  formInstance.form.control(element.pathRecursive) as FormGroup,
              child: Column(
                children: element.elements.values.map((childElement) {
                  return FormElementWidgetFactory.createWidget(childElement);
                }).toList(),
              ),
            );
          }
        }),
      final RepeatInstance element => Builder(builder: (context) {
          if (elementPropertiesSnapshot.data!.hidden) {
            return const SizedBox.shrink();
          } else {
            return RepeatInstanceDataTable(
              key: ValueKey('${element.elementPath}_RepeatSectionWidget'),
              repeatInstance: element,
            );
          }
        }),
    };
  }
}
