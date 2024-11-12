import 'package:d2_remote/core/datarun/exception/exception.dart';
import 'package:flutter/material.dart';
import 'package:datarun/data_run/screens/form_module/form_element_model/form_element_model.dart';

class CircularDependencyException extends FormElementException {
  CircularDependencyException(String message, FormElementModel<dynamic>? source)
      : super(
            'CircularDependencyException: element ${(source?.name) ?? ''} has circular dependency.');
}

class FormElementException extends DException {
  FormElementException(String? message, {super.cause})
      : super(message ?? 'FormElementException: element error.');
}

class FormElementNotFoundException extends FormElementException {
  FormElementNotFoundException(FormElementModel<dynamic>? source)
      : super('FormElementNotFoundException', cause: source);
}

class FormRepeatElementInvalidIndexException extends FormElementException {
  FormRepeatElementInvalidIndexException(
      {FormElementModel<dynamic>? source, required this.index})
      : super(
            'FormRepeatElementInvalidIndexException: Index \'$index\' is not a valid index for FormRepeatElement',
            cause: source);

  /// The invalid index that was the cause of this exception.
  final String index;
}

/// This exception is thrown by Reactive Widgets that doesn't find a
/// parent widget [ReactiveForm] or [ReactiveFormArray] in the widgets tree.
class FormElementParentNotFoundException extends DException {
  /// Creates an instance of the exception
  /// passing the [widget] that throws the exception.
  FormElementParentNotFoundException(this.widget)
      : super(
            'FormElementParentNotFoundException: couldn\'t find a parent widget. An instance of ${widget.runtimeType.toString()} widget must be under a FormElement Widget in the widgets tree.',
            cause: widget);

  /// The widget that throws this exception.
  Widget widget;
}

/// This exception is thrown by Reactive Widgets that doesn't find a
/// parent widget [ReactiveForm] or [ReactiveFormArray] in the widgets tree.
class FormSectionParentNotFoundException extends DException {
  /// Creates an instance of the exception
  /// passing the [widget] that throws the exception.
  FormSectionParentNotFoundException(this.widget)
      : super(
            'FormSectionParentNotFoundException: couldn\'t find a parent widget. An instance of ${widget.runtimeType.toString()} widget must be under a SectionElement Widget in the widgets tree.',
            cause: widget);

  /// The widget that throws this exception.
  Widget widget;
}

/// This exception is thrown by Reactive Widgets that doesn't find a
/// parent widget [ReactiveForm] or [ReactiveFormArray] in the widgets tree.
class FormRepeatedParentNotFoundException extends DException {
  /// Creates an instance of the exception
  /// passing the [widget] that throws the exception.
  FormRepeatedParentNotFoundException(this.widget)
      : super(
            'FormRepeatedParentNotFoundException: couldn\'t find a parent widget. An instance of ${widget.runtimeType.toString()} widget must be under a Repeat Element type Widget in the widgets tree.',
            cause: widget);

  /// The widget that throws this exception.
  Widget widget;
}
