import 'package:datarun/commons/custom_widgets/common.dart';
import 'package:datarun/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:datarun/data_run/screens/form/element_widgets/form_widget_factory.dart';
import 'package:datarun/data_run/screens/form/form_with_sliver/repeat_section.widget.dart';
import 'package:datarun/data_run/screens/form/form_with_sliver/repeat_table_view.dart';
import 'package:datarun/data_run/screens/form/form_with_sliver/table_item_edit_panel.dart';
import 'package:datarun/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:datarun/data_run/screens/form/hooks/register_dependencies.dart';
import 'package:datarun/data_run/screens/form/element/form_element.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SectionElementSliver extends HookConsumerWidget {
  const SectionElementSliver({super.key, required this.element});

  final SectionElement<dynamic> element;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useRegisterDependencies(element);

    final elementPropertiesSnapshot = useStream(element.propertiesChanged);

    if (!elementPropertiesSnapshot.hasData) {
      return CircularProgressIndicator();
    }

    if (elementPropertiesSnapshot.data!.hidden) {
      return SizedBox.shrink();
    }

    final formInstance = ref
        .watch(
            formInstanceProvider(formMetadata: FormMetadataWidget.of(context)))
        .requireValue;

    return switch (element) {
      final SectionInstance element => SliverStickyHeader(
          header: Header(title: element.label),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final childElement = element.elements.values.elementAt(index);
                return FormElementWidgetFactory.createWidget(childElement);
              },
              childCount: element.elements.length,
            ),
          ),
        ),
      final RepeatInstance element => SliverStickyHeader(
        header: Header(title: element.label),
        sliver: SliverToBoxAdapter(
            child: RepeatSectionWidget(
              element: element,
              key: ValueKey('${element.elementPath}_RepeatSectionWidget'),
              // repeatInstance: element,
              // onAdd: () => onAdd(context, ref, formInstance.onAddRepeatedItem(element), true),
              // onDelete: (index) => formInstance.onRemoveRepeatedItem(index, element),
              // onEdit: (index) => onAdd(context, ref, element.elements[index], false),
            ),
          ),
      ),
    };

    // return switch (element) {
    //   final SectionInstance element => Builder(builder: (context) {
    //       if (elementPropertiesSnapshot.data!.hidden) {
    //         return const SizedBox.shrink();
    //       } else {
    //         return Column(
    //           children: element.elements.values.map((childElement) {
    //             return FormElementWidgetFactory.createWidget(childElement);
    //           }).toList(),
    //         );
    //       }
    //     }),
    //   final RepeatInstance element => Builder(builder: (context) {
    //       if (elementPropertiesSnapshot.data!.hidden) {
    //         return const SizedBox.shrink();
    //       } else {
    //         return RepeatInstanceDataTable(
    //           key: ValueKey('${element.elementPath}_RepeatSectionWidget'),
    //           repeatInstance: element,
    //           onAdd: () {
    //             return onAdd(context, ref,
    //                 formInstance.onAddRepeatedItem(element), true);
    //           },
    //           onDelete: (index) =>
    //               formInstance.onRemoveRepeatedItem(index, element),
    //           onEdit: (index) =>
    //               onAdd(context, ref, element.elements[index], false),
    //         );
    //       }
    //     }),
    // };
  }

  Future<int> onAdd(BuildContext context, WidgetRef ref,
      RepeatItemInstance item, bool isNew) async {
    final formMetadata = FormMetadataWidget.of(context);

    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return FormMetadataWidget(
          formMetadata: formMetadata,
          child: EditPanel(
            repeatItemInstance: item,
            isNew: isNew,
            onSave: () {
              if (item.elementControl.dirty) {
                element.elementControl?.markAsTouched();
              }
              if (context.mounted) Navigator.pop(context);
            },
            onCancel: () {
              if (item.elementControl.dirty) {
                element.elementControl?.markAsTouched();
              }
              if (context.mounted) Navigator.pop(context);
            },
          ),
        );
      },
    );
    return int.tryParse(item.name)!;
  }
}
