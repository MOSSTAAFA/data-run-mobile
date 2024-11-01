import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element_widgets/section.widget.dart';
import 'package:mass_pro/data_run/screens/form/field_widgets/improved_expansion_tile.widget.dart';
import 'package:mass_pro/data_run/screens/form/hooks/register_dependencies.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/section_inherited.widget.dart';
import 'package:mass_pro/generated/l10n.dart';

class RepeatItem extends HookWidget {
  const RepeatItem({
    super.key,
    required this.element,
    this.onDeleteItem,
    required this.index,
  });

  final RepeatItemInstance element;
  final Function(int index)? onDeleteItem;
  final int index;

  @override
  Widget build(BuildContext context) {
    useRegisterDependencies(element);

    return Builder(builder: (context) {
      if (element.hidden) {
        return SizedBox.shrink();
      }

      return ImprovedExpansionTile(
        leading: Icon(Icons.table_rows),
        maintainState: true,
        enabled: element.form.enabled,
        initiallyExpanded: false,
        titleWidget: Tooltip(
          message: '${index + 1}. ${element.label}',
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '${index + 1}. ${element.label}',
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
                icon:
                    const Icon(Icons.remove_circle_outline, color: Colors.red),
                onPressed: () {
                  _confirmDelete(context, index);
                },
              ),
            ],
          ),
        ),
        child: SectionWidget(element: element),
      );
    });
  }

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
}
