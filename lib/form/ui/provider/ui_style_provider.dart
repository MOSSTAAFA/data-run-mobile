import 'package:d2_remote/core/common/value_type.dart';

import '../style/form_ui_model_style.dart';

abstract class UiStyleProvider {
  const UiStyleProvider();

  FormUiModelStyle provideStyle(ValueType valueType);
}
