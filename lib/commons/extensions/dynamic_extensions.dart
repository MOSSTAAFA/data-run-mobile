
import 'package:mass_pro/commons/logging/mp_utils.dart';

extension IsNullDynamicExtension on dynamic {
  void isNull<T>(T? value, String message) {
    if (value == null) {
      throw Exception(message);
    }
  }
}
