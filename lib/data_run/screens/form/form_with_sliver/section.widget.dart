import 'package:datarun/data_run/screens/form/element/form_element.dart';
import 'package:datarun/data_run/screens/form/element_widgets/field.widget.dart';
import 'package:datarun/data_run/screens/form/element_widgets/form_widget_factory.dart';
import 'package:datarun/data_run/screens/form/form_with_sliver/repeat_table_view.dart';
import 'package:datarun/data_run/screens/form/hooks/register_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SectionWidget extends HookConsumerWidget {
  SectionWidget({
    super.key,
    required this.element,
    // required this.parentIndex,
    // required this.label,
    Color? headerColor,
  }) : this.headerColor = headerColor ?? Colors.blue.shade700;

  final SectionInstance element;
  final Color headerColor;
  // final int parentIndex;
  // final String label;

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

    return SliverStickyHeader(
        header: Container(
          color: headerColor,
          padding: EdgeInsets.all(8),
          child: Text(element.label, style: TextStyle(color: Colors.white)),
        ),
        sliver: MultiSliver(
          children: buildSliverList(element.elements.values),
        ));
  }

  List<Widget> buildSliverList(
      Iterable<FormElementInstance<dynamic>> elements) {
    return elements.map((element) {
      if (element is SectionInstance) {
        return SectionWidget(
          key: Key(element.pathRecursive),
          element: element,
          headerColor: Colors.blue,
          // parentIndex: 2,
          // label: '$parentIndex.${parentIndex + 1}. ${element.label}',
        );
      } else if (element is RepeatInstance) {
        return SliverStickyHeader(
          header: Container(
            color: Colors.blue,
            padding: EdgeInsets.all(8),
            child: Text(element.label, style: TextStyle(color: Colors.white)),
          ),
          sliver: SliverToBoxAdapter(
            child: RepeatInstanceDataTable(
              key: Key(element.pathRecursive),
              repeatInstance: element,
            ),
          ),
        );
      } else if (element is FieldInstance) {
        return SliverToBoxAdapter(
          child: ListTile(
            title: FieldWidget(
              key: Key(element.pathRecursive),
              element: element,
            ),
          ),
        );
      }
      return SliverToBoxAdapter(child: const SizedBox.shrink());
    }).toList();
  }
}
