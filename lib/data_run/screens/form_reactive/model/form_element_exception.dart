import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/errors_management/errors/d_exception.dart';

class FormElementNotFoundException extends DException {
  /// The name of the element that was not found.
  final String? elementName;

  FormElementNotFoundException({this.elementName});

  @override
  String toString() {
    if (elementName == null) {
      return 'FormElementNotFoundException: element not found.';
    }

    return 'FormElementNotFoundException: element with name: \'$elementName\' not found.';
  }
}

class FormRepeatElementInvalidIndexException extends DException {
  /// The invalid index that was the cause of this exception.
  final String index;

  /// Creates an instance of the exception.
  ///
  /// The [index] argument is the invalid index that was the cause
  /// of this exception.
  FormRepeatElementInvalidIndexException(this.index);

  @override
  String toString() {
    return 'FormRepeatElementInvalidIndexException: Index \'$index\' is not a valid index for FormRepeatElement';
  }
}

/// This exception is thrown by Reactive Widgets that doesn't find a
/// parent widget [ReactiveForm] or [ReactiveFormArray] in the widgets tree.
class FormElementParentNotFoundException extends DException {
  /// The widget that throws this exception.
  Widget widget;

  /// Creates an instance of the exception
  /// passing the [widget] that throws the exception.
  FormElementParentNotFoundException(this.widget);

  @override
  String toString() {
    return 'FormElementParentNotFoundException: QReactiveFormField widget couldn\'t find a parent widget. An instance of ${widget.runtimeType.toString()} widget must be under a ReactiveForm or a ReactiveFormArray in the widgets tree.';
  }
}
