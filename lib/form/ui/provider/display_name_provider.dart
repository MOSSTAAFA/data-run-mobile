import 'package:d2_remote/core/common/value_type.dart';

abstract class DisplayNameProvider {
  Future<String?> provideDisplayName(
      [ValueType? valueType, String? value, String? optionSet]);
}
