// class FormNotifier extends StateNotifier<FormState> {
//   FormNotifier() : super(FormState());
//
//   void updateFieldValue(String fieldPath, dynamic newValue) {
//     final fieldState = state.getNode(fieldPath) as FieldState?;
//     if (fieldState != null) {
//       final updatedField = fieldState.copyWith(value: newValue);
//       state = state.updateNode(fieldPath, updatedField);
//     }
//   }
//
//   void addRowToTable(String tablePath, Map<String, TreeNodeState> newRow) {
//     final tableState = state.getNode(tablePath) as TableState?;
//     if (tableState != null) {
//       final updatedRows = [...tableState.rows, newRow];
//       final updatedTable = tableState.copyWith(rows: updatedRows);
//       state = state.updateNode(tablePath, updatedTable);
//     }
//   }
// }
