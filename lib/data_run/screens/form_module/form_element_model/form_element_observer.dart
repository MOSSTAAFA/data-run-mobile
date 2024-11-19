// import 'package:flutter/foundation.dart';
//
// typedef DependencyCallback = void Function(String? dependency);
//
// abstract class FormElementObserver {
//   String? get name;
//
//   final List<DependencyCallback> _dependents = [];
//
//   void addDependent(DependencyCallback observer) {
//     _dependents.add(observer);
//   }
//
//   void removeDependent(VoidCallback observer) {
//     _dependents.remove(observer);
//   }
//
//   void notifyDependents() {
//     for (var dependent in _dependents) {
//       dependent(this.name);
//     }
//   }
// }
