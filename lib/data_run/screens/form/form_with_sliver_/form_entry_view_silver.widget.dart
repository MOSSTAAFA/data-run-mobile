import 'package:datarun/data_run/screens/form/element/form_element.dart';
import 'package:datarun/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:datarun/data_run/screens/form/element_widgets/field.widget.dart';
import 'package:datarun/data_run/screens/form/form_with_sliver_/repeat_table_view.dart';
import 'package:datarun/data_run/screens/form/form_with_sliver_/section.widget.dart';
import 'package:datarun/data_run/screens/form/form_with_sliver_/table_item_edit_panel.dart';
import 'package:datarun/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
      slivers: buildSliverList(
          formInstance.formSection.elements.values, context, ref),
    );
  }

  List<Widget> buildSliverList(Iterable<FormElementInstance<dynamic>> elements,
      BuildContext context, WidgetRef ref) {
    final formInstance = ref
        .watch(
            formInstanceProvider(formMetadata: FormMetadataWidget.of(context)))
        .requireValue;

    return elements.map((element) {
      if (element is SectionInstance) {
        return SectionWidget(
          key: Key(element.elementPath!),
          element: element,
          // parentIndex: 1,
          // label: '1. ${element.label}',
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
              key: Key(element.elementPath!),
              repeatInstance: element,
              onAdd: () => onAdd(context, ref,
                  formInstance.onAddRepeatedItem(element), true, element),
              onDelete: (index) =>
                  formInstance.onRemoveRepeatedItem(index, element),
              onEdit: (index) =>
                  onAdd(context, ref, element.elements[index], false, element),
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

  Future<int> onAdd(BuildContext context, WidgetRef ref,
      RepeatItemInstance item, bool isNew, RepeatInstance element) async {
    final formMetadata = FormMetadataWidget.of(context);

    await showDialog(
      // isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return FormMetadataWidget(
          formMetadata: formMetadata,
          child: Dialog(
            child: EditPanel(
              repeatItemInstance: item,
              isNew: isNew,
              onSave: () {
                if (item.elementControl!.dirty) {
                  element.elementControl.markAsTouched();
                }
                if (context.mounted) Navigator.pop(context);
              },
              onCancel: () {
                if (item.elementControl!.dirty) {
                  element.elementControl.markAsTouched();
                }
                if (context.mounted) Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
    return int.tryParse(item.name)!;
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

    if (element is FieldInstance) {
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
