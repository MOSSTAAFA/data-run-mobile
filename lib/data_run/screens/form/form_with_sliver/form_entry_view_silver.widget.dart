import 'package:datarun/data_run/screens/form/element/form_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:datarun/data_run/screens/form/element_widgets/form_widget_factory.dart';
import 'package:datarun/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:datarun/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FormInstanceEntryViewSliver extends HookConsumerWidget {
  const FormInstanceEntryViewSliver({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formInstance = ref
        .watch(
            formInstanceProvider(formMetadata: FormMetadataWidget.of(context)))
        .requireValue;

    return CustomScrollView(
      controller: scrollController,
      slivers: formInstance.elements.values.map((element) {
        return SliverStickyHeader(
          header: SectionHeader(element: element, key: ValueKey('${element.pathRecursive}_header'),),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => FormElementWidgetFactory.createWidget(element),
              childCount: 1,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class SectionHeader extends HookConsumerWidget {
  const SectionHeader({super.key, required this.element});

  final FormElementInstance<dynamic> element;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final elementPropertiesSnapshot = useStream(element.propertiesChanged);
    if (!elementPropertiesSnapshot.hasData) {
      return const CircularProgressIndicator();
    }

    if(element is FieldInstance) {
      return SizedBox.shrink();
    }

    return Container(
      height: 40.0,
      color: elementPropertiesSnapshot.data!.errors.isNotEmpty
          ? Colors.deepOrange
          : Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.centerRight,
      child: Text(
        element.label,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
