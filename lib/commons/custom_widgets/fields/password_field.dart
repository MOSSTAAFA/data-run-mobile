import 'package:flutter/material.dart';
import 'package:mass_pro/generated/l10n.dart';
import 'package:mass_pro/utils/mass_utils/utils.dart';

import 'package:mass_pro/commons/custom_widgets/fields/decorated_form_field.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField(
      {super.key,
      this.controller,
      this.autoValidate = false,
      this.newPassword = true,
      this.validate = true,
      this.onSavePressed,
      this.labelText,
      this.onChanged,
      this.readOnly = false});

  final TextEditingController? controller;
  final Function(BuildContext)? onSavePressed;
  final bool autoValidate;
  final bool newPassword;
  final bool validate;
  final bool readOnly;
  final String? labelText;
  final ValueChanged<String>? onChanged;

  @override
  PasswordFormFieldState createState() => PasswordFormFieldState();
}

class PasswordFormFieldState extends State<PasswordFormField> {
  bool _isPasswordObscured = true;

  bool _validatePassword(String value) {
    const String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    final RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedFormField(
      key: ValueKey(widget.labelText ?? L('password')),
      controller: widget.controller,
      readOnly: widget.readOnly,
      onSavePressed: widget.onSavePressed,
      autocorrect: false,
      autoValidate: widget.autoValidate,
      decoration: InputDecoration(
        labelText: widget.labelText ?? L('password'),
        suffixIcon: IconButton(
          alignment: Alignment.bottomCenter,
          tooltip: _isPasswordObscured
              ? S.of(context).showPassword
              : S.of(context).hidePassword,
          icon: Icon(
            _isPasswordObscured ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _isPasswordObscured = !_isPasswordObscured;
            });
          },
        ),
      ),
      validator: (String? value) {
        if (!widget.validate) {
          return null;
        }

        if (value == null || value.isEmpty || value.trim().isEmpty) {
          return widget.newPassword
              ? null
              : L('pleaseEnterYourPassword');
        }

        if (!widget.newPassword) {
          return null;
        }

        if (value.length < 4) {
          return L('passwordIsTooShort');
        }

        if (!_validatePassword(value)) {
          return L('passwordIsTooEasy');
        }

        return null;
      },
      obscureText: _isPasswordObscured,
      keyboardType: TextInputType.visiblePassword,
      onChanged: widget.onChanged,
      autofillHints: widget.validate
          ? <String>[
              widget.newPassword
                  ? AutofillHints.newPassword
                  : AutofillHints.password,
            ]
          : null,
    );
  }
}
