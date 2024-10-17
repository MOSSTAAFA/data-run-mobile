import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/form/element/exceptions/form_element_exception.dart';
import 'package:mass_pro/data_run/screens/form_module/model/form_element.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormElementInheritedStreamer<E extends FormElementInstance<T>, T>
    extends InheritedStreamer<dynamic> {
  const FormElementInheritedStreamer({
    Key? key,
    required this.formElement,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final E formElement;
}

/// will be constructed in the ReactiveFieldInstanceBuilder and it will pass
/// the specific reactive_widget to it as a child
///
/// If you have a ReactiveFieldInstance and you immediately need to access it
/// using a ReactiveFieldInstance.of, you'll need a a consumer/Builder to
/// generate the appropriate context.
class ReactiveFormElement<E extends FormElementInstance<T>, T>
    extends StatelessWidget {
  const ReactiveFormElement({
    Key? key,
    required this.formElement,
    required this.child,
  }) : super(key: key);

  final Widget child;

  final E formElement;

  static E? of<E extends FormElementInstance<T>, T>(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
              FormElementInheritedStreamer<E, T>>()
          ?.formElement;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        FormElementInheritedStreamer<E, T>>();
    return element == null
        ? null
        : (element.widget as FormElementInheritedStreamer<E, T>).formElement;
  }

  @override
  Widget build(BuildContext context) {
    return FormElementInheritedStreamer<E, T>(
      formElement: formElement,
      stream: formElement.elementControl!.statusChanged,
      child: child,
    );
  }
}

/// Creates an instance of the [FormElementConsumer]
/// [builder] must not be null.
///
/// The [child] is optional but is good practice to use if part of the widget
/// subtree does not depend on the value of the [FormGroup] that is bind
/// with this widget.
class ReactiveFormElementConsumer<E extends FormElementInstance<T>, T>
    extends StatelessWidget {
  /// a widget that delegates its build to a callback.
  ///
  /// The [builder] argument must not be null.
  const ReactiveFormElementConsumer({
    super.key,
    required this.builder,
    this.child,
  });

  final Widget? child;

  final Widget Function(BuildContext context, E element, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    final E? formElement = ReactiveFormElement.of(context);

    if (formElement is! E) {
      throw FormElementParentNotFoundException(this);
    }

    return builder(context, formElement, child);
  }
}
