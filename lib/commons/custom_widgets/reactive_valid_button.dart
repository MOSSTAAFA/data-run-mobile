import 'package:datarun/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class ReactiveValidButton extends StatelessWidget {
  const ReactiveValidButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
  });

  final Widget? icon;
  final Widget label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final form = ReactiveForm.of(context);
    if (icon != null) {
      return ElevatedButton.icon(
        onPressed: form!.valid ? onPressed : null,
        label: label,
        icon: icon,
      );
    }

    return FilledButton(
      child: label,
      onPressed: form!.valid ? onPressed : null,
    );
  }
}
