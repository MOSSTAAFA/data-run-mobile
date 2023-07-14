import 'package:d2_remote/core/common/value_type.dart';
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/file_resource/entities/file_resource.entity.dart';
import 'package:d2_remote/modules/metadata/option_set/entities/option.entity.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';

import '../date/date_utils.dart';
import 'string_extension.dart';

extension CheckValueDynamicExtension on dynamic {
  Future<bool> check(
      ValueType? valueType, String? optionSetUid, String value) async {
    if (optionSetUid != null) {
      final Option? optionByCode = await D2Remote.optionModule.option
          .byOptionSet(optionSetUid)
          .where(attribute: 'code', value: value).getOne();

      final Option? optionByName = await D2Remote.optionModule.option
          .byOptionSet(optionSetUid)
          .where(attribute: 'name', value: value).getOne();
      return optionByCode != null || optionByName != null;
    }

    if (valueType != null) {
      if (valueType.isNumeric) {
        try {
          value.toDouble();
          return true;
        } catch (e) {
          return false;
        }
      } else {
        switch (valueType) {
          case ValueType.FILE_RESOURCE:
          case ValueType.IMAGE:
            final FileResource? fileResource = await D2Remote
                .fileResourceModule.fileResource
                .byId(value)
                .getOne();
            return fileResource != null;
          case ValueType.ORGANISATION_UNIT:
            final OrganisationUnit? orgUnit = await D2Remote
                .organisationUnitModule.organisationUnit
                .byId(value)
                .getOne();
            return orgUnit != null;
          default:
            break;
        }
        return true;
      }
    }
    return false;
  }
}

extension CheckOptionSetValueDynamicExtension on dynamic {
  Future<String?> checkOptionSetValue(String optionSetUid, String code) async {
    return (await D2Remote.optionModule.option
        .byOptionSet(optionSetUid)
        .where(attribute: 'code', value: code)
        .getOne())?.displayName;
  }
}

extension CheckValueTypeValueDynamicExtension on dynamic {
  Future<String?> checkValueTypeValue(
      ValueType? valueType, String value) async {
    switch (valueType) {
      case ValueType.ORGANISATION_UNIT:
        return await D2Remote.organisationUnitModule.organisationUnit
            .byId(value)
            .getOne()
            .displayName;
      case ValueType.IMAGE:
      case ValueType.FILE_RESOURCE:
        final FileResource? fileResource =
            await D2Remote.fileResourceModule.fileResource.byId(value).getOne();
        if (fileResource != null) {
          return fileResource.localFilePath;
        } else {
          return '';
        }
      case ValueType.DATE:
        try {
          return DateUtils.uiDateFormat()
              .format(DateUtils.databaseDateFormatNoSeconds().parse(value));
        } catch (e) {
          return '';
        }
      case ValueType.DATETIME:
        try {
          return DateUtils.dateTimeFormat()
              .format(DateUtils.databaseDateFormatNoSeconds().parse(value));
        } catch (e) {
          return '';
        }
      case ValueType.TIME:
        try {
          return DateUtils.timeFormat()
              .format(DateUtils.timeFormat().parse(value));
        } catch (e) {
          return '';
        }
      default:
        break;
    }

    return value;
  }
}
