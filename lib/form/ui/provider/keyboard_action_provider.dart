import 'package:mass_pro/sdk/core/common/value_type.dart';

import '../../model/key_board_action_type.dart';

abstract class KeyboardActionProvider {
  KeyboardActionType? provideKeyboardAction(ValueType valueType);
}
