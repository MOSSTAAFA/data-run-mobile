import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

import '../../../form/model/field_ui_model.dart';
import '../../../form/ui/style/form_ui_color_type.dart';
import '../../../form/ui/style/form_ui_model_style.dart';
import '../../extensions/standard_extensions.dart';

typedef TextChangedListener = void Function(
    [String? value, int? start, int? count, int? after]);

extension TextFormFieldExt on TextField {
  // @BindingAdapter("label_text_color")
  void setLabelTextColor(FormUiModelStyle? style) {
    style?.let((FormUiModelStyle it) => it
        .getColors()[FormUiColorType.FIELD_LABEL_TEXT]
        ?.let((Color color) =>
            decoration?.copyWith(labelStyle: TextStyle(color: color))));
  }

  // @BindingAdapter("input_style")
  void setInputStyle(FieldUiModel? styleItem) {
    styleItem?.let((FieldUiModel uiModel) {
      uiModel.textColor?.let((Color it) => style?.copyWith(color: it));
      uiModel.backGroundColor?.let((Pair<List<int>, Color?> it) =>
          style?.copyWith(backgroundColor: it.second));
    });

    styleItem?.style?.let((FormUiModelStyle it) {
      it.getColors()[FormUiColorType.FIELD_LABEL_TEXT]?.let((Color color) =>
          decoration?.copyWith(
              focusColor: color, hintStyle: TextStyle(color: color)));
    });
  }

// // @BindingAdapter("warning", "error")
// void setWarningOrError(String? warning, String? error) {
//   if (warning != null) {
//     decoration?.copyWith(errorText: warning, errorStyle: ).errorStyle?.copyWith(
//         fontSize: 10,
//         color: convertHexStringToColor('#FF9800') /*, fontFamily: */);
//   } else if (error != null) {
//     decoration?.copyWith(errorText: error).errorStyle?.copyWith(
//         fontSize: 10,
//         color: convertHexStringToColor('#E91E63') /*, fontFamily: */);
//   }
// }

// @BindingAdapter("setOnFocusChangeListener")
// void onFocusChangeListener(FieldUiModel item) {
//   String? value;
//   if(controller?.text != null &&  controller!.text.isNotEmpty) {
//     value = controller?.text;
//   }
//   if (!(focusNode?.hasFocus ?? false) && _valueHasChanged(controller!.text, item.value)) {
//     // _checkAutocompleteRendering(context, item, value);
//   }
// }
//
// bool _valueHasChanged(String? currentValue, String? storedValue) {
//   /// equals(one: Any?, two: Any?) = one == two || (one != null && one == two)
//   return currentValue != storedValue;
// }

}
