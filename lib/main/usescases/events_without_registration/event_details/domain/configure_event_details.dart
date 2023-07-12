import 'package:d2_remote/core/mp/enrollment/enrollment_status.dart';
import 'package:d2_remote/core/mp/helpers/result.dart';
import 'package:d2_remote/modules/data/tracker/entities/event.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_stage.entity.dart';

import '../../../../../commons/data/event_creation_type.dart';
import '../../../../../commons/extensions/standard_extensions.dart' as alet;
import '../../../../../commons/extensions/standard_extensions.dart';
import '../../../../../commons/extensions/string_extension.dart';
import '../../../../../core/event/event_editable_status.dart';
import '../../../../../core/event/event_extensions.dart';
import '../../../../../core/event/event_status.dart';
import '../data/event_details_repository.dart';
import '../models/event_details.dart';
import '../providers/event_detail_resources_provider.dart';

class ConfigureEventDetails {
  const ConfigureEventDetails(
      {required EventDetailsRepository repository,
      required EventDetailResourcesProvider resourcesProvider,
      required EventCreationType creationType,
      EnrollmentStatus? enrollmentStatus})
      : _repository = repository,
        _resourcesProvider = resourcesProvider,
        _creationType = creationType,
        _enrollmentStatus = enrollmentStatus;

  final EventDetailsRepository _repository;
  final EventDetailResourcesProvider _resourcesProvider;
  final EventCreationType _creationType;
  final EnrollmentStatus? _enrollmentStatus;

  Future<EventDetails> call(
      {DateTime? selectedDate,
      String? selectedOrgUnit,
      String? selectedActivity,
      String? coordinates,
      String? tempCreate}) async {
    final bool isEventCompleted = _isCompleted(
        selectedDate: selectedDate,
        selectedOrgUnit: selectedOrgUnit,
        tempCreate: tempCreate);
    final Event? storedEvent = await _repository.getEvent();
    final ProgramStage programStage = await _repository.getProgramStage();
    return EventDetails(
        name: programStage.displayName,
        description: programStage.description,
        // style: repository.getObjectStyle(),
        enabled: await _isEnable(storedEvent),
        isEditable: await _isEditable(),
        editableReason: await _getEditableReason(),
        temCreate: tempCreate,
        selectedDate: selectedDate,
        selectedOrgUnit: selectedOrgUnit,
        selectedActivity: selectedActivity,
        coordinates: coordinates,
        isCompleted: isEventCompleted,
        isActionButtonVisible:
            await _isActionButtonVisible(isEventCompleted, storedEvent),
        actionButtonText: await _getActionButtonText(),
        canReopen: await _repository.getCanReopen());
  }

  Future<String> _getActionButtonText() async {
    return (await _repository.getEditableStatus())
            ?.let((EventEditableStatus it) {
          return when(it, {
            Editable: () => _resourcesProvider.provideButtonUpdate(),
            NonEditable: () => _resourcesProvider.provideButtonCheck()
          });
        }) ??
        _resourcesProvider.provideButtonNext();
  }

  Future<bool> _isActionButtonVisible(
      bool isEventCompleted, Event? storedEvent) async {
    return await storedEvent?.aLet((Event it) async {
          return it.status.toEventStatus == EventStatus.OVERDUE &&
              _enrollmentStatus == EnrollmentStatus.CANCELLED &&
              await _repository.getEditableStatus() is NonEditable;
        }) ??
        isEventCompleted;
  }

  Future<Result<String, dynamic>> reopenEvent() => _repository.reopenEvent();

  bool _isCompleted(
          {DateTime? selectedDate,
          String? selectedOrgUnit,
          String? tempCreate}) =>
      selectedDate != null &&
      !selectedOrgUnit.isNullOrEmpty &&
      (_creationType != EventCreationType.REFERAL || tempCreate != null);

  Future<bool> _isEditable() async {
    return await _getEditableReason() == null;
  }

  Future<String?> _getEditableReason() async {
    return (await _repository.getEditableStatus())
        .let((EventEditableStatus? it) {
      if (it is NonEditable) {
        return _resourcesProvider.provideEditionStatus(it.reason);
      }
      return null;
    });
  }

  Future<bool> _isEnable(Event? storedEvent) async {
    return await storedEvent?.aLet((Event it) async =>
            (await _repository.getEditableStatus()) is Editable) ??
        true;
  }
}
