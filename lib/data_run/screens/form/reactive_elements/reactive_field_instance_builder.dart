import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/commons/logging/logging.dart';
import 'package:mass_pro/data_run/screens/form_module/form_element_model/form_element.dart';

class ReactiveFormElementBuilder<E extends FormElementInstance<T>, T>
    extends StatefulHookConsumerWidget {
  const ReactiveFormElementBuilder(
      {super.key,
      required this.formElement,
      required this.builder,
      this.initState,
      this.child});

  final Widget? child;
  final Widget Function(BuildContext context, E elementState, Widget? child)
      builder;
  final E formElement;
  final void Function(BuildContext context, E elementState)? initState;

  @override
  _ReactiveFormElementWidgetState<E, T> createState() =>
      _ReactiveFormElementWidgetState<E, T>();
}

class _ReactiveFormElementWidgetState<E extends FormElementInstance<T>, T>
    extends ConsumerState<ReactiveFormElementBuilder<E, T>> {
  late E _formElement;

  @override
  void initState() {
    super.initState();
    logDebug('ReactiveFormElementBuilder initState: ${_formElement.name}');

    // _formElement = FormElementInstance.create
    widget.initState?.call(context, _formElement);

    if (_formElement.hidden) {
      _formElement.elementControl?.markAsDisabled();

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _formElement.markAsHidden();
      });
    }
  }

  @override
  void didUpdateWidget(covariant ReactiveFormElementBuilder<E, T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.formElement.elementState != oldWidget.formElement.elementState) {
      if (_formElement.hidden) {
        _formElement.elementControl?.markAsDisabled();

        WidgetsBinding.instance.addPostFrameCallback((_) {
          _formElement.markAsHidden();
        });
      }
    }
  }

  @override
  void dispose() {
    logDebug('ReactiveFormElementBuilder dispose: ${_formElement.name}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    logDebug('ReactiveFormElementBuilder build(): ${_formElement.name}');
    return widget.builder(context, _formElement, widget.child);
  }
}
