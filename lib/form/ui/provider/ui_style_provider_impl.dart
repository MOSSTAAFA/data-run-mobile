import 'package:mass_pro/sdk/core/common/value_type.dart';

import 'package:mass_pro/form/ui/style/basic_form_ui_model_style.dart';
import 'package:mass_pro/form/ui/style/form_ui_color_factory.dart';
import 'package:mass_pro/form/ui/style/form_ui_model_style.dart';
import 'package:mass_pro/form/ui/style/long_text_decorator.dart';
import 'package:mass_pro/form/ui/provider/ui_style_provider.dart';

class UiStyleProviderImpl implements UiStyleProvider {
  const UiStyleProviderImpl(
      {required this.colorFactory, required this.longTextColorFactory});

  final FormUiColorFactory colorFactory;
  final FormUiColorFactory longTextColorFactory;

  @override
  FormUiModelStyle provideStyle(ValueType valueType) {
    final FormUiModelStyle style =
        BasicFormUiModelStyle(colorFactory, valueType);

    if (valueType == ValueType.LongText) {
      return LongTextDecorator(style, longTextColorFactory);
    } else {
      return style;
    }
  }
}
