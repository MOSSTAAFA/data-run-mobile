import 'form_element.dart';

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
class FormModel {
  FormModel({
    Map<String, FormElementInstance<dynamic>> elements = const {},
  }) : sectionInstance = FormSectionElement(name: '', elements: elements);

  final FormSectionElement sectionInstance;

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
