import 'package:mass_pro/sdk/core/common/value_type.dart';
import 'package:mass_pro/utils/mass_utils/utils.dart';

import 'package:mass_pro/form/ui/provider/hint_provider.dart';

class HintProviderImpl implements HintProvider {
  const HintProviderImpl();

  @override
  String provideDateHint(ValueType valueType) {
    switch (valueType) {
      case ValueType.Text:
        return L('enter_text');
      case ValueType.LongText:
        return L('enter_long_text');
      case ValueType.Letter:
        return L('enter_letter');
      case ValueType.Number:
        return L('enter_number');
      case ValueType.UnitInterval:
        return L('enter_unit_interval');
      case ValueType.Percentage:
        return L('enter_percentage');
      case ValueType.Integer:
        return L('enter_number');
      case ValueType.IntegerPositive:
        return L('enter_positive_integer');
      case ValueType.IntegerNegative:
        return L('enter_negative_integer');
      case ValueType.IntegerZeroOrPositive:
        return L('enter_positive_integer_or_zero');
      case ValueType.PhoneNumber:
        return L('enter_phone_number');
      case ValueType.Email:
        return L('enter_email');
      case ValueType.URL:
        return L('enter_url');
      case ValueType.FileResource:
      case ValueType.Coordinate:
      case ValueType.Username:
      case ValueType.TrackerAssociate:
      case ValueType.Age:
      case ValueType.Image:
      case ValueType.Boolean:
      case ValueType.TrueOnly:
        return L('enter_value');
      case ValueType.Time:
        return L('select_time');
      case ValueType.OrganisationUnit:
        return L('choose_ou');
      case ValueType.DateTime:
      case ValueType.Date:
        return L('choose_date');
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
