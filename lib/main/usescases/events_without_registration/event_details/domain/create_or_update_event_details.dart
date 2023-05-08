import 'package:d2_remote/core/mp/helpers/result.dart';
import 'package:d2_remote/modules/data/tracker/entities/event.entity.dart';

import '../../../../../commons/extensions/standard_extensions.dart';
import '../../../../../core/event/event_editable_status.dart';
import '../data/event_details_repository.dart';
import '../providers/event_detail_resources_provider.dart';

class CreateOrUpdateEventDetails {
  const CreateOrUpdateEventDetails(
      {required EventDetailsRepository repository,
      required EventDetailResourcesProvider resourcesProvider})
      : _repository = repository,
        _resourcesProvider = resourcesProvider;

  final EventDetailsRepository _repository;
  final EventDetailResourcesProvider _resourcesProvider;

  Future<Result<String, dynamic>> call(
      {required DateTime selectedDate,
      String? selectedOrgUnit,
      String? catOptionComboUid,
      String? coordinates}) async {
    (await _repository.getEvent())?.aLet((Event event) async {
      if (await _repository.getEditableStatus() is Editable) {
        await _repository.updateEvent(
            selectedDate, selectedOrgUnit, catOptionComboUid, coordinates);
        return Result.success(_resourcesProvider.provideEventCreatedMessage());
      }
    });

    return Result.failure(
        Exception(_resourcesProvider.provideEventCreationError()));
  }
}
