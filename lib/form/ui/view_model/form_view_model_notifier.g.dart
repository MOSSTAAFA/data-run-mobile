// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_view_model_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formViewIndexHash() => r'596950527a2473b48fcd73cf67b3157da93fc787';

/// See also [formViewIndex].
@ProviderFor(formViewIndex)
final formViewIndexProvider = AutoDisposeProvider<int>.internal(
  formViewIndex,
  name: r'formViewIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formViewIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FormViewIndexRef = AutoDisposeProviderRef<int>;

String _$formViewModelNotifierHash() =>
    r'c8dfade1494cec98be5877cfc09b5984c9fd7ccf';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$FormViewModelNotifier
    extends BuildlessAutoDisposeAsyncNotifier<IList<FieldUiModel>> {
  late final FormRepository repository;

  FutureOr<IList<FieldUiModel>> build(
    FormRepository repository,
  );
}

/// See also [FormViewModelNotifier].
@ProviderFor(FormViewModelNotifier)
const formViewModelNotifierProvider = FormViewModelNotifierFamily();

/// See also [FormViewModelNotifier].
class FormViewModelNotifierFamily
    extends Family<AsyncValue<IList<FieldUiModel>>> {
  /// See also [FormViewModelNotifier].
  const FormViewModelNotifierFamily();

  /// See also [FormViewModelNotifier].
  FormViewModelNotifierProvider call(
    FormRepository repository,
  ) {
    return FormViewModelNotifierProvider(
      repository,
    );
  }

  @override
  FormViewModelNotifierProvider getProviderOverride(
    covariant FormViewModelNotifierProvider provider,
  ) {
    return call(
      provider.repository,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'formViewModelNotifierProvider';
}

/// See also [FormViewModelNotifier].
class FormViewModelNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<FormViewModelNotifier,
        IList<FieldUiModel>> {
  /// See also [FormViewModelNotifier].
  FormViewModelNotifierProvider(
    this.repository,
  ) : super.internal(
          () => FormViewModelNotifier()..repository = repository,
          from: formViewModelNotifierProvider,
          name: r'formViewModelNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formViewModelNotifierHash,
          dependencies: FormViewModelNotifierFamily._dependencies,
          allTransitiveDependencies:
              FormViewModelNotifierFamily._allTransitiveDependencies,
        );

  final FormRepository repository;

  @override
  bool operator ==(Object other) {
    return other is FormViewModelNotifierProvider &&
        other.repository == repository;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, repository.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<IList<FieldUiModel>> runNotifierBuild(
    covariant FormViewModelNotifier notifier,
  ) {
    return notifier.build(
      repository,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
