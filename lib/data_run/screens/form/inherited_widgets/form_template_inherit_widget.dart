import 'package:mass_pro/data_run/screens/form_module/form_template/form_element_template.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class FormFlatTemplateInheritWidget extends InheritedWidget {
  const FormFlatTemplateInheritWidget({
    super.key,
    required this.formContainerTemplate,
    required super.child,
  });

  final FormFlatTemplate formContainerTemplate;

  static FormFlatTemplate of(BuildContext context) {
    final FormFlatTemplateInheritWidget? inheritedWidget =
        context.dependOnInheritedWidgetOfExactType<FormFlatTemplateInheritWidget>();
    if (inheritedWidget == null) {
      throw 'No FormElementInheritedWidget found in context.';
    }
    return inheritedWidget.formContainerTemplate;
  }

  @override
  bool updateShouldNotify(covariant FormFlatTemplateInheritWidget oldWidget) {
    return false;
  }
}