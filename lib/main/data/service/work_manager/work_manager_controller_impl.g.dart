// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_manager_controller_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$workManagerControllerHash() =>
    r'ea52ace62c2028dbf3d6380382d38b7410f91bea';

/// See also [workManagerController].
@ProviderFor(workManagerController)
final workManagerControllerProvider =
    AutoDisposeProvider<WorkManagerController>.internal(
  workManagerController,
  name: r'workManagerControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$workManagerControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WorkManagerControllerRef
    = AutoDisposeProviderRef<WorkManagerController>;
String _$syncProgressHash() => r'83a4999aa1cf60f526d5f2c21ea3b1d80a9490fa';

/// WorkInfosForUniqueWorkLiveData
///
/// Copied from [SyncProgress].
@ProviderFor(SyncProgress)
final syncProgressProvider =
    AutoDisposeNotifierProvider<SyncProgress, WorkInfo>.internal(
  SyncProgress.new,
  name: r'syncProgressProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$syncProgressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SyncProgress = AutoDisposeNotifier<WorkInfo>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
