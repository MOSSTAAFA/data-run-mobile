import 'package:datarun/data_run/screens/form/element/form_element.dart';
import 'package:datarun/data_run/screens/form/element_widgets/field.widget.dart';
import 'package:datarun/data_run/screens/form/form_with_sliver/repeat_table.widget.dart';
import 'package:datarun/data_run/screens/form/form_with_sliver/repeat_table_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SectionWidget extends HookConsumerWidget {
  SectionWidget({
    super.key,
    required this.element,
    Color? headerColor,
  }) : this.headerColor = headerColor;

  final SectionInstance element;
  final Color? headerColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // useRegisterDependencies(element);

    // final formElementHook = useFormElement(element, control);
    final elementPropertiesSnapshot = useStream(element.propertiesChanged);

    if (!elementPropertiesSnapshot.hasData) {
      return const SliverToBoxAdapter(child: CircularProgressIndicator());
    }

    if (elementPropertiesSnapshot.data!.hidden) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverStickyHeader(
        header: Container(
          color: headerColor ?? Theme.of(context).colorScheme.primary,
          padding: EdgeInsets.all(16),
          child: Text(element.label, style: TextStyle(color: Colors.white)),
        ),
        sliver: MultiSliver(
          children: buildSliverList(element.elements.values),
        ));
  }

  List<Widget> buildSliverList(
    Iterable<FormElementInstance<dynamic>> elements,
  ) {
    return elements.map((element) {
      if (element is SectionInstance) {
        return SectionWidget(
          key: Key(element.elementPath!),
          element: element,
          headerColor: Colors.orange.shade600,
        );
      } else if (element is RepeatInstance) {
        return SliverStickyHeader(
          header: Container(
            color: Colors.blue,
            padding: EdgeInsets.all(16),
            child: Row(children: [
              const Icon(MdiIcons.fileExcel),
              Text(element.label,
                  style: TextStyle(
                      color: Colors.white, overflow: TextOverflow.fade)),
              Expanded(
                child: Text(element.label,
                    style: TextStyle(
                        color: Colors.white, overflow: TextOverflow.fade)),
              )
            ]),
          ),
          sliver: SliverToBoxAdapter(
            child: RepeatTable(
              key: Key(element.elementPath!),
              repeatInstance: element,
            ),
          ),
        );
      } else if (element is FieldInstance) {
        return SliverToBoxAdapter(
          child: ListTile(
            title: FieldWidget(
              key: Key(element.elementPath!),
              element: element,
            ),
          ),
        );
      }
      return SliverToBoxAdapter(child: const SizedBox.shrink());
    }).toList();
  }
}
