import 'package:d2_remote/core/common/value_type.dart';

import '../style/basic_form_ui_model_style.dart';
import '../style/form_ui_color_factory.dart';
import '../style/form_ui_model_style.dart';
import '../style/long_text_decorator.dart';
import 'ui_style_provider.dart';

class UiStyleProviderImpl implements UiStyleProvider {
  const UiStyleProviderImpl(
      {required this.colorFactory, required this.longTextColorFactory});

  final FormUiColorFactory colorFactory;
  final FormUiColorFactory longTextColorFactory;

  @override
  FormUiModelStyle provideStyle(ValueType valueType) {
    final FormUiModelStyle style =
        BasicFormUiModelStyle(colorFactory, valueType);

    if (valueType == ValueType.LONG_TEXT) {
      return LongTextDecorator(style, longTextColorFactory);
    } else {
      return style;
    }
  }
}
