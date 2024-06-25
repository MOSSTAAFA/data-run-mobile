import 'package:mass_pro/sdk/core/common/value_type.dart';
import 'package:mass_pro/utils/navigator_key.dart';

import 'hint_provider.dart';

class HintProviderImpl implements HintProvider {
  const HintProviderImpl();

  @override
  String provideDateHint(ValueType valueType) {
    final localization = navigatorKey.localization;
    switch (valueType) {
      case ValueType.Text:
        return localization.lookup('enter_text');
      case ValueType.LongText:
        return localization.lookup('enter_long_text');
      case ValueType.Letter:
        return localization.lookup('enter_letter');
      case ValueType.Number:
        return localization.lookup('enter_number');
      case ValueType.UnitInterval:
        return localization.lookup('enter_unit_interval');
      case ValueType.Percentage:
        return localization.lookup('enter_percentage');
      case ValueType.Integer:
        return localization.lookup('enter_number');
      case ValueType.IntegerPositive:
        return localization.lookup('enter_positive_integer');
      case ValueType.IntegerNegative:
        return localization.lookup('enter_negative_integer');
      case ValueType.IntegerZeroOrPositive:
        return localization.lookup('enter_positive_integer_or_zero');
      case ValueType.PhoneNumber:
        return localization.lookup('enter_phone_number');
      case ValueType.Email:
        return localization.lookup('enter_email');
      case ValueType.URL:
        return localization.lookup('enter_url');
      case ValueType.FileResource:
      case ValueType.Coordinate:
      case ValueType.Username:
      case ValueType.TrackerAssociate:
      case ValueType.Age:
      case ValueType.Image:
      case ValueType.Boolean:
      case ValueType.TrueOnly:
        return localization.lookup('enter_value');
      case ValueType.Time:
        return localization.lookup('select_time');
      case ValueType.OrganisationUnit:
        return localization.lookup('choose_ou');
      case ValueType.DateTime:
      case ValueType.Date:
        return localization.lookup('choose_date');
      case ValueType.Reference:
        return '';
      case ValueType.GeoJson:
        return '';
      case ValueType.SelectMulti:
        return '';
      case ValueType.SelectOne:
        return '';
      default:
        return '';
    }
  }
}
