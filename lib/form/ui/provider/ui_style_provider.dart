import 'package:mass_pro/sdk/core/common/value_type.dart';

import '../style/form_ui_model_style.dart';

abstract class UiStyleProvider {
  const UiStyleProvider();

  FormUiModelStyle provideStyle(ValueType valueType);
}
