import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mass_pro/commons/logging/logging.dart';

class CustomFields extends StatefulWidget {
  const CustomFields({super.key});

  @override
  State<CustomFields> createState() => _CustomFieldsState();
}

class _CustomFieldsState extends State<CustomFields> {
  final _formKey = GlobalKey<FormBuilderState>();

  static const List<String> _kOptions = <String>[
    'pikachu',
    'bulbasaur',
    'charmander',
    'squirtle',
    'caterpie',
  ];

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          FormBuilderField<Map<String, dynamic>?>(
            name: 'date',
            builder: (FormFieldState<dynamic> field) {
              return Builder(
                builder: (context) {
                  return Column(
                    children: [
                      InputDatePickerFormField(
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 30)),
                        onDateSubmitted: (value) => field.didChange(value),
                        errorInvalidText: field.errorText,
                        onDateSaved: (DateTime value) => field.didChange(value),
                      ),
                    ],
                  );
                }
              );
            },
          ),
          const SizedBox(height: 10),
          FormBuilderField<bool>(
            name: 'terms',
            builder: (FormFieldState field) {
              return CheckboxListTile(
                title: const Text('I Accept the terms and conditions'),
                value: field.value ?? false,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (value) => field.didChange(value),
              );
            },
          ),
          const SizedBox(height: 10),
          FormBuilderField<String?>(
            name: 'name',
            builder: (FormFieldState<dynamic> field) {
              return Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return _kOptions.where((String option) {
                    return option.contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String selection) {
                  field.didChange(selection);
                },
              );
            },
            autovalidateMode: AutovalidateMode.always,
            validator: (valueCandidate) {
              if (valueCandidate?.isEmpty ?? true) {
                return 'This field is required.';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  color: Theme.of(context).colorScheme.secondary,
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    _formKey.currentState!.save();
                    if (_formKey.currentState!.validate()) {
                      logInfo(info: _formKey.currentState!.value.toString());
                    } else {
                      logInfo(info: 'validation failed');
                    }
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: MaterialButton(
                  color: Theme.of(context).colorScheme.secondary,
                  child: const Text(
                    'Reset',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    _formKey.currentState!.reset();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
