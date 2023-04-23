import 'package:d2_remote/core/common/value_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../form/model/field_ui_model.dart';
import '../../../form/model/key_board_action_type.dart';
import '../../../form/model/ui_event_type.dart';
import '../../../form/ui/style/form_ui_color_type.dart';
import '../../../form/ui/style/form_ui_model_style.dart';
import '../../../utils/mass_utils/colors.dart';
import '../../extensions/standard_extensions.dart';

/// form_edit_text_custom, form_integer, form_integer_negative
/// form_integer_positive, form_integer_zero, form_letter
class FormEditText extends StatefulWidget {
  const FormEditText({super.key});

  @override
  State<FormEditText> createState() => _FormEditTextState();
}

class _FormEditTextState extends State<FormEditText> {
  int? _maxLength;
  MaxLengthEnforcement? _maxLengthEnforcement;
  late final TextEditingController _fieldController;
  late final FocusNode _focusNode;

  @override
  Widget build(BuildContext context) {
    final FieldUiModel item = context.watch<FieldUiModel>();

    final IconData? descIcon = item.style?.getDescriptionIcon();
    final String? info = item.description;
    final bool focused = item.focused;

    if (focused) {
      _focusNode.requestFocus();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            textInputAction: getInputAction(item.keyboardActionType),
            keyboardType: getInputType(item.valueType),
            controller: _fieldController,
            focusNode: _focusNode,
            enabled: item.editable,
            maxLength: _maxLength,
            maxLengthEnforcement: _maxLengthEnforcement,
            decoration: InputDecoration(
                label: Row(
                  children: [
                    Expanded(
                        child: Text(
                      item.formattedLabel,
                      style: getLabelTextColor(item.style),
                    )),
                    if (info != null)
                      IconButton(
                        icon: const Icon(Icons.info_outline),
                        onPressed: () {
                          item.invokeUiEvent(UiEventType.SHOW_DESCRIPTION);
                        },
                      )
                  ],
                ),
                border: const UnderlineInputBorder(),
                prefixIcon: descIcon != null ? Icon(descIcon) : null,
                hintText: item.hint,
                hintStyle: getHintStyle(item),
                errorText: item.error,
                errorStyle: item.error != null
                    ? TextStyle(
                        fontSize: 10, color: convertHexStringToColor('#FF9800'))
                    : null,
                focusColor: getFocusColor(item)),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _fieldController = TextEditingController();
    _focusNode = FocusNode();
    switch (context.read<FieldUiModel>().valueType) {
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
    // ..addListener(onFocusChanged);

    // Start listening to changes.
    _fieldController.addListener(_valueChangedListener);
  }

  void _valueChangedListener() {
    context.read<FieldUiModel>().setValue(_fieldController.text);
    context.read<FieldUiModel>().onTextChange(_fieldController.text);
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

  TextStyle? getLabelTextColor(FormUiModelStyle? style) {
    return style?.let((FormUiModelStyle it) => it
        .getColors()[FormUiColorType.FIELD_LABEL_TEXT]
        ?.let((Color color) => TextStyle(color: color)));
  }

  // @BindingAdapter("input_style")
  TextStyle? getInputStyle(FieldUiModel? styleItem) {
    TextStyle? style;
    styleItem?.let((FieldUiModel uiModel) {
      uiModel.textColor?.let((Color it) => style = TextStyle(color: it));
      uiModel.backGroundColor
          ?.let((it) => style = style?.copyWith(backgroundColor: it.second));
    });

    return style;
  }

  TextStyle? getHintStyle(FieldUiModel? styleItem) {
    TextStyle? style;
    styleItem?.style?.let((FormUiModelStyle it) {
      it
          .getColors()[FormUiColorType.FIELD_LABEL_TEXT]
          ?.let((Color color) => style = TextStyle(color: color));
    });
    return style;
  }

  Color? getFocusColor(FieldUiModel? styleItem) {
    return styleItem?.style?.let((FormUiModelStyle it) {
      return it
          .getColors()[FormUiColorType.FIELD_LABEL_TEXT]
          ?.let((Color color) => color);
    });
  }

  TextInputType? getInputType(ValueType? valueType) {
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

  TextInputAction? getInputAction(KeyboardActionType? type) {
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
