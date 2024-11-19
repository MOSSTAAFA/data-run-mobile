import 'package:datarun/data_run/screens/form/element/form_element.dart';
import 'package:datarun/data_run/screens/form/element_widgets/form_widget_factory.dart';
import 'package:datarun/data_run/screens/form/hooks/register_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SectionWidget extends HookConsumerWidget {
  const SectionWidget({Key? key, required this.element}) : super(key: key);

  final SectionInstance element;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useRegisterDependencies(element);

    final elementPropertiesSnapshot = useStream(element.propertiesChanged);

    if (!elementPropertiesSnapshot.hasData) {
      return const SliverToBoxAdapter(child: CircularProgressIndicator());
    }

    if (elementPropertiesSnapshot.data!.hidden) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(element.label, style: Theme.of(context).textTheme.titleMedium),
        ...element.elements.values.map((childElement) =>
            FormElementWidgetFactory.createWidget(childElement)),
      ],
    );
  }
}
