
class FormValueMap {
  FormValueMap({Map<String, dynamic> values = const {}}) {
    _values.addAll(values);
  }

  final Map<String, dynamic> _values = {};

  Map<String, dynamic> get values => Map.unmodifiable(_values);

  // Get the value for a specific path
  dynamic getValue(String path) {
    return _values[path];
  }

  // Set the value for a specific path
  void setValue(String path, dynamic value) {
    // _values = _values.add(path, value);
    _values[path] = value;
  }
}
