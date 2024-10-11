import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/form/element/exceptions/form_element_exception.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/reactive_elements/form_element_inherited_streamer.dart';

/// Creates an instance of the [FormElementConsumer]
/// [builder] must not be null.
///
/// The [child] is optional but is good practice to use if part of the widget
/// subtree does not depend on the value of the [FormGroup] that is bind
/// with this widget.
class FormElementConsumer<T extends FormElementInstance<dynamic>>
    extends StatelessWidget {
  /// a widget that delegates its build to a callback.
  ///
  /// The [builder] argument must not be null.
  const FormElementConsumer({
    super.key,
    required this.builder,
    this.child,
  });

  final Widget? child;

  final Widget Function(BuildContext context, T element, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    final T? formElement = ReactiveFormElement.of(context);

    if (formElement is! T) {
      throw FormElementParentNotFoundException(this);
    }

    return builder(context, formElement, child);
  }
}
