// Template structure
import 'package:mass_pro/commons/extensions/list_extensions.dart';
import 'package:mass_pro/data_run/screens/form_module/form_template/form_element_template.dart';

Map<String, dynamic> template = {
  'orgUnit': {'type': 'Text'},
  'transactionInfo': {
    'type': 'Section',
    'children': {
      'transaction': {'type': 'SelectOne', 'listName': 'transactionTypes'},
      'supplier': {
        'type': 'Text',
        'rules': [
          {'expression': "#{transaction} == 'supply'", 'action': 'Show'}
        ]
      }
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

// Recursive helper function for flattening formData to paths using the template
Map<String, dynamic> flattenFormData(
    Map<String, dynamic> data, FormFlatTemplate formElementTemplate) {
  Map<String, dynamic> result = {};
  _flattenFormDataRecursive(
      data, '', result, formElementTemplate.fields, formElementTemplate);
  return result;
}

// Recursive helper function for flattening formData to paths using the template
void _flattenFormDataRecursive(
    Map<String, dynamic> data,
    String path,
    Map<String, dynamic> result,
    List<FormElementTemplate> template,
    FormFlatTemplate formElementTemplate) {
  for (MapEntry<String, dynamic> entry in data.entries) {
    String newPath = path.isEmpty ? entry.key : '$path.${entry.key}';
    final entryTemplate =
        template.firstOrNullWhere((template) => template.name == entry.key);
    if (entryTemplate != null) {
      if (entryTemplate.type.isSection) {
        _flattenFormDataRecursive(entry.value, newPath, result,
            formElementTemplate.getDescendants(newPath), formElementTemplate);
      } else if (entryTemplate.type.isRepeatSection) {
        List<Map<String, dynamic>> listResult = [];
        for (int i = 0; i < entry.value.length; i++) {
          Map<String, dynamic> itemResult = {};
          _flattenFormDataRecursive(entry.value[i], '$newPath.$i', itemResult,
              formElementTemplate.getDescendants(newPath), formElementTemplate);
          listResult.add(itemResult);
        }
        result[newPath] = listResult;
      } else {
        result[newPath] = entry.value;
      }
    } else if (entry.value is Map<String, dynamic>) {
      _flattenFormDataRecursive(
          entry.value, newPath, result, template, formElementTemplate);
    } else {
      result[newPath] = entry.value;
    }
  }
}
//
// // Parses a Map<String, dynamic> from flat to hierarchical using the template
// Map<String, dynamic> parseToWithoutPath(Map<String, dynamic> data) {
//   Map<String, dynamic> result = {};
//   _parseToWithoutPathRecursive(data, result, template);
//   return result;
// }
//
// // Recursive helper function for parsing to to hierarchical using the template
// void _parseToWithoutPathRecursive(Map<String, dynamic> data,
//     Map<String, dynamic> result, Map<String, dynamic> template) {
//   for (MapEntry<String, dynamic> entry in data.entries) {
//     List<String> pathParts = entry.key.split('.');
//     Map<String, dynamic> currentResult = result;
//     for (int i = 0; i < pathParts.length - 1; i++) {
//       String part = pathParts[i];
//       if (!currentResult.containsKey(part)) {
//         currentResult[part] = <String, dynamic>{};
//       }
//       currentResult = currentResult[part];
//     }
//
//     // Check if the current path part is a repeated section index
//     if (int.tryParse(pathParts.last) != null) {
//       // If it is an index, create a new list if necessary and add the value
//       if (!currentResult.containsKey(pathParts[pathParts.length - 2])) {
//         currentResult[pathParts[pathParts.length - 2]] = [];
//       }
//       currentResult[pathParts[pathParts.length - 2]].add(entry.value);
//     } else {
//       // If it's not an index, directly set the value
//       currentResult[pathParts.last] = entry.value;
//     }
//   }
// }

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

  // // Parse to with path representation using the template
  // Map<String, dynamic> dataWithPath = flattenFormData(dataWithoutPath);
  // print('Data with path:\n$dataWithPath');
  //
  // // Parse back to without path representation using the template
  // Map<String, dynamic> dataWithoutPathParsed = parseToWithoutPath(dataWithPath);
  // print('Data without path parsed:\n$dataWithoutPathParsed');
  //
  // // Assert that the parsed data is equal to the original data
  // assert(dataWithoutPathParsed == dataWithoutPath);
}
