// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_element_builder.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formInstanceBuilderHash() =>
    r'6d37d598590017069b83576dbd1ccdb513af8efe';

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

/// See also [formInstanceBuilder].
@ProviderFor(formInstanceBuilder)
const formInstanceBuilderProvider = FormInstanceBuilderFamily();

/// See also [formInstanceBuilder].
class FormInstanceBuilderFamily extends Family {
  /// See also [formInstanceBuilder].
  const FormInstanceBuilderFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'formInstanceBuilderProvider';

  /// See also [formInstanceBuilder].
  FormInstanceBuilderProvider call({
    required FormMetadata formMetadata,
  }) {
    return FormInstanceBuilderProvider(
      formMetadata: formMetadata,
    );
  }

  @visibleForOverriding
  @override
  FormInstanceBuilderProvider getProviderOverride(
    covariant FormInstanceBuilderProvider provider,
  ) {
    return call(
      formMetadata: provider.formMetadata,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<FormInstanceBuilder> Function(FormInstanceBuilderRef ref)
          create) {
    return _$FormInstanceBuilderFamilyOverride(this, create);
  }
}

class _$FormInstanceBuilderFamilyOverride implements FamilyOverride {
  _$FormInstanceBuilderFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<FormInstanceBuilder> Function(FormInstanceBuilderRef ref)
      create;

  @override
  final FormInstanceBuilderFamily overriddenFamily;

  @override
  FormInstanceBuilderProvider getProviderOverride(
    covariant FormInstanceBuilderProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [formInstanceBuilder].
class FormInstanceBuilderProvider
    extends AutoDisposeFutureProvider<FormInstanceBuilder> {
  /// See also [formInstanceBuilder].
  FormInstanceBuilderProvider({
    required FormMetadata formMetadata,
  }) : this._internal(
          (ref) => formInstanceBuilder(
            ref as FormInstanceBuilderRef,
            formMetadata: formMetadata,
          ),
          from: formInstanceBuilderProvider,
          name: r'formInstanceBuilderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formInstanceBuilderHash,
          dependencies: FormInstanceBuilderFamily._dependencies,
          allTransitiveDependencies:
              FormInstanceBuilderFamily._allTransitiveDependencies,
          formMetadata: formMetadata,
        );

  FormInstanceBuilderProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.formMetadata,
  }) : super.internal();

  final FormMetadata formMetadata;

  @override
  Override overrideWith(
    FutureOr<FormInstanceBuilder> Function(FormInstanceBuilderRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FormInstanceBuilderProvider._internal(
        (ref) => create(ref as FormInstanceBuilderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        formMetadata: formMetadata,
      ),
    );
  }

  @override
  ({
    FormMetadata formMetadata,
  }) get argument {
    return (formMetadata: formMetadata,);
  }

  @override
  AutoDisposeFutureProviderElement<FormInstanceBuilder> createElement() {
    return _FormInstanceBuilderProviderElement(this);
  }

  FormInstanceBuilderProvider _copyWith(
    FutureOr<FormInstanceBuilder> Function(FormInstanceBuilderRef ref) create,
  ) {
    return FormInstanceBuilderProvider._internal(
      (ref) => create(ref as FormInstanceBuilderRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      formMetadata: formMetadata,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FormInstanceBuilderProvider &&
        other.formMetadata == formMetadata;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, formMetadata.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FormInstanceBuilderRef
    on AutoDisposeFutureProviderRef<FormInstanceBuilder> {
  /// The parameter `formMetadata` of this provider.
  FormMetadata get formMetadata;
}

class _FormInstanceBuilderProviderElement
    extends AutoDisposeFutureProviderElement<FormInstanceBuilder>
    with FormInstanceBuilderRef {
  _FormInstanceBuilderProviderElement(super.provider);

  @override
  FormMetadata get formMetadata =>
      (origin as FormInstanceBuilderProvider).formMetadata;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
