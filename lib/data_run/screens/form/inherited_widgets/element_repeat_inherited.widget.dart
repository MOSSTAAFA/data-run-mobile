import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class ElementRepeatInheritedWidget extends InheritedWidget {
  const ElementRepeatInheritedWidget({
    Key? key,
    required this.repeatInstance,
    required this.child,
  }) : super(key: key, child: child);
  final RepeatInstance repeatInstance;
  final Widget child;

  static RepeatInstance of(BuildContext context) {
    final ElementRepeatInheritedWidget? inheritedWidget = context
        .dependOnInheritedWidgetOfExactType<ElementRepeatInheritedWidget>();
    if (inheritedWidget == null) {
      throw 'No ElementRepeatInheritedWidget found in context.';
    }
    return inheritedWidget.repeatInstance;
  }

  @override
  bool updateShouldNotify(covariant ElementRepeatInheritedWidget oldWidget) {
    return repeatInstance != oldWidget.repeatInstance;
  }
}
