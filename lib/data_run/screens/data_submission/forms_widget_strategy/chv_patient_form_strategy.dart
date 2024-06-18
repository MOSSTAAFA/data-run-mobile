import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/data_submission/forms_widget_strategy/form_creation_strategy.dart';

class CHVPatientFormStrategy implements FormCreationStrategy {
  @override
  List<Widget> loadFormFields() {
    return [
      TextFormField(
        decoration: InputDecoration(labelText: 'Region'),
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Houses Sprayed'),
        keyboardType: TextInputType.number,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Date'),
        keyboardType: TextInputType.datetime,
      ),
    ];
  }
}