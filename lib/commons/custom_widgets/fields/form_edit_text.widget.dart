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

  // final _debouncer = Debouncer();

  @override
  Widget build(BuildContext context) {
    final fieldRowItem = ref.watch(fieldRowProvider);
    // final String? error = fieldItem?.error;

    final bool? focused = fieldRowItem?.focused;

    if (focused ?? false) {
      _focusNode.requestFocus();
    }

    return Padding(
      // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      padding: EdgeInsets.zero,
      child: TextFormField(
        // initialValue: fieldRowItem?.value ?? '',
        textInputAction: _getInputAction(fieldRowItem?.keyboardActionType),
        keyboardType:  _getInputType(fieldRowItem?.valueType),
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
        style: _getInputStyle(fieldRowItem),
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: fieldRowItem?.formattedLabel ?? '',
            suffix: _fieldController.text.isNotEmpty
                ? IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: _getLabelTextColor(fieldRowItem?.style)?.color,
                    ),
                    onPressed: () {
                      _fieldController.text = '';
                      _focusNode.unfocus(
                          disposition:
                              UnfocusDisposition.previouslyFocusedChild);
                      fieldRowItem?.onTextChange(null);
                    },
                  )
                : null,
            icon: fieldRowItem?.style?.getDescriptionIcon() != null
                ? IconButton(
                    icon: Icon(
                      fieldRowItem?.style?.getDescriptionIcon(),
                      color: _getLabelTextColor(fieldRowItem?.style)?.color,
                    ),
                    onPressed: () {
                      _fieldController.text = '';
                      // show description
                    },
                  )
                : null,
            border: const UnderlineInputBorder(),
            suffixIcon: fieldRowItem?.description != null
                ? IconButton(
                    icon: Icon(Icons.info_outline, color: _getLabelTextColor(fieldRowItem?.style)?.color),
                    onPressed: () {
                      fieldRowItem?.invokeUiEvent(UiEventType.SHOW_DESCRIPTION);
                    },
                  )
                : null,
            hintText: fieldRowItem?.hint,
            hintStyle:  _getHintStyle(fieldRowItem),
            errorText: fieldRowItem?.error,
            errorStyle: fieldRowItem?.error != null
                ? TextStyle(
                    fontSize: 10, color: convertHexStringToColor('#FF9800'))
                : null,
            focusColor: _getFocusColor(fieldRowItem)),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fieldController.text = ref.read(fieldRowProvider)?.value ?? '';
  }

  @override
  void initState() {
    final fieldRowItem = ref.read(fieldRowProvider);
    _fieldController = TextEditingController(text: fieldRowItem?.value);
    _focusNode = FocusNode();

    switch (fieldRowItem?.valueType) {
      case ValueType.TEXT:
        _maxLength = 500;
        _maxLengthEnforcement = MaxLengthEnforcement.enforced;
        break;
      case ValueType.LETTER:
        _maxLength = 1;
        _maxLengthEnforcement = MaxLengthEnforcement.enforced;
        break;
      case ValueType.LONG_TEXT:
        _maxLength = 50000;
        _maxLengthEnforcement = MaxLengthEnforcement.enforced;
        break;
      default:
        _maxLength = 250;
        _maxLengthEnforcement = MaxLengthEnforcement.none;
        break;
    }

    // _descIcon = fieldRowItem?.style?.getDescriptionIcon();
    // _info = fieldRowItem?.description;
    // _inputType = _getInputType(fieldRowItem?.valueType);
    // _inputAction = _getInputAction(fieldRowItem?.keyboardActionType);
    // _labelStyle = _getLabelTextColor(fieldRowItem?.style);
    // _hintStyle = _getHintStyle(fieldRowItem);
    // _focusColor = _getFocusColor(fieldRowItem);
    super.initState();
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
      uiModel.backGroundColor?.let((Pair<List<int>, Color?> it) =>
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
