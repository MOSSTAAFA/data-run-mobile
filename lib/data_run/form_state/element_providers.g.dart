// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$elementDependencyHash() => r'78fff91c2554998a831487e43da0a42949ddf50a';

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

/// See also [elementDependency].
@ProviderFor(elementDependency)
const elementDependencyProvider = ElementDependencyFamily();

/// See also [elementDependency].
class ElementDependencyFamily extends Family<FormElementInstance<dynamic>> {
  /// See also [elementDependency].
  const ElementDependencyFamily();

  /// See also [elementDependency].
  ElementDependencyProvider call(
    String path, {
    required FormMetadata formMetaData,
  }) {
    return ElementDependencyProvider(
      path,
      formMetaData: formMetaData,
    );
  }

  @override
  ElementDependencyProvider getProviderOverride(
    covariant ElementDependencyProvider provider,
  ) {
    return call(
      provider.path,
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
  String? get name => r'elementDependencyProvider';
}

/// See also [elementDependency].
class ElementDependencyProvider
    extends AutoDisposeProvider<FormElementInstance<dynamic>> {
  /// See also [elementDependency].
  ElementDependencyProvider(
    String path, {
    required FormMetadata formMetaData,
  }) : this._internal(
          (ref) => elementDependency(
            ref as ElementDependencyRef,
            path,
            formMetaData: formMetaData,
          ),
          from: elementDependencyProvider,
          name: r'elementDependencyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$elementDependencyHash,
          dependencies: ElementDependencyFamily._dependencies,
          allTransitiveDependencies:
              ElementDependencyFamily._allTransitiveDependencies,
          path: path,
          formMetaData: formMetaData,
        );

  ElementDependencyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.path,
    required this.formMetaData,
  }) : super.internal();

  final String path;
  final FormMetadata formMetaData;

  @override
  Override overrideWith(
    FormElementInstance<dynamic> Function(ElementDependencyRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ElementDependencyProvider._internal(
        (ref) => create(ref as ElementDependencyRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        path: path,
        formMetaData: formMetaData,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<FormElementInstance<dynamic>> createElement() {
    return _ElementDependencyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ElementDependencyProvider &&
        other.path == path &&
        other.formMetaData == formMetaData;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);
    hash = _SystemHash.combine(hash, formMetaData.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ElementDependencyRef
    on AutoDisposeProviderRef<FormElementInstance<dynamic>> {
  /// The parameter `path` of this provider.
  String get path;

  /// The parameter `formMetaData` of this provider.
  FormMetadata get formMetaData;
}

class _ElementDependencyProviderElement
    extends AutoDisposeProviderElement<FormElementInstance<dynamic>>
    with ElementDependencyRef {
  _ElementDependencyProviderElement(super.provider);

  @override
  String get path => (origin as ElementDependencyProvider).path;
  @override
  FormMetadata get formMetaData =>
      (origin as ElementDependencyProvider).formMetaData;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
