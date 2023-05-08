import 'package:d2_remote/core/common/feature_type.dart';
import 'package:d2_remote/core/common/value_type.dart';
import 'package:flutter/foundation.dart';

import '../../../commons/date/date_utils.dart';
import '../../../commons/extensions/string_extension.dart';
import '../../model/Ui_render_type.dart';
import '../../model/field_ui_model.dart';
import '../../model/ui_event_type.dart';
import 'list_view_ui_events.dart';
import 'ui_event_factory.dart';

class UiEventFactoryImpl implements UiEventFactory {
  const UiEventFactoryImpl(
      {required this.uid,
      required this.label,
      this.description,
      required this.valueType,
      this.allowFutureDates,
      this.optionSet});

  final String uid;
  final String label;
  final String? description;
  final ValueType valueType;
  final bool? allowFutureDates;
  final String? optionSet;

  @override
  ListViewUiEvents? generateEvent(String? value, UiEventType? uiEventType,
      UiRenderType? renderingType, FieldUiModel fieldUiModel) {
    ListViewUiEvents? uiEvent;
    try {
      switch (uiEventType) {
        case UiEventType.DATE_TIME:
          switch (valueType) {
            case ValueType.DATE:
              uiEvent = ListViewUiEvents.openCustomCalendar(
                  uid: uid,
                  label: label,
                  date: DateUtils.oldUiDateFormat().parse(value ?? ''),
                  allowFutureDates: allowFutureDates ?? true);
              break;
            case ValueType.DATETIME:
              uiEvent = ListViewUiEvents.openCustomCalendar(
                  uid: uid,
                  label: label,
                  date: DateUtils.databaseDateFormatNoSeconds()
                      .parse(value ?? ''),
                  allowFutureDates: allowFutureDates ?? true,
                  isDateTime: true);
              break;
            case ValueType.TIME:
              uiEvent = ListViewUiEvents.openTimePicker(
                  uid: uid,
                  label: label,
                  date: DateUtils.timeFormat().parse(value ?? ''));
              break;
            default:
          }
          break;
        case UiEventType.AGE_CALENDAR:
          uiEvent = ListViewUiEvents.openTimePicker(
              uid: uid, label: label, date: value.toDate());
          break;
        case UiEventType.AGE_YEAR_MONTH_DAY:
          final List<int> yearMonthDay = _valueToYearMonthDay(value);
          uiEvent = ListViewUiEvents.openYearMonthDayAgeCalendar(
              uid: uid,
              year: yearMonthDay[0],
              month: yearMonthDay[1],
              day: yearMonthDay[2]);
          break;
        case UiEventType.ORG_UNIT:
          uiEvent = ListViewUiEvents.openOrgUnitDialog(
              uid: uid, label: label, value: value);
          break;
        case UiEventType.REQUEST_CURRENT_LOCATION:
          uiEvent = ListViewUiEvents.requestCurrentLocation(uid: uid);
          break;
        case UiEventType.REQUEST_LOCATION_BY_MAP:
          uiEvent = ListViewUiEvents.requestLocationByMap(
              uid: uid,
              featureType: _getFeatureType(renderingType),
              value: value);
          break;
        case UiEventType.SHOW_DESCRIPTION:
          uiEvent =
              ListViewUiEvents.showDescriptionLabelDialog(label, description);
          break;
        case UiEventType.ADD_PICTURE:
          uiEvent = ListViewUiEvents.addImage(uid);
          break;
        case UiEventType.COPY_TO_CLIPBOARD:
          uiEvent = ListViewUiEvents.copyToClipboard(value: value);
          break;
        case UiEventType.QR_CODE:
          if (value.isNullOrEmpty && fieldUiModel.editable) {
            uiEvent = ListViewUiEvents.scanQRCode(
                uid: uid, optionSet: optionSet, renderingType: renderingType);
          } else if (value != null) {
            uiEvent = ListViewUiEvents.displayQRCode(
                uid: uid,
                optionSet: optionSet,
                value: value,
                renderingType: renderingType,
                editable: fieldUiModel.editable);
          } else {
            uiEvent = null;
          }
          break;
        case UiEventType.OPTION_SET:
          uiEvent = ListViewUiEvents.openOptionSetDialog(field: fieldUiModel);
          break;
        default:
      }
    } catch (e) {
      if (kDebugMode) {
        print('wrong format');
      }
    }

    return uiEvent;
  }

  List<int> _valueToYearMonthDay(String? value) {
    final DateTime? dateTime = value.toDate();
    return dateTime != null
        ? [dateTime.year, dateTime.month, dateTime.day]
        : [0, 0, 0];
  }

  FeatureType _getFeatureType(UiRenderType? renderingType) {
    switch (renderingType) {
      case UiRenderType.DEFAULT:
        return FeatureType.NONE;
      case UiRenderType.POINT:
        return FeatureType.POINT;
      case UiRenderType.POLYGON:
        return FeatureType.POLYGON;
      case UiRenderType.MULTI_POLYGON:
        return FeatureType.MULTI_POLYGON;
      default:
    }
    return FeatureType.NONE;
  }
}
