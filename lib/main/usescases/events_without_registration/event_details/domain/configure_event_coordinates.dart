import 'package:d2_remote/core/common/feature_type.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_stage.entity.dart';

import '../../../../../commons/extensions/feature_type_extension.dart';
import '../../../../../commons/extensions/standard_extensions.dart';
import '../../../../../form/model/field_ui_model.dart';
import '../data/event_details_repository.dart';
import '../models/event_coordinates.dart';

class ConfigureEventCoordinates {
  const ConfigureEventCoordinates({required EventDetailsRepository repository})
      : _repository = repository;

  final EventDetailsRepository _repository;

  Future<EventCoordinates> call([String value = '']) async {
    return EventCoordinates(
        active: await _isActive(), model: await _getGeometryModel(value));
  }

  Future<FieldUiModel> _getGeometryModel(String? value) async {
    FieldUiModel model = await _repository.getGeometryModel();
    if (value?.isNotEmpty != false) {
      model = model.setValue(value);
    }
    return model;
  }

  Future<bool> _isActive() async {
    return (await _repository.getProgramStage())
        .let((ProgramStage programStage) {
      programStage.featureType.toFeatureType.let((FeatureType? it) {
        return it != FeatureType.NONE;
      });
      return false;
    });
  }
}
