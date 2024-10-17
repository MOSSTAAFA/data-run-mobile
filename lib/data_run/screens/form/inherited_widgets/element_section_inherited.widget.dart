import 'package:mass_pro/data_run/screens/form_module/model/form_element.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class ElementSectionInheritedWidget extends InheritedWidget {
  const ElementSectionInheritedWidget({
    Key? key,
    required this.section,
    required this.child,
  }) : super(key: key, child: child);
  final FormSectionElement section;
  final Widget child;

  static FormSectionElement of(BuildContext context) {
    final ElementSectionInheritedWidget? inheritedWidget =
        context.dependOnInheritedWidgetOfExactType<ElementSectionInheritedWidget>();
    if (inheritedWidget == null) {
      throw 'No SectionInheritedWidget found in context.';
    }
    return inheritedWidget.section;
  }

  @override
  bool updateShouldNotify(covariant ElementSectionInheritedWidget oldWidget) {
    return section != oldWidget.section;
  }
}
