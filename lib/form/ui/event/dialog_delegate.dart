import 'package:d2_remote/core/common/value_type.dart';

import '../../../commons/date/date_utils.dart';
import '../../../commons/extensions/standard_extensions.dart';
import '../intent/form_intent.dart';
import 'list_view_ui_events.dart';

class DialogDelegate {
  static FormIntent handleDateInput(String uid, int year, int month, int day) {
    final ageDate = DateTime(year, month, day);

    final date = DateUtils.oldUiDateFormat().format(ageDate);

    return FormIntent.onSave(uid: uid, value: date, valueType: ValueType.DATE);
  }

  static FormIntent handleTimeInput(
      String uid, DateTime? date, int hourOfDay, int minutes) {
    final DateTime dateTime = date?.let(
          (DateTime it) {
            return it.copyWith(hour: hourOfDay, minute: minutes);
          },
        ) ??
        DateTime.now().copyWith(hour: hourOfDay, minute: minutes);

    final String dateValue = when(date, {
      null: () => DateUtils.timeFormat().format(dateTime),
    }).orElse(() => DateUtils.databaseDateFormatNoSeconds().format(dateTime));

    return FormIntent.onSave(
        uid: uid,
        value: dateValue,
        valueType: date?.let((it) => ValueType.DATETIME) ?? ValueType.TIME);
  }

  static ListViewUiEvents handleDateTimeInput(
    String uid,
    String label,
    DateTime? date,
    int year,
    int month,
    int day,
  ) {
    // val currentCalendar = Calendar.getInstance()
    final DateTime dateTime = date?.let(
          (DateTime it) {
            return it.copyWith(year: year, month: month, day: day);
          },
        ) ??
        DateTime.now().copyWith(year: year, month: month, day: day);

    return ListViewUiEvents.openTimePicker(
        uid: uid, label: label, date: dateTime, isDateTime: true);
  }
}
