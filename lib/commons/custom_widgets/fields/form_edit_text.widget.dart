import 'package:d2_remote/core/common/value_type.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../form/model/field_ui_model.dart';
import '../../../form/model/key_board_action_type.dart';
import '../../../form/model/ui_event_type.dart';
import '../../../form/ui/form_view_model.dart';
import '../../../form/ui/style/form_ui_color_type.dart';
import '../../../form/ui/style/form_ui_model_style.dart';
import '../../../utils/mass_utils/colors.dart';
import '../../extensions/standard_extensions.dart';

/// form_edit_text_custom, form_integer, form_integer_negative
/// form_integer_positive, form_integer_zero, form_letter,
/// form_number, form_percentage, form_phone_number,
/// form_unit_interval, form_url.xml
class FormEditText extends ConsumerStatefulWidget {
  const FormEditText({super.key});

  @override
  ConsumerState<FormEditText> createState() => _FormEditTextState();
}

class _FormEditTextState extends ConsumerState<FormEditText> {
  late final int? _maxLength;
  late final MaxLengthEnforcement? _maxLengthEnforcement;
  late final TextEditingController _fieldController;
  late final FocusNode _focusNode;
  late final TextInputType? _inputType;
  late final TextInputAction? _inputAction;
  late final TextStyle? _labelStyle;
  late final TextStyle? _hintStyle;
  late final IconData? _descIcon;
  late final String? _info;
  late final Color? _focusColor;

  // final _debouncer = Debouncer();

  @override
  Widget build(BuildContext context) {
    final fieldRowItem = ref.watch(fieldRowProvider);
    // final String? error = fieldItem?.error;

    final bool? focused = fieldRowItem?.focused;

    // if (focused) {
    //   _focusNode.requestFocus();
    // }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            initialValue: fieldRowItem?.value,
            textInputAction: _inputAction,
            keyboardType: _inputType,
            controller: _fieldController,
            onChanged: (String value) {
              // _debouncer.run(() {
              fieldRowItem?.onTextChange(value);
              // });
            },
            focusNode: _focusNode,
            enabled: fieldRowItem?.editable,
            maxLength: _maxLength,
            maxLengthEnforcement: _maxLengthEnforcement,
            decoration: InputDecoration(
                label: Row(
                  children: [
                    Expanded(
                        child: Text(
                      fieldRowItem?.formattedLabel ?? '',
                      style: _labelStyle,
                    )),
                    if (_info != null)
                      IconButton(
                        icon:
                            Icon(Icons.info_outline, color: _labelStyle?.color),
                        onPressed: () {
                          fieldRowItem
                              ?.invokeUiEvent(UiEventType.SHOW_DESCRIPTION);
                        },
                      )
                  ],
                ),
                border: const UnderlineInputBorder(),
                suffixIcon:
                    _fieldController.text.isNotEmpty || _focusNode.hasFocus
                        ? IconButton(
                            icon: Icon(
                              Icons.clear,
                              color: _labelStyle?.color,
                            ),
                            onPressed: () {
                              _fieldController.text = '';
                              // _focusNode.unfocus(
                              //     disposition:
                              //         UnfocusDisposition.previouslyFocusedChild);
                              fieldRowItem?.onTextChange(null);
                            },
                          )
                        : _descIcon != null
                            ? Icon(_descIcon, color: _labelStyle?.color)
                            : null,
                hintText: fieldRowItem?.hint,
                hintStyle: _hintStyle,
                errorText: fieldRowItem?.error,
                errorStyle: fieldRowItem?.error != null
                    ? TextStyle(
                        fontSize: 10, color: convertHexStringToColor('#FF9800'))
                    : null,
                focusColor: _focusColor),
          ),
        ),
      ],
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final fieldRowItem = ref.watch(fieldRowProvider);
    switch (fieldRowItem?.valueType) {
      case ValueType.TEXT:
        _maxLength = 50000;
        _maxLengthEnforcement = MaxLengthEnforcement.enforced;
        break;
      case ValueType.LETTER:
        _maxLength = 1;
        _maxLengthEnforcement = MaxLengthEnforcement.enforced;
        break;
      default:
        break;
    }

    _descIcon = fieldRowItem?.style?.getDescriptionIcon();
    _info = fieldRowItem?.description;
    _inputType = _getInputType(fieldRowItem?.valueType);
    _inputAction = _getInputAction(fieldRowItem?.keyboardActionType);
    _labelStyle = _getLabelTextColor(fieldRowItem?.style);
    _hintStyle = _getHintStyle(fieldRowItem);
    _focusColor = _getFocusColor(fieldRowItem);
  }

  @override
  void initState() {
    super.initState();
    _fieldController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _fieldController.dispose();
    // _focusNode.removeListener(onFocusChanged);
    _focusNode.dispose();
    super.dispose();
  }

  TextStyle? _getLabelTextColor(FormUiModelStyle? style) {
    return style?.let((FormUiModelStyle it) => it
        .getColors()[FormUiColorType.FIELD_LABEL_TEXT]
        ?.let((Color color) => TextStyle(color: color)));
  }

  TextStyle? _getInputStyle(FieldUiModel? styleItem) {
    TextStyle? style;
    styleItem?.let((FieldUiModel uiModel) {
      uiModel.textColor?.let((Color it) => style = TextStyle(color: it));
      uiModel.backGroundColor?.let((Pair<List<int>, Color> it) =>
          style = style?.copyWith(backgroundColor: it.second));
    });

    return style;
  }

  TextStyle? _getHintStyle(FieldUiModel? styleItem) {
    TextStyle? style;
    styleItem?.style?.let((FormUiModelStyle it) {
      it
          .getColors()[FormUiColorType.FIELD_LABEL_TEXT]
          ?.let((Color color) => style = TextStyle(color: color));
    });
    return style;
  }

  Color? _getFocusColor(FieldUiModel? styleItem) {
    return styleItem?.style?.let((FormUiModelStyle it) {
      return it
          .getColors()[FormUiColorType.FIELD_LABEL_TEXT]
          ?.let((Color color) => color);
    });
  }

  TextInputType? _getInputType(ValueType? valueType) {
    return when(valueType, {
      ValueType.TEXT: () => TextInputType.text,
      ValueType.LONG_TEXT: () => TextInputType.multiline,
      ValueType.LETTER: () => TextInputType.text,
      ValueType.NUMBER: () =>
          const TextInputType.numberWithOptions(decimal: true, signed: true),
      ValueType.UNIT_INTERVAL: () =>
          const TextInputType.numberWithOptions(decimal: true),
      ValueType.PERCENTAGE: () => TextInputType.number,
      [ValueType.INTEGER_NEGATIVE, ValueType.INTEGER]: () =>
          const TextInputType.numberWithOptions(signed: true),
      [ValueType.INTEGER_POSITIVE, ValueType.INTEGER_ZERO_OR_POSITIVE]: () =>
          TextInputType.number,
      ValueType.PHONE_NUMBER: () => TextInputType.phone,
      ValueType.EMAIL: () => TextInputType.emailAddress,
      ValueType.URL: () => TextInputType.url,
    });
  }

  TextInputAction? _getInputAction(KeyboardActionType? type) {
    if (type != null) {
      return when(type, {
        KeyboardActionType.NEXT: () => TextInputAction.next,
        KeyboardActionType.DONE: () => TextInputAction.done,
        KeyboardActionType.ENTER: () => TextInputAction.none
      });
    }
    return null;
  }
}
