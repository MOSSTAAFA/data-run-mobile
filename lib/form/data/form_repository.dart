import 'package:d2_remote/core/common/value_type.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../model/field_ui_model.dart';
import '../model/row_action.dart';
import '../model/store_result.dart';
import 'data_integrity_check_result.dart';

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
