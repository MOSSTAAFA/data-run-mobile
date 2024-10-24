// import 'package:d2_remote/modules/datarun/form/entities/form_version.entity.dart';
// import 'package:d2_remote/modules/datarun/form/shared/form_element_template.dart';
// import 'package:mass_pro/commons/extensions/list_extensions.dart';
// //
// mixin PathWalkingService<T extends TreePath> {
//   // final List<Map<String, dynamic>> fields;
//   List<T> get fields;
//
//   /// Get children of a specific path
//   List<T> getChildren(String path) {
//     return fields
//         .where((field) =>
//             field.path.startsWith('$path.') &&
//             field.path.split('.').length == path.split('.').length + 1)
//         .toList();
//   }
//
//   /// Get parent of a specific path
//   T? getParent(String path) {
//     final pathSegments = path.split('.');
//     if (pathSegments.length > 1) {
//       final parentPath =
//           pathSegments.sublist(0, pathSegments.length - 1).join('.');
//       return getElementByPath(parentPath);
//     }
//     return null;
//   }
//
//   /// Get ancestors of a specific path
//   List<T> getAncestors(String path) {
//     final ancestors = <T>[];
//     while (path != '') {
//       final parent = getParent(path);
//       if (parent != null) {
//         ancestors.add(parent);
//         path = parent.path;
//       } else {
//         break;
//       }
//     }
//     return ancestors.reversed.toList();
//   }
//
//   /// Get element by path
//   T? getElementByPath(String path) {
//     return fields.firstOrNullWhere((element) => element.path == path);
//   }
//
//   /// Get siblings of a specific path
//   List<T> getSiblings(String path) {
//     final parentPath =
//         path.split('.').sublist(0, path.split('.').length - 1).join('.');
//     return fields
//         .where((element) =>
//             element.path.startsWith(parentPath + '.') && element.path != path)
//         .toList();
//   }
//
//   /// Get descendants of a specific path
//   List<T> getDescendants(String path) {
//     return fields.where((field) => field.path.startsWith('$path.')).toList();
//   }
//
//   /// Get element by name (nearest in scope)
//   T? getClosestElementByName(String name, String currentPath) {
//     final pathSegments = currentPath.split('.');
//     for (int i = pathSegments.length - 1; i >= 0; i--) {
//       final currentPathSegment = pathSegments.sublist(0, i + 1).join('.');
//       final element = getElementByPath(currentPathSegment + '.' + name);
//       if (element != null) {
//         return element;
//       }
//     }
//
//     /// Check global scope (siblings of root level)
//     return fields.firstWhereOrElse(
//         (element) =>
//             element.name == name && element.path.split('.').length == 1,
//         orElse: () => null);
//   }
// }
