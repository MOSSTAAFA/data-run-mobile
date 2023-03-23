import 'package:d2_remote/core/common/value_type.dart';
import 'package:mass_pro/form/ui/provider/ui_style_provider.dart';
import 'package:mass_pro/form/ui/style/basic_form_ui_model_style.dart';
import 'package:mass_pro/form/ui/style/form_ui_color_factory.dart';
import 'package:mass_pro/form/ui/style/form_ui_model_style.dart';
import 'package:mass_pro/form/ui/style/long_text_decorator.dart';

class UiStyleProviderImpl implements UiStyleProvider {
  final FormUiColorFactory colorFactory;
  final FormUiColorFactory longTextColorFactory;

  const UiStyleProviderImpl({required this.colorFactory, required this.longTextColorFactory});

  @override
  FormUiModelStyle provideStyle(ValueType valueType) {
    final FormUiModelStyle style = BasicFormUiModelStyle(colorFactory, valueType);

    if (valueType == ValueType.LONG_TEXT) {
      return LongTextDecorator(style, longTextColorFactory);
    } else {
      return style;
    }
  }
}
