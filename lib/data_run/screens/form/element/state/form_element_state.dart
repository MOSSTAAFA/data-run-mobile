// class FormElementState {
//   final String name;
//   bool _isVisible;
//   List<String> _filteredOptions;
//
//   // Other properties like value
//
//   FormElementState(this.name, {bool isVisible = true, List<String> filteredOptions = const []})
//       : _isVisible = isVisible,
//         _filteredOptions = filteredOptions;
//
//   bool get isVisible => _isVisible;
//   List<String> get filteredOptions => _filteredOptions;
//
//   void updateVisibility(bool visible) {
//     _isVisible = visible;
//     notifyListeners();
//   }
//
//   void updateFilteredOptions(List<String> options) {
//     _filteredOptions = options;
//     notifyListeners();
//   }
//
// // ... methods for updating other properties and notifying listeners
// }