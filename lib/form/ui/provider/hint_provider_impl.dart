import 'package:d2_remote/core/common/value_type.dart';

import '../../../main.dart';
import 'hint_provider.dart';

class HintProviderImpl implements HintProvider {
  const HintProviderImpl();

  @override
  String provideDateHint(ValueType valueType) {
    final localization = navigatorKey.localization;
    switch (valueType) {
      case ValueType.TEXT:
        return localization.lookup('enter_text');
      case ValueType.LONG_TEXT:
        return localization.lookup('enter_long_text');
      case ValueType.LETTER:
        return localization.lookup('enter_letter');
      case ValueType.NUMBER:
        return localization.lookup('enter_number');
      case ValueType.UNIT_INTERVAL:
        return localization.lookup('enter_unit_interval');
      case ValueType.PERCENTAGE:
        return localization.lookup('enter_percentage');
      case ValueType.INTEGER:
        return localization.lookup('enter_number');
      case ValueType.INTEGER_POSITIVE:
        return localization.lookup('enter_positive_integer');
      case ValueType.INTEGER_NEGATIVE:
        return localization.lookup('enter_negative_integer');
      case ValueType.INTEGER_ZERO_OR_POSITIVE:
        return localization.lookup('enter_positive_integer_or_zero');
      case ValueType.PHONE_NUMBER:
        return localization.lookup('enter_phone_number');
      case ValueType.EMAIL:
        return localization.lookup('enter_email');
      case ValueType.URL:
        return localization.lookup('enter_url');
      case ValueType.FILE_RESOURCE:
      case ValueType.COORDINATE:
      case ValueType.USERNAME:
      case ValueType.TRACKER_ASSOCIATE:
      case ValueType.AGE:
      case ValueType.IMAGE:
      case ValueType.BOOLEAN:
      case ValueType.TRUE_ONLY:
        return localization.lookup('enter_value');
      case ValueType.TIME:
        return localization.lookup('select_time');
      case ValueType.ORGANISATION_UNIT:
        return localization.lookup('choose_ou');
      case ValueType.DATETIME:
      case ValueType.DATE:
        return localization.lookup('choose_date');
      case ValueType.REFERENCE:
        return '';
      case ValueType.GEOJSON:
        return '';
    }
  }
}
