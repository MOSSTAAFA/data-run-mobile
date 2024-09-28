import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/data_run/screens/form/fields/improved_expansion_tile.widget.dart';
import 'package:mass_pro/data_run/screens/form/model/element/form_element_factory.dart';
import 'package:mass_pro/data_run/screens/form/model/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/section.widget.dart';
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
    final double scrollableHeight = 500.0;

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
          title: Text(S.of(context).confirm),
          content: Text(
            S.of(context).conformDeleteMsg,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(S.of(context).cancel),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
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
        content: Text(S.of(context).itemRemoved),
        action: SnackBarAction(
          label: S.of(context).undo,
          onPressed: () {
            // Code to undo deletion
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final expanded = useState(element.expanded);
    return ImprovedExpansionTile(
      leading: Icon(Icons.table_rows),
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
            Expanded(
              child: Text(
                '$index. ${element.properties.label}',
                overflow: TextOverflow.fade,

                maxLines: 1,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
              onPressed: () {
                _confirmDelete(context, index);
              },
            ),
          ],
        ),
      ),
      child: SectionWidget(element: element),
    );
  }
}
