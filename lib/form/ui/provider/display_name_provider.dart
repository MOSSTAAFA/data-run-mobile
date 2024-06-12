import 'package:mass_pro/sdk/core/common/value_type.dart';

abstract class DisplayNameProvider {
  Future<String?> provideDisplayName(
      [ValueType? valueType, String? value, String? optionSet]);
}
