import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mass_pro/form/model/value_store_result.dart';

part 'store_result.freezed.dart';

/// **InputAction and StoreResult:** These classes work hand-in-hand
/// to manage actions and their outcomes.
/// `RowAction` represents the action triggered by an intent and the
/// result of processing it. It includes information
/// like the field ID, action type (e.g., save, clear), v
/// alue (optional, for some actions),
/// error (if validation fails), and value type.
///
/// `StoreResult` represents the outcome of saving or
/// updating form data. It contains details like
/// the field ID and any error messages encountered during the process.
@freezed
class StoreResult with _$StoreResult {
  const factory StoreResult({
    required String uid,
    ValueStoreResult? valueStoreResult,
    String? valueStoreResultMessage,
  }) = _StoreResult;

  const StoreResult._();
}
