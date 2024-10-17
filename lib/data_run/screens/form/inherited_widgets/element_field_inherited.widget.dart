import 'package:mass_pro/commons/logging/logging.dart';
import 'package:mass_pro/data_run/screens/form_module/model/form_element.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class FieldElementInheritedWidget extends InheritedWidget {
  const FieldElementInheritedWidget({
    Key? key,
    required this.fieldInstance,
    required this.child,
  }) : super(key: key, child: child);
  final FormFieldElement<dynamic> fieldInstance;
  final Widget child;

  static FormFieldElement<dynamic> of(BuildContext context) {
    final FieldElementInheritedWidget? inheritedWidget = context
        .dependOnInheritedWidgetOfExactType<FieldElementInheritedWidget>();
    if (inheritedWidget == null) {
      throw 'No FieldInstanceInheritedWidget found in context.';
    }
    return inheritedWidget.fieldInstance;
  }

  @override
  bool updateShouldNotify(covariant FieldElementInheritedWidget oldWidget) {
    logDebug(
        'FieldElementInheritedWidget updateShouldNotify(): ${fieldInstance.name}');
    return fieldInstance != oldWidget.fieldInstance;
  }
}
