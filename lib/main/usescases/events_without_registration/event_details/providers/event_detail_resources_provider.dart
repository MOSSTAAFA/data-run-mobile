import '../../../../../commons/extensions/standard_extensions.dart';
import '../../../../../commons/resources/resource_manager.dart';
import '../../../../../core/event/event_editable_status.dart';

class EventDetailResourcesProvider {
  const EventDetailResourcesProvider(this._resourceManager);

  final ResourceManager _resourceManager;

  String provideDueDate() => _resourceManager.getString('due_date');

  String provideEventDate() => _resourceManager.getString('event_date');

  String provideEditionStatus(EventNonEditableReason reason) {
    return when(reason, {
      EventNonEditableReason.BLOCKED_BY_COMPLETION: () =>
          _resourceManager.getString('blocked_by_completion'),
      EventNonEditableReason.EXPIRED: () =>
          _resourceManager.getString('edition_expired'),
      EventNonEditableReason.NO_DATA_WRITE_ACCESS: () =>
          _resourceManager.getString('edition_no_write_access'),
      EventNonEditableReason.EVENT_DATE_IS_NOT_IN_ORGUNIT_RANGE: () =>
          _resourceManager.getString('event_date_not_in_orgunit_range'),
      EventNonEditableReason.NO_CATEGORY_COMBO_ACCESS: () =>
          _resourceManager.getString('edition_no_catcombo_access'),
      EventNonEditableReason.ENROLLMENT_IS_NOT_OPEN: () =>
          _resourceManager.getString('edition_enrollment_is_no_open'),
      EventNonEditableReason.ORGUNIT_IS_NOT_IN_CAPTURE_SCOPE: () =>
          _resourceManager.getString('edition_orgunit_capture_scope'),
    }).orElse(() => _resourceManager.getString('not_mapped_reason'));
  }

  String provideButtonUpdate() => _resourceManager.getString('update');

  String provideButtonNext() => _resourceManager.getString('next');

  String provideButtonCheck() => _resourceManager.getString('check_event');

  String provideEventCreatedMessage() =>
      _resourceManager.getString('event_updated');

  String provideEventCreationError() =>
      _resourceManager.getString('failed_insert_event');

  String provideReOpened() => _resourceManager.getString('re_opened');
}
