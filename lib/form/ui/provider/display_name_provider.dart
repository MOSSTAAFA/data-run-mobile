import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';

abstract class DisplayNameProvider {
  Future<String?> provideDisplayName(
      [ValueType? valueType, String? value, String? optionSet]);
}
