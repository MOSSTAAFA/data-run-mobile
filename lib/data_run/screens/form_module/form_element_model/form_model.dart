import 'form_element_model.dart';

/// Implementation roadmap
/// approach ensures easier management of form dependencies and keeps the system optimized as the complexity scales up.
/// - Maintain a meta-model (the template) and implement the retrieve help methods
/// that for dependencies, paths, validation rules, etc.
/// - Rely on the form template for field names, types, labels, and dependencies.
/// - Use the form template to apply client-side validation rules like mandatory
/// fields, option constraints, and conditional requirements before submission,
/// reducing server load and improving UX.
///
/// - filtering system for fields that depend on others can be done
/// dynamically at runtime by interpreting filters from the template.
///
/// On-the-fly Validation:
/// Before deserialization, ensure data integrity by validating it against the template. This prevents saving invalid data, particularly for fields with dependencies (e.g., country cannot be selected without a region).

/// To rehydrate the form, the system needs to:
///
/// - Parse the template to recreate the form structure.
/// - Populate the form with saved values from the serialized data.
/// - Reapply any filters or dependencies as defined in the template.
///

class FormElement {
  final String path;
  dynamic value;
  final FormElement? parent;
  final List<FormElement> children;

  FormElement({
    required this.path,
    this.value,
    this.parent,
    this.children = const [],
  });
}

class FormState {
  final Map<String, FormElement> flatStateMap = {};

  FormState(FormElement rootElement) {
    _flattenState(rootElement);
  }

  void _flattenState(FormElement element) {
    flatStateMap[element.path] = element;
    for (var child in element.children) {
      _flattenState(child);
    }
  }

  dynamic getValue(String path) {
    return flatStateMap[path]?.value;
  }

  void setValue(String path, dynamic value) {
    flatStateMap[path]?.value = value;
    _evaluateRules(path, value);
  }

  dynamic resolveDependency(String path, FormElement? startingElement) {
    FormElement? currentElement = startingElement;
    while (currentElement != null) {
      if (flatStateMap[currentElement.path]?.value != null) {
        return flatStateMap[currentElement.path]?.value;
      }
      currentElement = currentElement.parent;
    }
    // If not found, check global scope
    return flatStateMap[path]?.value;
  }

  void _evaluateRules(String path, dynamic value) {
    // Implement rule evaluation logic here
  }
}

// Example usage
void main() {
  FormElement root = FormElement(path: 'root', value: null, parent: null);
  FormElement transaction = FormElement(path: 'root.transactionInfo.transaction', value: 'sale', parent: root);
  FormElement item = FormElement(path: 'root.transactionInfo.ItemsInfo.stockItems[0].quantityReceived', parent: transaction);

  root.children.add(transaction);
  transaction.children.add(item);

  FormState formState = FormState(root);
  print(formState.resolveDependency('root.transactionInfo.transaction', item)); // Output should be 'sale'
}


class FormModel {
  FormModel({
    Map<String, FormElementModel<dynamic>> elements = const {},
  }) : sectionInstance = SectionElementModel(name: '', elements: elements);

  final SectionElementModel sectionInstance;

  Map<String, dynamic> values = {};
  final Map<String, bool> visibility = {};

  void updateValue(String path, dynamic value) {
    values[path] = value;
    // Update visibility based on rules...
  }

  void updateVisibility(String path, bool isVisible) {
    visibility[path] = isVisible;
  }
}

class RepeatElementState {
  Map<String, List<Map<String, dynamic>>> values = {};
  Map<String, bool> visibility = {};

  void updateValue(String path, dynamic value) {
    values[path] = value;
    // Update visibility based on rules...
  }

  void updateVisibility(String path, bool isVisible) {
    visibility[path] = isVisible;
  }
}
