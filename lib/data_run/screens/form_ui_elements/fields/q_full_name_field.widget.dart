import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/fields/q_field_validator.dart';
import 'package:mass_pro/data_run/screens/form/model/q_field.model.dart';
import 'package:mass_pro/generated/l10n.dart';

class QFullNameField extends StatefulWidget {
  const QFullNameField({
    super.key,
    required this.fieldModel,
  });

  final QFieldModel fieldModel;

  @override
  _QFullNameFieldState createState() => _QFullNameFieldState();
}

class _QFullNameFieldState extends State<QFullNameField> {
  late final TextEditingController _firstNameController;
  late final TextEditingController _middleNameController;
  late final TextEditingController _lastNameController;

  late final FocusNode _firstNameFocus;
  late final FocusNode _middleNameFocus;
  late final FocusNode _lastNameFocus;

  @override
  void initState() {
    super.initState();

    _firstNameController = TextEditingController();
    _middleNameController = TextEditingController();
    _lastNameController = TextEditingController();

    _firstNameFocus = FocusNode();
    _middleNameFocus = FocusNode();
    _lastNameFocus = FocusNode();

    _firstNameController.addListener(_notifyChange);
    _middleNameController.addListener(_notifyChange);
    _lastNameController.addListener(_notifyChange);

    _setInitialValues(widget.fieldModel.value);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _firstNameFocus.dispose();
    _middleNameFocus.dispose();
    _lastNameFocus.dispose();
    super.dispose();
  }

  void _setInitialValues(String? initialValue) {
    if (initialValue != null && initialValue.trim().isNotEmpty) {
      final parts = initialValue.trim().split(RegExp(r'\s+'));

      if (parts.isNotEmpty) _firstNameController.text = parts[0];
      if (parts.length > 1) _middleNameController.text = parts[1];
      if (parts.length > 2)
        _lastNameController.text = parts.sublist(2).join(' ');
    }
  }

  // void _handleInput(
  //   TextEditingController controller,
  //   FocusNode currentFocus,
  //   FocusNode nextFocus,
  // ) {
  //   if (controller.text.endsWith(' ')) {
  //     controller.text = controller.text.trim();
  //     FocusScope.of(context).requestFocus(nextFocus);
  //
  //     if (nextFocus == _middleNameFocus &&
  //         _middleNameController.text.isNotEmpty) {
  //       _middleNameController.selection = TextSelection(
  //         baseOffset: 0,
  //         extentOffset: _middleNameController.text.length,
  //       );
  //     } else if (nextFocus == _lastNameFocus &&
  //         _lastNameController.text.isNotEmpty) {
  //       _lastNameController.selection = TextSelection(
  //         baseOffset: 0,
  //         extentOffset: _lastNameController.text.length,
  //       );
  //     }
  //   }
  // }

  void _notifyChange() {
    try {
      final names = [
        _firstNameController.text.trim(),
        _middleNameController.text.trim(),
        _lastNameController.text.trim(),
      ].where((name) => name.isNotEmpty).join(' ');

      FormBuilder.of(context)
          ?.fields['${widget.fieldModel.uid}']
          ?.didChange(names);
    } catch (error) {
      debugPrint('Error in _notifyChange: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final textDirection = Directionality.of(context);

    return FormBuilderField<String?>(
      key: ValueKey(widget.fieldModel.uid),
      name: widget.fieldModel.uid,
      initialValue: widget.fieldModel.value,
      validator: QFieldValidators.getValidators(widget.fieldModel),
      onChanged: (String? value) {
        widget.fieldModel.onTextChange(value.toString());
      },
      enabled: widget.fieldModel.isEditable,
      builder: (FormFieldState<String?> field) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.fieldModel.label,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Row(
                children: [
                  Expanded(
                    child: FormBuilderTextField(
                        name: '${widget.fieldModel.uid}_first_name',
                        enabled: widget.fieldModel.isEditable,
                        controller: _firstNameController,
                        focusNode: _firstNameFocus,
                        textDirection: textDirection,
                        onChanged: (value) {
                          // _handleInput(_firstNameController, _firstNameFocus,
                          //     _middleNameFocus);
                        },
                        decoration: InputDecoration(
                            labelText: S.of(context).firstName)),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: FormBuilderTextField(
                        name: '${widget.fieldModel.uid}_middle_name',
                        enabled: widget.fieldModel.isEditable,
                        controller: _middleNameController,
                        focusNode: _middleNameFocus,
                        textDirection: textDirection,
                        onChanged: (value) {
                          // _handleInput(_middleNameController, _middleNameFocus,
                          //     _lastNameFocus);
                        },
                        decoration: InputDecoration(
                            labelText: S.of(context).middleName)),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: FormBuilderTextField(
                        name: '${widget.fieldModel.uid}_last_name',
                        enabled: widget.fieldModel.isEditable,
                        validator: FormBuilderValidators.required(),
                        controller: _lastNameController,
                        focusNode: _lastNameFocus,
                        textDirection: textDirection,
                        onChanged: (value) {
                          // _handleInput(_lastNameController, _lastNameFocus,
                          //     FocusNode()); // No next focus
                        },
                        decoration: InputDecoration(
                          labelText: S.of(context).lastName,
                        )),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
