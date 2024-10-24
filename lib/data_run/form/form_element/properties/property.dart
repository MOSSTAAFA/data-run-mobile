// import 'package:meta/meta.dart';
// import 'package:rxdart/rxdart.dart';
//
//
// abstract class Property<T> {
//   Property({this.initialValue});
//   T? initialValue;
//   T? _cachedValue;
//
//   T get value => _cachedValue ?? update(initialValue);
//
//   T update(T? newValue) {
//     if (newValue != _cachedValue) {
//       valueChangedSubject?.add(_cachedValue);
//       notifySubscribers();
//     }
//     return _cachedValue!;
//   }
//
//
//   Stream<T> get valueChanged =>
//       (valueChangedSubject ??= BehaviorSubject<T>.seeded(value)) as Stream<T>;
//
//   @protected
//   BehaviorSubject<T?>? valueChangedSubject;
//
//   void addSubscriber(Property<dynamic> expressionProperty) {
//     subscribers.add(expressionProperty);
//   }
//
//   @protected
//   final Set<Property<dynamic>> subscribers = {};
//
//   @protected
//   void notifySubscribers() {
//     subscribers.forEach((s) => s.evaluate());
//   }
//
//   Property<T> clone();
// }
