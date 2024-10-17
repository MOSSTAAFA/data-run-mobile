import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/form_module/model/form_element.dart';
import 'package:mass_pro/data_run/screens/form/reactive_elements/form_element_inherited_streamer.dart';

/// will be constructed in the ReactiveFieldInstanceBuilder and it will pass
/// the specific reactive_widget to it as a child
///
/// If you have a ReactiveFieldInstance and you immediately need to access it
/// using a ReactiveFieldInstance.of, you'll need a a consumer/Builder to
/// generate the appropriate context.
class ReactiveFieldInstance<T> extends StatelessWidget {
  const ReactiveFieldInstance({
    Key? key,
    required this.fieldInstance,
    required this.child,
  }) : super(key: key);

  final Widget child;

  final FormFieldElement<T> fieldInstance;

  static FormFieldElement<T>? of<T>(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
              FieldInstanceInheritedStreamer<T>>()
          ?.fieldInstance;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        FieldInstanceInheritedStreamer<T>>();
    return element == null
        ? null
        : (element.widget as FieldInstanceInheritedStreamer<T>).fieldInstance;
  }

  @override
  Widget build(BuildContext context) {
    return FieldInstanceInheritedStreamer<T>(
      fieldInstance: fieldInstance,
      stream: fieldInstance.elementControl!.statusChanged,
      child: child,
    );
  }
}
