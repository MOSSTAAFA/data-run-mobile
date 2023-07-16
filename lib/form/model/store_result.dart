import 'package:freezed_annotation/freezed_annotation.dart';

import 'value_store_result.dart';

part 'store_result.freezed.dart';

@freezed
class StoreResult with _$StoreResult {
  const factory StoreResult({
    required String uid,
    ValueStoreResult? valueStoreResult,
    String? valueStoreResultMessage,
  }) = _StoreResult;

  const StoreResult._();
}
