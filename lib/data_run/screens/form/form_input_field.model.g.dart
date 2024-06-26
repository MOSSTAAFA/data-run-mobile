// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_input_field.model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fieldInputModelNotifierHash() =>
    r'5fdf5861a55e06a33f99f7cd792ac54d1f550751';

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

abstract class _$FieldInputModelNotifier
    extends BuildlessAutoDisposeAsyncNotifier<FormFieldModel> {
  late final int index;

  FutureOr<FormFieldModel> build(
    int index,
  );
}

/// See also [FieldInputModelNotifier].
@ProviderFor(FieldInputModelNotifier)
const fieldInputModelNotifierProvider = FieldInputModelNotifierFamily();

/// See also [FieldInputModelNotifier].
class FieldInputModelNotifierFamily extends Family<AsyncValue<FormFieldModel>> {
  /// See also [FieldInputModelNotifier].
  const FieldInputModelNotifierFamily();

  /// See also [FieldInputModelNotifier].
  FieldInputModelNotifierProvider call(
    int index,
  ) {
    return FieldInputModelNotifierProvider(
      index,
    );
  }

  @override
  FieldInputModelNotifierProvider getProviderOverride(
    covariant FieldInputModelNotifierProvider provider,
  ) {
    return call(
      provider.index,
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
  String? get name => r'fieldInputModelNotifierProvider';
}

/// See also [FieldInputModelNotifier].
class FieldInputModelNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<FieldInputModelNotifier,
        FormFieldModel> {
  /// See also [FieldInputModelNotifier].
  FieldInputModelNotifierProvider(
    int index,
  ) : this._internal(
          () => FieldInputModelNotifier()..index = index,
          from: fieldInputModelNotifierProvider,
          name: r'fieldInputModelNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fieldInputModelNotifierHash,
          dependencies: FieldInputModelNotifierFamily._dependencies,
          allTransitiveDependencies:
              FieldInputModelNotifierFamily._allTransitiveDependencies,
          index: index,
        );

  FieldInputModelNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.index,
  }) : super.internal();

  final int index;

  @override
  FutureOr<FormFieldModel> runNotifierBuild(
    covariant FieldInputModelNotifier notifier,
  ) {
    return notifier.build(
      index,
    );
  }

  @override
  Override overrideWith(FieldInputModelNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: FieldInputModelNotifierProvider._internal(
        () => create()..index = index,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        index: index,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<FieldInputModelNotifier,
      FormFieldModel> createElement() {
    return _FieldInputModelNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FieldInputModelNotifierProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FieldInputModelNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<FormFieldModel> {
  /// The parameter `index` of this provider.
  int get index;
}

class _FieldInputModelNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FieldInputModelNotifier,
        FormFieldModel> with FieldInputModelNotifierRef {
  _FieldInputModelNotifierProviderElement(super.provider);

  @override
  int get index => (origin as FieldInputModelNotifierProvider).index;
}

String _$formInputFieldsListNotifierHash() =>
    r'87f419f3051173da4ed8556996806aaf36cd438f';

/// fetchFormItems using [syncableEntityMappingRepositoryProvider]
///
/// Copied from [FormInputFieldsListNotifier].
@ProviderFor(FormInputFieldsListNotifier)
final formInputFieldsListNotifierProvider = AutoDisposeAsyncNotifierProvider<
    FormInputFieldsListNotifier, IList<FormFieldModel>>.internal(
  FormInputFieldsListNotifier.new,
  name: r'formInputFieldsListNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formInputFieldsListNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FormInputFieldsListNotifier
    = AutoDisposeAsyncNotifier<IList<FormFieldModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
