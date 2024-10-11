import 'package:mass_pro/commons/logging/logging.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class FieldElementInheritedWidget extends InheritedWidget {
  const FieldElementInheritedWidget({
    Key? key,
    required this.fieldInstance,
    required this.child,
  }) : super(key: key, child: child);
  final FieldInstance<dynamic> fieldInstance;
  final Widget child;

  static FieldInstance<dynamic> of(BuildContext context) {
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
