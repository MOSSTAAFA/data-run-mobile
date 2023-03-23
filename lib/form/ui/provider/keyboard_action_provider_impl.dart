import 'package:d2_remote/core/common/value_type.dart';
import 'package:mass_pro/form/model/key_board_action_type.dart';
import 'package:mass_pro/form/ui/provider/keyboard_action_provider.dart';

class KeyboardActionProviderImpl implements KeyboardActionProvider {
  const KeyboardActionProviderImpl();

  @override
  KeyboardActionType? provideKeyboardAction(ValueType valueType) {
    switch (valueType) {
      case ValueType.LONG_TEXT:
        return KeyboardActionType.ENTER;
      default:
        return KeyboardActionType.NEXT;
    }
  }
}
