import 'package:flutter/material.dart';

import '../../../main/l10n/app_localizations.dart';
import 'decorated_form_field.dart';

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
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _isPasswordObscured = true;

  bool _validatePassword(String value) {
    const pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    final regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.of(context)!.localized!;

    return DecoratedFormField(
      key: ValueKey(widget.labelText ?? localization.password),
      controller: widget.controller,
      readOnly: widget.readOnly,
      onSavePressed: widget.onSavePressed,
      autocorrect: false,
      autoValidate: widget.autoValidate,
      decoration: InputDecoration(
        labelText: widget.labelText ?? localization.password,
        suffixIcon: IconButton(
          alignment: Alignment.bottomCenter,
          tooltip: _isPasswordObscured
              ? localization.showPassword
              : localization.hidePassword,
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
      validator: (value) {
        if (!widget.validate) {
          return null;
        }

        if (value == null || value.isEmpty || value.trim().isEmpty) {
          return widget.newPassword
              ? null
              : localization.pleaseEnterYourPassword;
        }

        if (!widget.newPassword) {
          return null;
        }

        if (value.length < 4) {
          return localization.passwordIsTooShort;
        }

        if (!_validatePassword(value)) {
          return localization.passwordIsTooEasy;
        }

        return null;
      },
      obscureText: _isPasswordObscured,
      keyboardType: TextInputType.visiblePassword,
      onChanged: widget.onChanged,
      autofillHints: widget.validate
          ? [
              widget.newPassword
                  ? AutofillHints.newPassword
                  : AutofillHints.password,
            ]
          : null,
    );
  }
}
