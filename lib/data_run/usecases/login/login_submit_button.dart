import 'package:datarun/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class LoginSubmitButton extends StatelessWidget {
  const LoginSubmitButton({
    super.key,
    required this.controller,
    this.onPressed,
  });

  final RoundedLoadingButtonController controller;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final form = ReactiveForm.of(context);
    return FilledButton(
      child: Text(S.of(context).login),
      onPressed: form!.valid ? onPressed : null,
    );
  }
}
