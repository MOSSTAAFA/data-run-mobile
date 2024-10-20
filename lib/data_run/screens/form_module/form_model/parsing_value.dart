// import 'dart:collection';
//
// import 'package:mass_pro/commons/extensions/list_extensions.dart';
//
// void main() {
//   // Parse to with path representation based on the template
//   Map<String, dynamic> dataWithPath = parseToWithPath(dataWithoutPath, template);
//   print('Data with path:\n$dataWithPath');
//
//   // Parse back to without path representation based on the template
//   Map<String, dynamic> dataWithoutPathParsed = parseToWithoutPath(dataWithPath, template);
//   print('Data without path parsed:\n$dataWithoutPathParsed');
//
//   // Assert that the parsed data is equal to the original data
//   assert(dataWithoutPathParsed == dataWithoutPath);
// }
//
// // Parses a Map<String, dynamic> from without path to with path representation based on the template
// Map<String, dynamic> parseToWithPath(Map<String, dynamic> data, List<Map<String, dynamic>> template) {
//   Map<String, dynamic> result = {};
//   _parseToWithPathRecursive(data, '', result, template);
//   return result;
// }
// // Recursive helper function for parsing to with path based on the template
// void _parseToWithPathRecursive(Map<String, dynamic> data, String path, Map<String, dynamic> result, List<Map<String, dynamic>> template) {
//   for (MapEntry<String, dynamic> entry in data.entries) {
//     String newPath = path.isEmpty ? entry.key : '$path.${entry.key}';
//     if (entry.value is Map<String, dynamic>) {
//       _parseToWithPathRecursive(entry.value, newPath, result, template);
//     } else if (entry.value is List) {
//       List<Map<String, dynamic>> listResult = [];
//       for (int i = 0; i < entry.value.length; i++) {
//         Map<String, dynamic> itemResult = {};
//         _parseToWithPathRecursive(entry.value[i], '$newPath.$i', itemResult, template);
//         listResult.add(itemResult);
//       }
//       result[newPath] = listResult;
//     } else {
//       // Find the corresponding template element based on the path
//       Map<String, dynamic>? templateElement = template.firstOrNullWhere((element) => element['path'] == newPath);
//       if (templateElement != null) {
//         // Handle different element types as needed
//         if (templateElement['type'] == 'Section') {
//           // ...
//         } else if (templateElement['type'] == 'RepeatSection') {
//           // ...
//         } else {
//           // ...
//         }
//       }
//       result[newPath] = entry.value;
//     }
//   }
// }
//
// // Parses a Map<String, dynamic> from with path to without path representation based on the template
// Map<String, dynamic> parseToWithoutPath(Map<String, dynamic> data, List<Map<String, dynamic>> template) {
//   Map<String, dynamic> result = {};
//   _parseToWithoutPathRecursive(data, result, template);
//   return result;
// }
//
// // Recursive helper function for parsing to without path based on the template
// void _parseToWithoutPathRecursive(Map<String, dynamic> data, Map<String, dynamic> result, List<Map<String, dynamic>> template) {
//   for (MapEntry<String, dynamic> entry in data.entries) {
//     List<String> pathParts = entry.key.split('.');
//     Map<dynamic, dynamic> currentResult = result;
//     for (int i = 0; i < pathParts.length - 1; i++) {
//       String part = pathParts[i];
//       if (!currentResult.containsKey(part)) {
//         currentResult[part] = {};
//       }
//       currentResult = currentResult[part];
//     }
//     currentResult[pathParts.last] = entry.value;
//   }
// }
//
// Map<String, dynamic> dataWithoutPath = {
//   'orgUnit': 'Example OrgUnit Name',
//   'transactionInfo': {
//     'transaction': 'supply',
//     'supplier': 'Example supplier Name',
//   },
//   'stockInfo': {
//     'stockDetails': [
//       {'stockItemType': 'itemType 1', 'stockQuantity': 88},
//       {'stockItemType': 'itemType 2', 'stockQuantity': 10}
//     ]
//   }
// };
// List<Map<String, dynamic>> template = [
//   {'name': 'orgUnit', 'type': 'Text', 'path': 'orgUnit'},
//   {'name': 'transactionInfo', 'type': 'Section', 'path': 'transactionInfo'},
//   {
//     'name': 'transaction',
//     'type': 'SelectOne',
//     'listName': 'transactionTypes',
//     'path': 'transactionInfo.transaction'
//   },
//   {
//     'name': 'supplier',
//     'type': 'Text',
//     'rules': [
//       {'expression': "#{transaction} == 'supply'", 'action': 'Show'}
//     ],
//     'path': 'transactionInfo.supplier'
//   },
//   {'name': 'stockInfo', 'type': 'Section', 'path': 'stockInfo'},
//   {
//     'name': 'stockDetails',
//     'type': 'RepeatSection',
//     'path': 'stockInfo.stockDetails'
//   },
//   {
//     'name': 'stockItemType',
//     'type': 'Text',
//     'path': 'stockInfo.stockDetails.stockItemType'
//   },
//   {
//     'name': 'stockQuantity',
//     'type': 'Integer',
//     'path': 'stockInfo.stockDetails.stockQuantity'
//   }
// ];
//
//
// Map<String, dynamic> flattenFormInstance(
//     Map<String, dynamic> formInstance, List<Map<String, dynamic>> template) {
//   Map<String, dynamic> result = {};
//
//   void traverse(Map<String, dynamic> data, String currentPath) {
//     data.forEach((key, value) {
//       String newPath = currentPath.isEmpty ? key : '$currentPath.$key';
//
//       if (value is Map<String, dynamic>) {
//         traverse(value, newPath);
//       } else if (value is List) {
//         for (int i = 0; i < value.length; i++) {
//           traverse(value[i], '$newPath.$i');
//         }
//       } else {
//         result[newPath] = value;
//       }
//     });
//   }
//
//   traverse(formInstance, '');
//   return result;
// }
import 'dart:collection';

// Template structure
Map<String, dynamic> template = {
  'orgUnit': {'type': 'Text'},
  'transactionInfo': {
    'type': 'Section',
    'children': {
      'transaction': {'type': 'SelectOne', 'listName': 'transactionTypes'},
      'supplier': {'type': 'Text', 'rules': [{'expression': "#{transaction} == 'supply'", 'action': 'Show'}]}
    }
  },
  'stockInfo': {
    'type': 'Section',
    'children': {
      'stockDetails': {
        'type': 'RepeatSection',
        'children': {
          'stockItemType': {'type': 'Text'},
          'stockQuantity': {'type': 'Integer'}
        }
      }
    }
  }
};

// Parses a Map<String, dynamic> from without path to with path representation using the template
Map<String, dynamic> parseToWithPath(Map<String, dynamic> data) {
  Map<String, dynamic> result = {};
  _parseToWithPathRecursive(data, '', result, template);
  return result;
}

// Recursive helper function for parsing to with path using the template
void _parseToWithPathRecursive(Map<String, dynamic> data, String path, Map<String, dynamic> result, Map<String, dynamic> template) {
  for (MapEntry<String, dynamic> entry in data.entries) {
    String newPath = path.isEmpty ? entry.key : '$path.${entry.key}';
    if (template.containsKey(entry.key)) {
      if (template[entry.key]['type'] == 'Section') {
        _parseToWithPathRecursive(entry.value, newPath, result, template[entry.key]['children']);
      } else if (template[entry.key]['type'] == 'RepeatSection') {
        List<Map<String, dynamic>> listResult = [];
        for (int i = 0; i < entry.value.length; i++) {
          Map<String, dynamic> itemResult = {};
          _parseToWithPathRecursive(entry.value[i], '$newPath.$i', itemResult, template[entry.key]['children']);
          listResult.add(itemResult);
        }
        result[newPath] = listResult;
      } else {
        result[newPath] = entry.value;
      }
    } else if (entry.value is Map<String, dynamic>) {
      _parseToWithPathRecursive(entry.value, newPath, result, template);
    } else {
      result[newPath] = entry.value;
    }
  }
}

// Parses a Map<String, dynamic> from with path to without path representation using the template
Map<String, dynamic> parseToWithoutPath(Map<String, dynamic> data) {
  Map<String, dynamic> result = {};
  _parseToWithoutPathRecursive(data, result, template);
  return result;
}

// Recursive helper function for parsing to without path using the template
void _parseToWithoutPathRecursive(Map<String, dynamic> data, Map<String, dynamic> result, Map<String, dynamic> template) {
  for (MapEntry<String, dynamic> entry in data.entries) {
    List<String> pathParts = entry.key.split('.');
    Map<String, dynamic> currentResult = result;
    for (int i = 0; i < pathParts.length - 1; i++) {
      String part = pathParts[i];
      if (!currentResult.containsKey(part)) {
        currentResult[part] = <String, dynamic>{};
      }
      currentResult = currentResult[part];
    }

    // Check if the current path part is a repeated section index
    if (int.tryParse(pathParts.last) != null) {
      // If it is an index, create a new list if necessary and add the value
      if (!currentResult.containsKey(pathParts[pathParts.length - 2])) {
        currentResult[pathParts[pathParts.length - 2]] = [];
      }
      currentResult[pathParts[pathParts.length - 2]].add(entry.value);
    } else {
      // If it's not an index, directly set the value
      currentResult[pathParts.last] = entry.value;
    }
  }
}

// // Parses a Map<String, dynamic> from with path to without path representation using the template
// Map<String, dynamic> parseToWithoutPath(Map<String, dynamic> data) {
//   Map<String, dynamic> result = {};
//   _parseToWithoutPathRecursive(data, result, template);
//   return result;
// }
//
// // Recursive helper function for parsing to without path using the template
// void _parseToWithoutPathRecursive(Map<String, dynamic> data, Map<String, dynamic> result, Map<String, dynamic> template) {
//   for (MapEntry<String, dynamic> entry in data.entries) {
//     List<String> pathParts = entry.key.split('.');
//     Map<dynamic, dynamic> currentResult = result;
//     for (int i = 0; i < pathParts.length - 1; i++) {
//       String part = pathParts[i];
//       if (!currentResult.containsKey(part)) {
//         currentResult[part] = {};
//       }
//       currentResult = currentResult[part];
//     }
//     currentResult[pathParts.last] = entry.value;
//   }
// }

void main() {
  // Example data without path
  Map<String, dynamic> dataWithoutPath = {
    'orgUnit': 'Example OrgUnit Name',
    'transactionInfo': {
      'transaction': 'supply',
      'supplier': 'Example supplier Name'
    },
    'stockInfo': {
      'stockDetails': [
        {'stockItemType': 'itemType 1', 'stockQuantity': 88},
        {'stockItemType': 'itemType 2', 'stockQuantity': 10}
      ]
    }
  };

  // Parse to with path representation using the template
  Map<String, dynamic> dataWithPath = parseToWithPath(dataWithoutPath);
  print('Data with path:\n$dataWithPath');

  // Parse back to without path representation using the template
  Map<String, dynamic> dataWithoutPathParsed = parseToWithoutPath(dataWithPath);
  print('Data without path parsed:\n$dataWithoutPathParsed');

  // Assert that the parsed data is equal to the original data
  assert(dataWithoutPathParsed == dataWithoutPath);
}