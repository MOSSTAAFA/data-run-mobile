// // DependencyRegistry.dart
// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
//
// class DependencyRegistry {
//   IMap<String, dynamic> _registry = IMap({});
//
//   void register(String path, dynamic value) {
//     _registry = _registry.add(path, value);
//   }
//
//   dynamic lookup(String path) {
//     return _registry.get(path);
//   }
//
//   void unregister(String path) {
//     _registry = _registry.remove(path);
//   }
// }
//
// // // Providers.dart
// // final transactionProvider = StateProvider<String>((ref) => 'sale');
// // final quantityReceivedProvider = StateProvider<int>((ref) => 0);
// //
// // final scopedDependencyProvider = Provider.family<dynamic, String>((ref, path) {
// //   // Custom logic to traverse hierarchy using the materialized path
// //   return dependencyRegistry.lookup(path);
// // });
