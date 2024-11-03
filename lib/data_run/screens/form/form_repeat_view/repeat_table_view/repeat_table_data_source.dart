import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/form/form_element/form_element_iterators/form_element_iterator.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';

class _Row {
  _Row(this.repeatItem);

  final RepeatItemInstance repeatItem;

  bool selected = false;
}

class RepeatTableDataSource extends DataTableSource {
  RepeatTableDataSource({required this.repeatInstance})
      : _rows = repeatInstance.elements;

  final RepeatInstance repeatInstance;

  final List<RepeatItemInstance> _rows;
  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _rows.length) return null;
    final row = _Row(_rows[index]);
    final rowFields =
        getFormElementIterator<FieldInstance<dynamic>>(row.repeatItem);
    return DataRow.byIndex(
        index: index,
        selected: row.selected,
        onSelectChanged: (value) {
          if (row.selected != value) {
            _selectedCount += (value ?? false) ? 1 : -1;
            assert(_selectedCount >= 0);
            row.selected = (value ?? false);
            notifyListeners();
          }
        },
        cells: rowFields.map((field) => DataCell(Text(field.value))).toList());
  }

  @override
  int get rowCount => repeatInstance.elements.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
