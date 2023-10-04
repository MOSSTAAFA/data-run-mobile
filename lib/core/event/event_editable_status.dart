import 'package:equatable/equatable.dart';

part 'event_editable_status.sealed.dart';

// @Sealed()
abstract class _EventEditableStatus {
  // @WithName('Editable')
  void editable();

  // @WithName('NonEditable')
  void nonEditable(final EventNonEditableReason reason);
}

enum EventNonEditableReason {
  BLOCKED_BY_COMPLETION,
  EXPIRED,
  NO_DATA_WRITE_ACCESS,
  EVENT_DATE_IS_NOT_IN_ORGUNIT_RANGE,
  NO_CATEGORY_COMBO_ACCESS,
  ENROLLMENT_IS_NOT_OPEN,
  ORGUNIT_IS_NOT_IN_CAPTURE_SCOPE
}
