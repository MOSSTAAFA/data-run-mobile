import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mass_pro/data_run/screens/form_module/model/form_element.dart';
import 'package:mass_pro/data_run/screens/form/reactive_field/custom/q_reactive_switch_list_tile.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class QReactiveSwitchField extends HookWidget {
  const QReactiveSwitchField({
    super.key,
    required this.element,
  });

  final FormFieldElement<bool> element;

  @override
  Widget build(BuildContext context) {
    // final element = FieldElementInheritedWidget.of(context);

    return QReactiveSwitchListTile(
      element: element,
      title: Text('${element.label}'),
    );
  }
}
