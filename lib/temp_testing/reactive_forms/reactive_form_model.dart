abstract class FormElement {
  String name;
  String type;
  String path;
  List<FormElement>? fields;

  FormElement(this.name, this.type, this.path, [this.fields]);

  factory FormElement.fromJson(Map<String, dynamic> json) {
    List<FormElement>? fields;
    if (json['fields'] != null) {
      fields = (json['fields'] as List).map((fieldJson) => FormElement.fromJson(fieldJson)).toList();
    }
    return FormElementFactory.create(json['type'], json['name'], json['path'], fields);
  }
}

class TextElement extends FormElement {
  TextElement(String name, String path) : super(name, 'Text', path);
}

class SectionElement extends FormElement {
  SectionElement(String name, String path, List<FormElement> fields)
      : super(name, 'Section', path, fields);
}

class RepeatSectionElement extends FormElement {
  RepeatSectionElement(String name, String path, List<FormElement> fields)
      : super(name, 'RepeatSection', path, fields);
}

class FormElementFactory {
  static FormElement create(String type, String name, String path, List<FormElement>? fields) {
    switch (type) {
      case 'Text':
        return TextElement(name, path);
      case 'Section':
        return SectionElement(name, path, fields!);
      case 'RepeatSection':
        return RepeatSectionElement(name, path, fields!);
      default:
        throw Exception('Unsupported form element type: $type');
    }
  }
}

Map<String, dynamic> initializeFormState(List<FormElement> template, Map<String, dynamic>? initialData) {
  Map<String, dynamic> formState = {};

  void initializeField(FormElement element, Map<String, dynamic> state, dynamic data) {
    if (element is SectionElement) {
      state[element.name] = <String, dynamic>{};
      for (var field in element.fields!) {
        initializeField(field, state[element.name], data?[field.name]);
      }
    } else if (element is RepeatSectionElement) {
      state[element.name] = [];
      if (data != null) {
        for (var item in data) {
          var repeatedState = <String, dynamic>{};
          for (var field in element.fields!) {
            initializeField(field, repeatedState, item[field.name]);
          }
          state[element.name].add(repeatedState);
        }
      } else {
        state[element.name].add(initializeFormState(element.fields!, {}));
      }
    } else {
      state[element.name] = data ?? null;
    }
  }

  for (var element in template) {
    initializeField(element, formState, initialData?[element.name]);
  }

  return formState;
}

void main() {

// Example usage
  var templateJson = [
    {'name': 'orgUnit', 'type': 'Text', 'path': 'orgUnit'},
    {'name': 'transactionInfo', 'type': 'Section', 'path': 'transactionInfo', 'fields': [
      {'name': 'transaction', 'type': 'Text', 'path': 'transactionInfo.transaction'},
      {'name': 'supplier', 'type': 'Text', 'path': 'transactionInfo.supplier'},
    ]},
    {'name': 'stockInfo', 'type': 'Section', 'path': 'stockInfo', 'fields': [
      {'name': 'stockDetails', 'type': 'RepeatSection', 'path': 'stockInfo.stockDetails', 'fields': [
        {'name': 'stockItemType', 'type': 'Text', 'path': 'stockInfo.stockDetails.stockItemType'},
        {'name': 'stockQuantity', 'type': 'Text', 'path': 'stockInfo.stockDetails.stockQuantity'},
      ]}
    ]}
  ];

  List<FormElement> template = templateJson.map((json) => FormElement.fromJson(json)).toList();

  Map<String, dynamic> initialData = {
    'orgUnit': 'Example OrgUnit',
    'transactionInfo': {
      'transaction': 'supply',
      'supplier': 'Example Supplier',
    },
    'stockInfo': {
      'stockDetails': [
        {'stockItemType': 'Type 1', 'stockQuantity': '10'},
        {'stockItemType': 'Type 2', 'stockQuantity': '20'},
      ]
    }
  };

  var formState = initializeFormState(template, initialData);
  print(formState);

}