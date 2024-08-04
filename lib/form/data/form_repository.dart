import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';

import 'package:mass_pro/form/model/field_ui_model.dart';
import 'package:mass_pro/form/model/row_action.dart';
import 'package:mass_pro/form/model/store_result.dart';
import 'package:mass_pro/form/data/data_integrity_check_result.dart';

abstract class FormRepository {
  Future<IList<FieldUiModel>> fetchFormItems();

  Future<IList<FieldUiModel>> composeList();

  // List<RulesUtilsProviderConfigurationError>? getConfigurationErrors();
  DataIntegrityCheckResult runDataIntegrityCheck({required bool allowDiscard});

  // Currently no need to return Future
  double completedFieldsPercentage(IList<FieldUiModel> value);

  bool calculationLoopOverLimit();

  IList<FieldUiModel> backupOfChangedItems();

  void updateErrorList(RowAction action);

  Future<StoreResult?> save(String id, String? value, String? extraData);

  Future<void> updateValueOnList(
      String uid, String? value, ValueType? valueType);

  FieldUiModel? currentFocusedItem();

  void setFocusedItem(RowAction action);

  void updateSectionOpened(RowAction action);

  void removeAllValues();

  void setFieldRequestingCoordinates(String uid, bool requestInProcess);

  void clearFocusItem();
}
