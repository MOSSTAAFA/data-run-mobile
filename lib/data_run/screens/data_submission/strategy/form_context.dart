import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/data_submission/strategy/form_creation_strategy/form_creation_strategy.dart';

/// Context Class to Use the Strategy:
///
class FormContext {
  FormContext(this.strategy);

  final FormCreationStrategy strategy;

  List<Widget> createFormFields() {
    return strategy.createFormFields();
  }
}
