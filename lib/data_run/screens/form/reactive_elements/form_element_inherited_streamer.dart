import 'package:mass_pro/data_run/screens/form_module/form_element_model/form_element.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class FieldInstanceInheritedStreamer<T> extends InheritedStreamer<dynamic> {
  const FieldInstanceInheritedStreamer({
    Key? key,
    required this.fieldInstance,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final FormFieldElement<T> fieldInstance;
}