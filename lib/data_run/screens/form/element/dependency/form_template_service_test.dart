// import 'package:d2_remote/modules/datarun/form/shared/form_element_template.dart';
//
// extension FirstWhereOrNull<E> on List<E> {
//   E? firstWhereOrElse(bool test(E element), {E? orElse()?}) {
//     for (E element in this) {
//       if (test(element)) return element;
//     }
//     return orElse?.call();
//   }
// }
//
// // class FormTemplateService {
// //   final List<Map<String, dynamic>> fields;
// //   final List<FormElementTemplate> elementTemplates = [];
// //
// //   FormTemplateService(this.fields);
// //
// //   //   // Get children of a specific path
// //   List<Map<String, dynamic>> getChildren(String path) {
// //     return fields
// //         .where((field) =>
// //     field['path'].startsWith('$path.') &&
// //         field['path'].split('.').length == path.split('.').length + 1)
// //         .toList();
// //   }
// //
// //   // Get parent of a specific path
// //   Map<String, dynamic>? getParent(String path) {
// //     final pathSegments = path.split('.');
// //     if (pathSegments.length > 1) {
// //       final parentPath =
// //       pathSegments.sublist(0, pathSegments.length - 1).join('.');
// //       return getElementByPath(parentPath);
// //     }
// //     return null;
// //   }
// //
// //   // Get ancestors of a specific path
// //   List<Map<String, dynamic>> getAncestors(String path) {
// //     final ancestors = <Map<String, dynamic>>[];
// //     while (path != '') {
// //       final parent = getParent(path);
// //       if (parent != null) {
// //         ancestors.add(parent);
// //         path = parent['path'];
// //       } else {
// //         break;
// //       }
// //     }
// //     return ancestors.reversed.toList();
// //   }
// //
// //   // Get element by path
// //   Map<String, dynamic>? getElementByPath(String path) {
// //     return fields.firstWhereOrElse((element) => element['path'] == path,
// //         orElse: () => null);
// //   }
// //
// //   // Get siblings of a specific path
// //   List<Map<String, dynamic>> getSiblings(String path) {
// //     final parentPath =
// //     path.split('.').sublist(0, path.split('.').length - 1).join('.');
// //     return fields
// //         .where((element) =>
// //     element['path'].startsWith(parentPath + '.') &&
// //         element['path'] != path)
// //         .toList();
// //   }
// //
// //   // Get descendants of a specific path
// //   List<Map<String, dynamic>> getDescendants(String path) {
// //     return fields.where((field) => field['path'].startsWith('$path.')).toList();
// //   }
// //
// //   // Get element by name (nearest in scope)
// //   Map<String, dynamic>? getClosestElementByName(
// //       String name, String currentPath) {
// //     final pathSegments = currentPath.split('.');
// //     for (int i = pathSegments.length - 1; i >= 0; i--) {
// //       final currentPathSegment = pathSegments.sublist(0, i + 1).join('.');
// //       final element = getElementByPath(currentPathSegment + '.' + name);
// //       if (element != null) {
// //         return element;
// //       }
// //     }
// //
// //     // Check global scope (siblings of root level)
// //     return fields.firstWhereOrElse(
// //             (element) =>
// //         element['name'] == name && element['path'].split('.').length == 1,
// //         orElse: () => null);
// //   }
// // }
//
// class FormTemplateService {
//   // final List<Map<String, dynamic>> fields;
//   final List<FormElementTemplate> elementTemplates;
//
//   FormTemplateService(this.elementTemplates);
//
//   //   // Get children of a specific path
//   List<FormElementTemplate> getChildren(String path) {
//     return elementTemplates
//         .where((field) =>
//     field.path.startsWith('$path.') &&
//         field.path.split('.').length == path.split('.').length + 1)
//         .toList();
//   }
//
//   // Get parent of a specific path
//   FormElementTemplate? getParent(String path) {
//     final pathSegments = path.split('.');
//     if (pathSegments.length > 1) {
//       final parentPath =
//       pathSegments.sublist(0, pathSegments.length - 1).join('.');
//       return getElementByPath(parentPath);
//     }
//     return null;
//   }
//
//   // Get ancestors of a specific path
//   List<FormElementTemplate> getAncestors(String path) {
//     final ancestors = <FormElementTemplate>[];
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
//   // Get element by path
//   FormElementTemplate? getElementByPath(String path) {
//     return elementTemplates.firstWhereOrElse((element) => element.path == path,
//         orElse: () => null);
//   }
//
//   // Get siblings of a specific path
//   List<FormElementTemplate> getSiblings(String path) {
//     final parentPath =
//     path.split('.').sublist(0, path.split('.').length - 1).join('.');
//     return elementTemplates
//         .where((element) =>
//     element.path.startsWith(parentPath + '.') &&
//         element.path != path)
//         .toList();
//   }
//
//   // Get descendants of a specific path
//   List<FormElementTemplate> getDescendants(String path) {
//     return elementTemplates.where((field) => field.path.startsWith('$path.')).toList();
//   }
//
//   // Get element by name (nearest in scope)
//   FormElementTemplate? getClosestElementByName(
//       String name, String currentPath) {
//     final pathSegments = currentPath.split('.');
//     for (int i = pathSegments.length - 1; i >= 0; i--) {
//       final currentPathSegment = pathSegments.sublist(0, i + 1).join('.');
//       final element = getElementByPath(currentPathSegment + '.' + name);
//       if (element != null) {
//         return element;
//       }
//     }
//
//     // Check global scope (siblings of root level)
//     return elementTemplates.firstWhereOrElse(
//             (element) =>
//         element.name == name && element.path.split('.').length == 1,
//         orElse: () => null);
//   }
// }
//
// void main() {
//   final formTemplate = [
//     {'name': 'transactionInfo', 'type': 'Section', 'path': 'transactionInfo'},
//     {
//       'name': 'transaction',
//       'type': 'SelectOne',
//       'path': 'transactionInfo.transaction'
//     },
//     {'name': 'supplier', 'type': 'Text', 'path': 'transactionInfo.supplier'},
//     {'name': 'details', 'type': 'Section', 'path': 'transactionInfo.details'},
//     // {'name': 'details', 'type': 'Section', 'path': 'transactionInfo'},
//     {
//       'name': 'quantity',
//       'type': 'Number',
//       'path': 'transactionInfo.details.quantity'
//     },
//   ];
//
//   final helper = FormTemplateService(formTemplate);
//
//   print('Children(transactionInfo): ${helper.getChildren('transactionInfo')}');
//   print('\n');
//   print(
//       'Parent(transactionInfo.transaction): ${helper.getParent('transactionInfo.transaction')}');
//   print('\n');
//   print(
//       'Ancestors(transactionInfo.details.quantity): ${helper.getAncestors('transactionInfo.details.quantity')}');
//   print('\n');
//   print(
//       'getElementByPath(transactionInfo.supplier): ${helper.getElementByPath('transactionInfo.supplier')}');
//   // print('\n');
//   // print('Siblings(transactionInfo.transaction): ${helper.getSiblings('transactionInfo.transaction')}');
//   print('\n');
//   print(
//       'Descendants(transactionInfo): ${helper.getDescendants('transactionInfo')}');
//   print('\n');
//   print(
//       '${helper.getClosestElementByName('details', 'transactionInfo.details.quantity')}');
//   print('\n');
//   print(
//       '${helper.getClosestElementByName('transaction', 'transactionInfo.details.quantity')}');
//   print('\n');
//   print(
//       '${helper.getClosestElementByName('transactionInfo', 'transactionInfo.details.quantity')}');
//   print('\n');
//   print(
//       '${helper.getClosestElementByName('quantity', 'transactionInfo.details.quantity')}');
// }
