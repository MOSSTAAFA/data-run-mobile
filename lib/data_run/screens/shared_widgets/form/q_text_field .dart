import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.extension.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/form/q_field_validator.dart';
import 'package:mass_pro/form/ui/intent/form_intent.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';

class QTextField extends StatefulWidget {
  const QTextField({super.key, required this.fieldModel});

  final QFieldModel fieldModel;

  @override
  State<QTextField> createState() => _QTextFieldState();
}

class _QTextFieldState extends State<QTextField> {
  late final FocusNode _focusNode;

  //
  // onClearButton
  // _fieldController.clear();
  //    _focusNode.unfocus(
  //       disposition:
  //        UnfocusDisposition.previouslyFocusedChild);
  //        widget.item?.onTextChange(null);
  //        widget.item?.onClear();
  @override
  void initState() {
    _focusNode = FocusNode();
    _focusNode.addListener(_focusListener);
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.removeListener(_focusListener);
    _focusNode.dispose();
    super.dispose();
  }

  void _focusListener() {
    final valid =
        FormBuilder.of(context)?.fields[widget.fieldModel.uid]?.valueIsValid;
    if (_focusNode.hasFocus) {
      debugPrint('valid: $valid');
      widget.fieldModel.onFieldClick();
      // widget.fieldModel.onSave(
      //     FormBuilder.of(context)?.fields[widget.fieldModel.uid]?.value);
    }

    if (!_focusNode.hasFocus) {
      debugPrint('valid: $valid');
      if (valid ?? true) {
        widget.fieldModel.invokeIntent(FormIntent.onSave(
            uid: widget.fieldModel.uid,
            value: widget.fieldModel.value,
            valueType: widget.fieldModel.valueType,
            fieldMask: widget.fieldModel.fieldMask));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      key: ValueKey(widget.fieldModel.uid),
      textInputAction: widget.fieldModel.inputAction,
      focusNode: _focusNode,
      name: widget.fieldModel.uid,
      initialValue: widget.fieldModel.value,
      enabled: widget.fieldModel.isEditable,
      validator: QFieldValidators.getValidators(widget.fieldModel),
      maxLength: widget.fieldModel.maxLength,
      maxLines: widget.fieldModel.valueType == ValueType.Letter ? 7 : null,
      decoration: InputDecoration(
        labelText: widget.fieldModel.label,
        labelStyle: Theme.of(context).textTheme.labelLarge,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
        hintText: widget.fieldModel.hint,
        errorText: widget.fieldModel.error,
        suffixIcon: (widget.fieldModel.value ?? '').isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  FormBuilder.of(context)
                      ?.fields[widget.fieldModel.uid]
                      ?.didChange(null);
                },
              )
            : null,
      ),
      onChanged: widget.fieldModel.onTextChange,
      keyboardType: widget.fieldModel.inputType,
    );
  }
}
