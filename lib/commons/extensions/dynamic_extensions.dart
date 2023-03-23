extension IsNullDynamicExtension on dynamic {
  void isNull<T>(T? value, String message) {
    value == null ? throw Exception(message) : null;
  }
}
