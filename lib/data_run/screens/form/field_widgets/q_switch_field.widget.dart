import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class QSwitchField extends HookWidget {
  const QSwitchField({super.key, required this.element});

  final FieldInstance<bool> element;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text('${element.label}')),
        ReactiveCheckbox(
          formControl: element.elementControl,
        )
      ],
    );
    // return ReactiveSwitchListTile(
    //   formControl: element.elementControl,
    //   title: Text('${element.label}'),
    // );
  }
}
