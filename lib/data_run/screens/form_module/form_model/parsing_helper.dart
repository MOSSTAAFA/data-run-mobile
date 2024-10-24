
import 'package:mass_pro/commons/extensions/list_extensions.dart';
import 'package:mass_pro/data_run/screens/form_module/form_template/form_element_template.dart';

class ParsingHelper {
  // maintain repeated section as list of elements
  // and only their properties with paths
  // Parses a Map<String, dynamic> from without path to with path representation using the template
  // TODO implement

  /// parse to
  ///
  /// ```json
  /// Map<String, dynamic> map = {
  ///    "orgUnit": 'Example OrgUnit Name',
  ///    "transactionInfo.transaction": 'supply',
  ///    "transactionInfo.supplier": 'Example supplier Name',
  ///    "stockInfo.stockDetails.0.stockItemType": 'itemType 1',
  ///    "stockInfo.stockDetails.0.stockQuantity": 88,
  ///    "stockInfo.stockDetails.1.stockItemType": 'itemType 2',
  ///    "stockInfo.stockDetails.1.stockQuantity": 10
  /// }
  ///
  static Map<String, dynamic> flattenFormInstance(
      Map<String, dynamic> formInstance/*, List<FormElementTemplate> template*/) {
    Map<String, dynamic> result = {};
    void traverse(Map<String, dynamic> data, String currentPath) {
      data.forEach((key, value) {
        String newPath = currentPath.isEmpty ? key : '$currentPath.$key';
        if (value is Map<String, dynamic>) {
          traverse(value, newPath);
        } else if (value is List) {
          for (int i = 0; i < value.length; i++) {
            traverse(value[i], '$newPath.$i');
          }
        } else {
          result[newPath] = value;
        }
      });
    }

    traverse(formInstance, '');
    return result;
  }

  static Map<String, dynamic> nestFormInstance(
      Map<String, dynamic> flatInstance) {
    Map<String, dynamic> result = {};
    void setNestedValue(
        Map<String, dynamic> map, List<String> keys, dynamic value) {
      if (keys.length == 1) {
        map[keys.first] = value;
      } else {
        String key = keys.first;
        if (!map.containsKey(key)) {
          map[key] =
              keys[1].contains(RegExp(r'^\d+$')) ? [] : <String, dynamic>{};
        }
        if (map[key] is List) {
          int index = int.parse(keys[1]);
          while (map[key].length <= index) {
            map[key].add(<String, dynamic>{});
          }
          setNestedValue(map[key][index], keys.sublist(2), value);
        } else {
          setNestedValue(map[key], keys.sublist(1), value);
        }
      }
    }

    flatInstance.forEach((key, value) {
      List<String> keys = key.split('.');
      setNestedValue(result, keys, value);
    });
    return result;
  }


// Recursive helper function for flattening formData to paths using the template
  static Map<String, dynamic> flattenFormDataUsingTemplate(
      Map<String, dynamic> formData, FormFlatTemplate formElementTemplate) {
    Map<String, dynamic> result = {};
    _flattenFormDataUsingTemplateRecursive(
        formData, '', result, formElementTemplate.fields, formElementTemplate);
    return result;
  }

// Recursive helper function for flattening formData to paths using the template
  static void _flattenFormDataUsingTemplateRecursive(
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
          _flattenFormDataUsingTemplateRecursive(entry.value, newPath, result,
              formElementTemplate.getDescendants(newPath), formElementTemplate);
        } else if (entryTemplate.type.isRepeatSection) {
          List<Map<String, dynamic>> listResult = [];
          for (int i = 0; i < entry.value.length; i++) {
            Map<String, dynamic> itemResult = {};
            _flattenFormDataUsingTemplateRecursive(entry.value[i], '$newPath.$i', itemResult,
                formElementTemplate.getDescendants(newPath), formElementTemplate);
            listResult.add(itemResult);
          }
          result[newPath] = listResult;
        } else {
          result[newPath] = entry.value;
        }
      } else if (entry.value is Map<String, dynamic>) {
        _flattenFormDataUsingTemplateRecursive(
            entry.value, newPath, result, template, formElementTemplate);
      } else {
        result[newPath] = entry.value;
      }
    }
  }
}

void main() {
  final List<Map<String, dynamic>> template = [
    {'name': 'orgUnit', 'type': 'Text', 'path': 'orgUnit'},
    {'name': 'transactionInfo', 'type': 'Section', 'path': 'transactionInfo'},
    {
      'name': 'transaction',
      'type': 'SelectOne',
      'listName': 'transactionTypes',
      'path': 'transactionInfo.transaction'
    },
    {
      'name': 'supplier',
      'type': 'Text',
      'rules': [
        {'expression': "#{transaction} == 'supply'", 'action': 'Show'}
      ],
      'path': 'transactionInfo.supplier'
    },
    {'name': 'stockInfo', 'type': 'Section', 'path': 'stockInfo'},
    {
      'name': 'stockDetails',
      'type': 'RepeatSection',
      'path': 'stockInfo.stockDetails'
    },
    {
      'name': 'stockItemType',
      'type': 'Text',
      'path': 'stockInfo.stockDetails.stockItemType'
    },
    {
      'name': 'stockQuantity',
      'type': 'Integer',
      'path': 'stockInfo.stockDetails.stockQuantity'
    }
  ];
  final Map<String, dynamic> formInstance = {
    'orgUnit': 'Example OrgUnit Name',
    'transactionInfo': {
      'transaction': 'supply',
      'supplier': 'Example supplier Name',
    },
    'stockInfo': {
      'stockDetails': [
        {'stockItemType': 'itemType 1', 'stockQuantity': 88},
        {'stockItemType': 'itemType 2', 'stockQuantity': 10}
      ]
    }
  };

  final Map<String, dynamic> flatInstance =
      ParsingHelper.flattenFormInstance(formInstance/*, template*/);
  print('formInstance: $flatInstance');
  final Map<String, dynamic> nestedInstance =
      ParsingHelper.nestFormInstance(flatInstance);
  print('nestedInstance: $nestedInstance');
  print('formInstance: $formInstance');
  assert(formInstance == nestedInstance); // Check that types are consistent
}
