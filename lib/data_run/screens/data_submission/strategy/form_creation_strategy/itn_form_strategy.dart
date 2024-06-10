import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/data_submission/strategy/form_creation_strategy/form_creation_strategy.dart';

class ITNFormStrategy implements FormCreationStrategy {
  @override
  List<Widget> createFormFields() {
    return [
      TextFormField(
        decoration: InputDecoration(labelText: 'Location'),
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Number Distributed'),
        keyboardType: TextInputType.number,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Date'),
        keyboardType: TextInputType.datetime,
      ),
    ];
  }
}
