// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_entity_mapped_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formEntityMappedRepositoryHash() =>
    r'ed6b44c0b3ba2c79dcd3b75bf3a3459e7fe10e4a';

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

/// See also [formEntityMappedRepository].
@ProviderFor(formEntityMappedRepository)
const formEntityMappedRepositoryProvider = FormEntityMappedRepositoryFamily();

/// See also [formEntityMappedRepository].
class FormEntityMappedRepositoryFamily
    extends Family<FormEntityMappedRepository> {
  /// See also [formEntityMappedRepository].
  const FormEntityMappedRepositoryFamily();

  /// See also [formEntityMappedRepository].
  FormEntityMappedRepositoryProvider call(
    String formCode,
  ) {
    return FormEntityMappedRepositoryProvider(
      formCode,
    );
  }

  @override
  FormEntityMappedRepositoryProvider getProviderOverride(
    covariant FormEntityMappedRepositoryProvider provider,
  ) {
    return call(
      provider.formCode,
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
  String? get name => r'formEntityMappedRepositoryProvider';
}

/// See also [formEntityMappedRepository].
class FormEntityMappedRepositoryProvider
    extends AutoDisposeProvider<FormEntityMappedRepository> {
  /// See also [formEntityMappedRepository].
  FormEntityMappedRepositoryProvider(
    String formCode,
  ) : this._internal(
          (ref) => formEntityMappedRepository(
            ref as FormEntityMappedRepositoryRef,
            formCode,
          ),
          from: formEntityMappedRepositoryProvider,
          name: r'formEntityMappedRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formEntityMappedRepositoryHash,
          dependencies: FormEntityMappedRepositoryFamily._dependencies,
          allTransitiveDependencies:
              FormEntityMappedRepositoryFamily._allTransitiveDependencies,
          formCode: formCode,
        );

  FormEntityMappedRepositoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.formCode,
  }) : super.internal();

  final String formCode;

  @override
  Override overrideWith(
    FormEntityMappedRepository Function(FormEntityMappedRepositoryRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FormEntityMappedRepositoryProvider._internal(
        (ref) => create(ref as FormEntityMappedRepositoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        formCode: formCode,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<FormEntityMappedRepository> createElement() {
    return _FormEntityMappedRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FormEntityMappedRepositoryProvider &&
        other.formCode == formCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, formCode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FormEntityMappedRepositoryRef
    on AutoDisposeProviderRef<FormEntityMappedRepository> {
  /// The parameter `formCode` of this provider.
  String get formCode;
}

class _FormEntityMappedRepositoryProviderElement
    extends AutoDisposeProviderElement<FormEntityMappedRepository>
    with FormEntityMappedRepositoryRef {
  _FormEntityMappedRepositoryProviderElement(super.provider);

  @override
  String get formCode =>
      (origin as FormEntityMappedRepositoryProvider).formCode;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
