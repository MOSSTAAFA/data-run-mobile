import 'package:flutter/foundation.dart';

abstract class ViewModelFactory<T> {
  T create();

  /// The type of the objects created by this factory.
  Type get type => T;

  @override
  String toString() {
    return 'Factory(type: $type)';
  }
}

/// NMC: form the dart library, go through its usage later
/// A factory interface that also reports the type of the created objects.
class Factory<T> {
  /// Creates a new factory.
  ///
  /// The `constructor` parameter must not be null.
  const Factory(this.constructor) : assert(constructor != null);

  /// Creates a new object of type T.
  final ValueGetter<T> constructor;

  /// The type of the objects created by this factory.
  Type get type => T;

  @override
  String toString() {
    return 'Factory(type: $type)';
  }
}
