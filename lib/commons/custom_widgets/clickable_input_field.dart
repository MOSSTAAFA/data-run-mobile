import 'package:flutter/material.dart';

import 'fields/decorated_form_field.dart';

class ClickableInputField extends StatefulWidget {
  const ClickableInputField({
    super.key,
    this.selectedValue,

    /// Temporary for displaying orgUnit Name
    this.labelText,
    this.allowClearing,
    this.message,
    this.onPressed,
    this.onClear,
    required this.iconButtonIcon,
  });

  final String? labelText;
  final String? message;

  final String? selectedValue;
  final bool? allowClearing;
  final VoidCallback? onPressed;
  final VoidCallback? onClear;
  final IconData iconButtonIcon;

  @override
  State<ClickableInputField> createState() => _ClickableInputFieldState();
}

class _ClickableInputFieldState extends State<ClickableInputField> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String? label = widget.labelText;
    if (widget.message != null && widget.selectedValue == null) {
      label = '$label • ${widget.message}';
    }

    return DecoratedFormField(
      readOnly: true,
      controller: _textController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: /* _pendingValue ?? */ label ?? '',
        suffixIcon: widget.allowClearing == true && widget.selectedValue != null
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _textController.text = '';
                },
              )
            : IconButton(
                icon: Icon(widget.iconButtonIcon),
                onPressed: widget.onPressed,
              ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    if (widget.selectedValue != null) {
      _textController.text = widget.selectedValue!;
    } else {
      _textController.text = '';
    }

    super.didChangeDependencies();
  }
}
