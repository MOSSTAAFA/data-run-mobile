import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/data_run/screens/form_reactive/fields/improved_expansion_tile.widget.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_element_factory.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_element_model.dart';
import 'package:mass_pro/data_run/screens/form_reactive/section.widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mass_pro/generated/l10n.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:scrollable/exports.dart';

class RepeatSectionWidget extends HookConsumerWidget {
  const RepeatSectionWidget({
    super.key,
    required this.element,
    this.onAdd,
    this.onRemove,
    required this.formOptionsMap,
  });

  final RepeatSectionInstance element;
  final Map<String, List<FormOption>> formOptionsMap;
  final Function(int index)? onAdd;
  final Function(int index)? onRemove;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double scrollableHeight = 300.0;

    return ReactiveFormArray(
      formArray: element.elementControl,
      builder:
          (BuildContext context, FormArray<dynamic> formArray, Widget? child) {
        return SizedBox(
          height: scrollableHeight,
          child: KeyboardDismiss(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...element.elements.asMap().entries.map((entry) {
                    final index = entry.key;
                    final section = entry.value;

                    return RepeatedSectionItem(
                      // key: ValueKey('${element.elementPath}.$index'),
                      element: section as SectionInstance,
                      onDeleteItem: (i) => onRemove?.call(i),
                      index: index,
                    );
                  }).toList(),
                  ElevatedButton.icon(
                    onPressed: element.form.enabled
                        ? () {
                            element.addRepeatSectionItem(
                                FromElementFactory.createSectionInstance(
                                    element.form, element.template,
                                    formOptionsMap: formOptionsMap));
                            onAdd?.call(element.elements.lastIndex);
                          }
                        : null,
                    icon: const Icon(Icons.add),
                    label: Text(S.of(context).addNew),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class RepeatedSectionItem extends HookWidget {
  const RepeatedSectionItem({
    super.key,
    required this.element,
    this.onDeleteItem,
    required this.index,
  });

  final SectionInstance element;
  final Function(int index)? onDeleteItem;
  final int index;

  Future<void> _confirmDelete(BuildContext context, int index) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).confirm), // Localized title
          content: Text(
            S.of(context).conformDeleteMsg, // Localized message
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Cancel the deletion
              },
              child: Text(S.of(context).cancel),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Confirm the deletion
              },
              child: Text(S.of(context).confirm),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      _showUndoSnackBar(context, index);
    }
  }

  void _showUndoSnackBar(BuildContext context, int index) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    Future.delayed(const Duration(milliseconds: 300), () {
      onDeleteItem?.call(index);
    });

    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Text(S.of(context).itemRemoved), // Localized: "Item removed"
        action: SnackBarAction(
          label: S.of(context).undo, // Localized: "Undo"
          onPressed: () {
            // Code to undo deletion, potentially restore item
            // Logic here depends on how you want to re-add the item
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final expanded = useState(element.expanded);
    return ImprovedExpansionTile(
      maintainState: true,
      enabled: element.form.enabled,
      isExpanded: false,
      initiallyExpanded: true,
      onExpansionChanged: (ex) {
        expanded.value = ex;
      },
      titleWidget: Tooltip(
        message: '$index. ${element.properties.label}',
        child: Row(
          children: [
            // Wrap the Text widget with Expanded or Flexible to manage long text
            Expanded(
              child: Text(
                '$index. ${element.properties.label}',
                overflow: TextOverflow.fade,

                // Prevents overflow, adds "..." if the text is too long
                maxLines: 1,
                // Ensures the text stays on a single line
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ), // Adjust the style as needed
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
              onPressed: () {
                _confirmDelete(context, index); // Trigger confirmation dialog
              },
            ),
          ],
        ),
      ),
      child: SectionWidget(element: element),
    );
  }
}
