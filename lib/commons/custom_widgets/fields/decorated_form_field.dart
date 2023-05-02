import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DecoratedFormField extends StatefulWidget {
  const DecoratedFormField({
    super.key,
    required this.keyboardType,
    this.controller,
    this.label,
    this.onSavePressed,
    this.autoValidate = false,
    this.autocorrect = false,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.minLines,
    this.maxLines,
    this.onFieldSubmitted,
    this.initialValue,
    this.enabled = true,
    this.readOnly = false,
    this.hint,
    this.suffixIcon,
    this.expands = false,
    this.autofocus = false,
    this.autofillHints,
    this.textAlign = TextAlign.start,
    this.decoration,
    this.focusNode,
    this.suffixIconButton,
    this.icon,
    this.isMoney = false,
    this.isPercent = false,
    this.showClear = true,
    this.inputFormatters,
  });

  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final int? maxLines;
  final int? minLines;
  final bool autoValidate;
  final bool enabled;
  final bool readOnly;
  final bool autocorrect;
  final bool obscureText;
  final bool expands;
  final bool autofocus;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final Icon? suffixIcon;
  final IconButton? suffixIconButton;
  final Iterable<String>? autofillHints;
  final Function(BuildContext)? onSavePressed;
  final TextAlign textAlign;
  final InputDecoration? decoration;
  final FocusNode? focusNode;
  final bool isMoney;
  final bool isPercent;
  final bool showClear;
  final Icon? icon;
  final List<TextInputFormatter>? inputFormatters;

  @override
  _DecoratedFormFieldState createState() => _DecoratedFormFieldState();
}

class _DecoratedFormFieldState extends State<DecoratedFormField> {
  bool _showClear = true;

  @override
  Widget build(BuildContext context) {
    Widget? iconButton = widget.suffixIconButton;

    final bool hasValue = (widget.initialValue ?? '').isNotEmpty ||
        (widget.controller?.text ?? '').isNotEmpty;

    if (_showClear &&
        widget.showClear &&
        hasValue &&
        widget.key == null &&
        widget.controller != null) {
      if (widget.suffixIconButton == null &&
          widget.suffixIcon == null &&
          widget.enabled) {
        iconButton = IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            widget.controller?.text = '';
            setState(() {
              _showClear = false;
            });
          },
        );
      }
    }

    InputDecoration? inputDecoration;
    if (widget.decoration != null) {
      inputDecoration = widget.decoration;
    } else if (widget.label == null && widget.hint == null) {
      inputDecoration = null;
    } else {
      Widget? icon = widget.suffixIcon ?? iconButton;
      if (icon == null) {
        if (widget.isPercent) {
          icon = const Icon(
            MdiIcons.percent,
            size: 16,
          );
        }
      }

      inputDecoration = InputDecoration(
          labelText: widget.label ?? '',
          hintText: widget.hint ?? '',
          icon: widget.icon,
          suffixIcon: icon,
          floatingLabelBehavior:
              (widget.hint ?? '').isNotEmpty && (widget.label ?? '').isEmpty
                  ? FloatingLabelBehavior.always
                  : FloatingLabelBehavior.auto);
    }

    return TextFormField(
      key: ValueKey(widget.label),
      // Enables tests to find fields
      focusNode: widget.focusNode,
      readOnly: widget.readOnly,
      controller: widget.controller,
      autofocus: widget.autofocus,
      decoration: inputDecoration,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      maxLines: widget.expands ? null : widget.maxLines ?? 1,
      minLines: widget.expands ? null : widget.minLines,
      expands: widget.expands,
      autovalidateMode: widget.autoValidate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      autocorrect:
          widget.isMoney || widget.isPercent ? false : widget.autocorrect,
      obscureText: widget.obscureText,
      initialValue: widget.initialValue,
      textInputAction: widget.keyboardType == TextInputType.multiline
          ? TextInputAction.newline
          : TextInputAction.next,
      onChanged: (String value) {
        _showClear = true;
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      inputFormatters: widget.inputFormatters,
      onFieldSubmitted: (String value) {
        if (widget.onFieldSubmitted != null) {
          return widget.onFieldSubmitted!(value);
        } else if (widget.keyboardType == TextInputType.multiline) {
          // return null;
        }
      },
      enabled: widget.enabled,
      autofillHints: widget.autofillHints,
      textAlign: widget.textAlign,
    );
  }
}
