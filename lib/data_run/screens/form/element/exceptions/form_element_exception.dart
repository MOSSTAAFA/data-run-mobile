import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/errors_management/errors/d_exception.dart';

class CircularDependencyException extends DException {
  CircularDependencyException({this.elementName});

  /// The name of the element that have circular dependency with.
  final String? elementName;

  @override
  String toString() {
    if (elementName == null) {
      return 'CircularDependencyException: element have circular dependency.';
    }

    return 'CircularDependencyException: element has circular dependency with: \'$elementName\'.';
  }
}

class FormElementNotFoundException extends DException {
  FormElementNotFoundException({this.elementName});

  /// The name of the element that was not found.
  final String? elementName;

  @override
  String toString() {
    if (elementName == null) {
      return 'FormElementNotFoundException: element not found.';
    }

    return 'FormElementNotFoundException: element with name: \'$elementName\' not found.';
  }
}

class FormRepeatElementInvalidIndexException extends DException {
  /// Creates an instance of the exception.
  ///
  /// The [index] argument is the invalid index that was the cause
  /// of this exception.
  FormRepeatElementInvalidIndexException(this.index);

  /// The invalid index that was the cause of this exception.
  final String index;

  @override
  String toString() {
    return 'FormRepeatElementInvalidIndexException: Index \'$index\' is not a valid index for FormRepeatElement';
  }
}

/// This exception is thrown by Reactive Widgets that doesn't find a
/// parent widget [ReactiveForm] or [ReactiveFormArray] in the widgets tree.
class FormElementParentNotFoundException extends DException {
  /// Creates an instance of the exception
  /// passing the [widget] that throws the exception.
  FormElementParentNotFoundException(this.widget)
      : super(
            'FormElementParentNotFoundException: couldn\'t find a parent widget. An instance of ${widget.runtimeType.toString()} widget must be under a FormElement Widget in the widgets tree.',
            widget);

  /// The widget that throws this exception.
  Widget widget;

// @override
// String toString() {
//   return 'FormElementParentNotFoundException: couldn\'t find a parent widget. An instance of ${widget.runtimeType.toString()} widget must be under a FormElement Widget in the widgets tree.';
// }
}

/// This exception is thrown by Reactive Widgets that doesn't find a
/// parent widget [ReactiveForm] or [ReactiveFormArray] in the widgets tree.
class FormSectionParentNotFoundException extends DException {
  /// Creates an instance of the exception
  /// passing the [widget] that throws the exception.
  FormSectionParentNotFoundException(this.widget)
      : super(
            'FormSectionParentNotFoundException: couldn\'t find a parent widget. An instance of ${widget.runtimeType.toString()} widget must be under a SectionElement Widget in the widgets tree.',
            widget);

  /// The widget that throws this exception.
  Widget widget;

// @override
// String toString() {
//   return 'FormSectionParentNotFoundException: widget couldn\'t find a parent widget. An instance of ${widget.runtimeType.toString()} widget must be under a Section Element widget in the widgets tree.';
// }
}

/// This exception is thrown by Reactive Widgets that doesn't find a
/// parent widget [ReactiveForm] or [ReactiveFormArray] in the widgets tree.
class FormRepeatedParentNotFoundException extends DException {
  /// Creates an instance of the exception
  /// passing the [widget] that throws the exception.
  FormRepeatedParentNotFoundException(this.widget)
      : super(
            'FormRepeatedParentNotFoundException: couldn\'t find a parent widget. An instance of ${widget.runtimeType.toString()} widget must be under a Repeat Element type Widget in the widgets tree.',
            widget);

  /// The widget that throws this exception.
  Widget widget;

// @override
// String toString() {
//   return 'FormRepeatedParentNotFoundException: couldn\'t find a parent widget. An instance of ${widget.runtimeType.toString()} widget must be under a ReactiveForm or a ReactiveFormArray in the widgets tree.';
// }
}
