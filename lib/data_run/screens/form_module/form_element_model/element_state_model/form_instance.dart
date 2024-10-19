import 'package:mass_pro/data_run/screens/form_module/form_element_model/element_state_model/form_element_state.dart';
import 'package:mass_pro/data_run/screens/form_module/form_element_model/form_element_model.dart';

class FormStateManager {
  Map<String, FormElementState> flatMap; // For quick lookups using paths
  SectionElementModel rootNode; // For scoping and contextual evaluation

  FormStateManager(this.flatMap, this.rootNode);

  // Method to get a field state by path
  FormElementState? getElementByPath(String path) {
    return flatMap[path];
  }

  // Method to get a node by path in the hierarchy
  FormElementModel<dynamic>? getElementInHierarchy(String path) {
    return rootNode.element(path);
  }

  // Add new form element to both flatMap and hierarchy
  void addElement(
      String path, FormElementState element, CollectionElementModel<dynamic> parent) {
    flatMap[path] = element;
    if(parent is SectionElementModel) {
      parent.addAll([elements])
    }
    switch(parent) {
      case SectionElementModel():
        parent.addChild(path, element);
        // TODO: Handle this case.
      case RepeatElementModel():
        // TODO: Handle this case.
    };

  }
}
