// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ou_picker_data_source.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ouPickerDataSourceHash() =>
    r'a13fd74c6526a8dae557c1feca2cc2b11afd5ac6';

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

/// See also [ouPickerDataSource].
@ProviderFor(ouPickerDataSource)
const ouPickerDataSourceProvider = OuPickerDataSourceFamily();

/// See also [ouPickerDataSource].
class OuPickerDataSourceFamily extends Family<AsyncValue<TreeNodeDataSource>> {
  /// See also [ouPickerDataSource].
  const OuPickerDataSourceFamily();

  /// See also [ouPickerDataSource].
  OuPickerDataSourceProvider call({
    required FormMetadata formMetaData,
  }) {
    return OuPickerDataSourceProvider(
      formMetaData: formMetaData,
    );
  }

  @override
  OuPickerDataSourceProvider getProviderOverride(
    covariant OuPickerDataSourceProvider provider,
  ) {
    return call(
      formMetaData: provider.formMetaData,
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
  String? get name => r'ouPickerDataSourceProvider';
}

/// See also [ouPickerDataSource].
class OuPickerDataSourceProvider
    extends AutoDisposeFutureProvider<TreeNodeDataSource> {
  /// See also [ouPickerDataSource].
  OuPickerDataSourceProvider({
    required FormMetadata formMetaData,
  }) : this._internal(
          (ref) => ouPickerDataSource(
            ref as OuPickerDataSourceRef,
            formMetaData: formMetaData,
          ),
          from: ouPickerDataSourceProvider,
          name: r'ouPickerDataSourceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ouPickerDataSourceHash,
          dependencies: OuPickerDataSourceFamily._dependencies,
          allTransitiveDependencies:
              OuPickerDataSourceFamily._allTransitiveDependencies,
          formMetaData: formMetaData,
        );

  OuPickerDataSourceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.formMetaData,
  }) : super.internal();

  final FormMetadata formMetaData;

  @override
  Override overrideWith(
    FutureOr<TreeNodeDataSource> Function(OuPickerDataSourceRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OuPickerDataSourceProvider._internal(
        (ref) => create(ref as OuPickerDataSourceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        formMetaData: formMetaData,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TreeNodeDataSource> createElement() {
    return _OuPickerDataSourceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OuPickerDataSourceProvider &&
        other.formMetaData == formMetaData;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, formMetaData.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OuPickerDataSourceRef
    on AutoDisposeFutureProviderRef<TreeNodeDataSource> {
  /// The parameter `formMetaData` of this provider.
  FormMetadata get formMetaData;
}

class _OuPickerDataSourceProviderElement
    extends AutoDisposeFutureProviderElement<TreeNodeDataSource>
    with OuPickerDataSourceRef {
  _OuPickerDataSourceProviderElement(super.provider);

  @override
  FormMetadata get formMetaData =>
      (origin as OuPickerDataSourceProvider).formMetaData;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
