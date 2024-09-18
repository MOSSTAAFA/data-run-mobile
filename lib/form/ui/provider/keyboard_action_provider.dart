import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';

import 'package:mass_pro/form/model/key_board_action_type.dart';

abstract class KeyboardActionProvider {
  KeyboardActionType? provideKeyboardAction(ValueType valueType);
}
