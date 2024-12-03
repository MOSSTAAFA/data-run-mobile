import 'package:datarun/data_run/screens/form/element/form_element.dart';
import 'package:flutter/material.dart';

class ScannedItemsTable extends StatelessWidget {
  final List<Gs1ScannedItem> items;
  final Function(int) onRemove; // Index-based removal
  final Function(int, Gs1ScannedItem) onEdit;

  ScannedItemsTable({
    required this.items,
    required this.onRemove,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('GTIN')),
        DataColumn(label: Text('Batch')),
        DataColumn(label: Text('Serial')),
        DataColumn(label: Text('Actions')),
      ],
      rows: items.map((item) {
        final index = items.indexOf(item);
        return DataRow(cells: [
          DataCell(Text(item.gtin ?? '')),
          DataCell(Text(item.batchLot ?? '')),
          DataCell(Text(item.serialNumber ?? '')),
          DataCell(
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => onEdit(index, item),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => onRemove(index),
                ),
              ],
            ),
          ),
        ]);
      }).toList(),
    );
  }
}
