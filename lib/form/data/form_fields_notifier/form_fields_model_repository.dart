// NMC created
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../ui/provider/display_name_provider.dart';
import '../../ui/validation/field_error_message_provider.dart';
import '../data_entry_repository.dart';
import '../form_value_store.dart';
import 'form_fields_model.dart';

part 'form_fields_model_repository.g.dart';

@riverpod
class FormFieldsModelRepository extends _$FormFieldsModelRepository {
  @override
  FormFieldsModel build({
    FormValueStore? formValueStore,
    required FieldErrorMessageProvider fieldErrorMessageProvider,
    required DisplayNameProvider displayNameProvider,
    DataEntryRepository? dataEntryRepository,
  }) {
    return FormFieldsModel();
  }
}
