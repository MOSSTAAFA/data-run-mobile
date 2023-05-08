import 'package:d2_remote/core/common/value_type.dart';
import 'package:flutter/material.dart';

import '../../../form/model/field_ui_model.dart';
import '../../../form/model/key_board_action_type.dart';
import '../../../form/ui/style/form_ui_color_type.dart';
import '../../../form/ui/style/form_ui_model_style.dart';
import '../../../main/l10n/app_localizations.dart';
import '../../extensions/standard_extensions.dart';
import '../buttons/app_text_button.dart';

/// form_edit_text_custom, form_integer, form_integer_negative
/// form_integer_positive, form_integer_zero, form_letter,
/// form_number, form_percentage, form_phone_number,
/// form_unit_interval, form_url.xml
class FormSection extends StatefulWidget {
  const FormSection(
      {super.key,
      required this.children,
      required this.itemBuilder,
      required this.itemCount});

  final List<Widget> children;

  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;

  @override
  State<FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: AlignmentDirectional.centerEnd,
            child: AppTextButton(
                label: AppLocalization.of(context)!.lookup('next')),
          ),
        ),
        Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          elevation: 2,
          margin: const EdgeInsets.all(12.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpansionTile(
              backgroundColor: Colors.white,
              title: const Text('Titel'),
              trailing: const SizedBox(),
              children: List<Widget>.generate(widget.itemCount, (int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: widget.itemBuilder(context, index),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  TextStyle? _getLabelTextColor(FormUiModelStyle? style) {
    return style?.let((FormUiModelStyle it) => it
        .getColors()[FormUiColorType.FIELD_LABEL_TEXT]
        ?.let((Color color) => TextStyle(color: color)));
  }

  // @BindingAdapter("input_style")
  TextStyle? _getInputStyle(FieldUiModel? styleItem) {
    TextStyle? style;
    styleItem?.let((FieldUiModel uiModel) {
      uiModel.textColor?.let((Color it) => style = TextStyle(color: it));
      uiModel.backGroundColor
          ?.let((it) => style = style?.copyWith(backgroundColor: it.second));
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
