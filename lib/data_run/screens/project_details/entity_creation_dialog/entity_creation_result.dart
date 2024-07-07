import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';

class EntityCreationResult {
  EntityCreationResult({required this.fields});

  final IList<QFieldModel> fields;
}