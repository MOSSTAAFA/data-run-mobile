import 'package:d2_remote/modules/data/tracker/entities/event_data_value.entity.dart';

class EventDataValueBuilder {
  EventDataValueBuilder();

  String? dataElement;
  String? value;
  String? event;
  bool? dirty;

  // String? enrollment;

  // String? program;
  // String? programStage;
  String? organisationUnit;
  String? activity;
  bool? status;

  EventDataValue build() {
    assert(dataElement != null, 'dataElement: Cannot be null');
    assert(value != null, 'value: Cannot be null');
    assert(dirty != null, 'dirty: Cannot be null');
    assert(event != null, 'dirty: Cannot be null');
    return EventDataValue(
        dataElement: dataElement!, value: value!, dirty: dirty!, event: event);
  }
}
