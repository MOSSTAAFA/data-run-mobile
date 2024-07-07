import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/form_field.widget.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';

typedef OnFormStateChanged = void Function(Map<String, dynamic> formValue);

class FormWidget extends ConsumerStatefulWidget {
  const FormWidget(
      {super.key,
      required this.fields,
      this.onFormStateChanged,
      this.autovalidateMode,
      this.initialValue = const <String, dynamic>{},
      this.skipDisabled = false,
      this.enabled = true,
      this.clearValueOnUnregister = false});

  final IMap<String, QFieldModel> fields;
  final OnFormStateChanged? onFormStateChanged;
  final AutovalidateMode? autovalidateMode;
  final Map<String, dynamic> initialValue;
  final bool skipDisabled;
  final bool enabled;
  final bool clearValueOnUnregister;

  @override
  ConsumerState<FormWidget> createState() => FormWidgetState();
}

class FormWidgetState extends ConsumerState<FormWidget> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      onChanged: () {
        widget.onFormStateChanged?.call(_formKey.currentState!.value);
        _formKey.currentState!.save();
      },
      enabled: widget.enabled,
      initialValue: widget.initialValue,
      autovalidateMode: widget.autovalidateMode,
      skipDisabled: widget.skipDisabled,
      clearValueOnUnregister: widget.clearValueOnUnregister,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: widget.fields.entries
              .map(
                (entry) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: FormFieldWidget(
                        key: ValueKey<String>(entry.key),
                        fieldModel: entry.value,
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
