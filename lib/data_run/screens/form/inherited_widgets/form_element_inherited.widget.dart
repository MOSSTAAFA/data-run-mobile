import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class FormElementInheritedWidget extends InheritedWidget {
  const FormElementInheritedWidget({
    Key? key,
    required this.element,
    required this.child,
  }) : super(key: key, child: child);
  final FormElementInstance<dynamic> element;
  final Widget child;

  static FormElementInstance<dynamic> of(BuildContext context) {
    final FormElementInheritedWidget? inheritedWidget = context
        .dependOnInheritedWidgetOfExactType<FormElementInheritedWidget>();
    if (inheritedWidget == null) {
      throw 'No FormElementInheritedWidget found in context.';
    }
    return inheritedWidget.element;
  }

  @override
  bool updateShouldNotify(covariant FormElementInheritedWidget oldWidget) {
    return element.elementState != oldWidget.element.elementState ||
        element.value != oldWidget.element.value;
  }
}
