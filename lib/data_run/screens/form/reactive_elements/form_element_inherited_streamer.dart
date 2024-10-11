import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element/form_instance.dart';
import 'package:mass_pro/data_run/screens/form/reactive_elements/reactive_form_element_consumer.dart';
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

  final FieldInstance<T> fieldInstance;
}