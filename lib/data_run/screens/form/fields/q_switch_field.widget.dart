import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mass_pro/data_run/screens/form/model/element/form_element.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class QSwitchField extends HookWidget {
  const QSwitchField({super.key, required this.element});

  final FieldInstance<dynamic> element;

  @override
  Widget build(BuildContext context) {
    final elementConfig = useState(element.properties);

    return ReactiveSwitchListTile(
      formControlName: element.name,
      // formControl: element.elementControl as FormControl<bool>,
      title: Text('${elementConfig.value.label}'),
    );
  }
}
