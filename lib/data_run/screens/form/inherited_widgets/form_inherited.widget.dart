import 'package:mass_pro/data_run/screens/form/element/form_instance.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class FormInheritedWidget extends InheritedWidget {
  const FormInheritedWidget({
    super.key,
    required this.formInstance,
    required super.child,
  });

  final FormInstance formInstance;

  static FormInstance of(BuildContext context) {
    final FormInheritedWidget? inheritedWidget =
        context.dependOnInheritedWidgetOfExactType<FormInheritedWidget>();
    if (inheritedWidget == null) {
      throw 'No FormElementInheritedWidget found in context.';
    }
    return inheritedWidget.formInstance;
  }

  @override
  bool updateShouldNotify(covariant FormInheritedWidget oldWidget) {
    return formInstance != oldWidget.formInstance;
  }
}
