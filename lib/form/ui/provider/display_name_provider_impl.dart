import 'package:d2_remote/core/common/value_type.dart';

import '../../../commons/date/date_utils.dart';
import '../../../commons/extensions/date_format_extensions.dart';
import '../../data/metadata/option_set_configuration.dart';
import '../../data/metadata/org_unit_configuration.dart';
import 'display_name_provider.dart';

class DisplayNameProviderImpl implements DisplayNameProvider {
  const DisplayNameProviderImpl(
      this.optionSetConfiguration, this.orgUnitConfiguration);

  final OptionSetConfiguration optionSetConfiguration;
  final OrgUnitConfiguration orgUnitConfiguration;

  @override
  Future<String?> provideDisplayName(
      [ValueType? valueType, String? value, String? optionSet]) async {
    //   return value?.let {
    //     optionSet?.let { optionSetUid ->
    //   return getOptionSetValue(value, optionSetUid)
    //   } ?: getValueTypeValue(value, valueType)
    // }
    if (value != null) {
      if (optionSet != null) {
        final String? v = await _getOptionSetValue(value, optionSet);
        return v ?? await _getValueTypeValue(value, valueType);
      }
      return _getValueTypeValue(value, valueType);
    }

    return value;
  }

  Future<String?> _getOptionSetValue(String value, String optionSet) async {
    final String? displayNameByCode = await optionSetConfiguration
        .optionInDataSetByCode(optionSet, value)
        .then((option) => option?.displayName);
    if (displayNameByCode != null) {
      return displayNameByCode;
    }

    final String? displayNameByName = await optionSetConfiguration
        .optionInDataSetByName(optionSet, value)
        .then((option) => option?.displayName);

    if (displayNameByName != null) {
      return displayNameByName;
    }

    return value;
  }

  Future<String?> _getValueTypeValue(String value, ValueType? valueType) async {
    switch (valueType) {
      case ValueType.ORGANISATION_UNIT:
        return orgUnitConfiguration
            .orgUnitByUid(value)
            .then((orgUnit) => orgUnit?.displayName ?? value);
      case ValueType.DATE:
        return DateUtils.uiDateFormat()
            .format(DateUtils.oldUiDateFormat().parse(value));
      case ValueType.DATETIME:
        return DateUtils.dateTimeFormat().format(
            DateUtils.databaseDateFormatNoSeconds().parseOrNull(value) ??
                DateTime.parse(
                    '') // this will throw [FormatException], the input string cannot be parsed
            );
      case ValueType.TIME:
        return DateUtils.timeFormat().format(
            DateUtils.timeFormat().parseOrNull(value) ??
                DateTime.parse(
                    '') // this will throw [FormatException], the input string cannot be parsed
            );
      default:
    }
    return value;
  }
}
