import 'package:flutter/material.dart';

import 'strategies.dart';

class ITNFormStrategy implements FormCreationStrategy {
  @override
  List<Widget> loadFormFields() {
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
