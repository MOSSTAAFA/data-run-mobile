// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_element_control_builder.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formInstanceControlBuilderHash() =>
    r'd388fc84f4d7a476092c9df4e7c73dccd731e97c';

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

/// See also [formInstanceControlBuilder].
@ProviderFor(formInstanceControlBuilder)
const formInstanceControlBuilderProvider = FormInstanceControlBuilderFamily();

/// See also [formInstanceControlBuilder].
class FormInstanceControlBuilderFamily extends Family {
  /// See also [formInstanceControlBuilder].
  const FormInstanceControlBuilderFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'formInstanceControlBuilderProvider';

  /// See also [formInstanceControlBuilder].
  FormInstanceControlBuilderProvider call({
    required FormMetadata formMetadata,
  }) {
    return FormInstanceControlBuilderProvider(
      formMetadata: formMetadata,
    );
  }

  @visibleForOverriding
  @override
  FormInstanceControlBuilderProvider getProviderOverride(
    covariant FormInstanceControlBuilderProvider provider,
  ) {
    return call(
      formMetadata: provider.formMetadata,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<FormInstanceControlBuilder> Function(
              FormInstanceControlBuilderRef ref)
          create) {
    return _$FormInstanceControlBuilderFamilyOverride(this, create);
  }
}

class _$FormInstanceControlBuilderFamilyOverride implements FamilyOverride {
  _$FormInstanceControlBuilderFamilyOverride(
      this.overriddenFamily, this.create);

  final FutureOr<FormInstanceControlBuilder> Function(
      FormInstanceControlBuilderRef ref) create;

  @override
  final FormInstanceControlBuilderFamily overriddenFamily;

  @override
  FormInstanceControlBuilderProvider getProviderOverride(
    covariant FormInstanceControlBuilderProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [formInstanceControlBuilder].
class FormInstanceControlBuilderProvider
    extends AutoDisposeFutureProvider<FormInstanceControlBuilder> {
  /// See also [formInstanceControlBuilder].
  FormInstanceControlBuilderProvider({
    required FormMetadata formMetadata,
  }) : this._internal(
          (ref) => formInstanceControlBuilder(
            ref as FormInstanceControlBuilderRef,
            formMetadata: formMetadata,
          ),
          from: formInstanceControlBuilderProvider,
          name: r'formInstanceControlBuilderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formInstanceControlBuilderHash,
          dependencies: FormInstanceControlBuilderFamily._dependencies,
          allTransitiveDependencies:
              FormInstanceControlBuilderFamily._allTransitiveDependencies,
          formMetadata: formMetadata,
        );

  FormInstanceControlBuilderProvider._internal(
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
    FutureOr<FormInstanceControlBuilder> Function(
            FormInstanceControlBuilderRef ref)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FormInstanceControlBuilderProvider._internal(
        (ref) => create(ref as FormInstanceControlBuilderRef),
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
  AutoDisposeFutureProviderElement<FormInstanceControlBuilder> createElement() {
    return _FormInstanceControlBuilderProviderElement(this);
  }

  FormInstanceControlBuilderProvider _copyWith(
    FutureOr<FormInstanceControlBuilder> Function(
            FormInstanceControlBuilderRef ref)
        create,
  ) {
    return FormInstanceControlBuilderProvider._internal(
      (ref) => create(ref as FormInstanceControlBuilderRef),
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
    return other is FormInstanceControlBuilderProvider &&
        other.formMetadata == formMetadata;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, formMetadata.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FormInstanceControlBuilderRef
    on AutoDisposeFutureProviderRef<FormInstanceControlBuilder> {
  /// The parameter `formMetadata` of this provider.
  FormMetadata get formMetadata;
}

class _FormInstanceControlBuilderProviderElement
    extends AutoDisposeFutureProviderElement<FormInstanceControlBuilder>
    with FormInstanceControlBuilderRef {
  _FormInstanceControlBuilderProviderElement(super.provider);

  @override
  FormMetadata get formMetadata =>
      (origin as FormInstanceControlBuilderProvider).formMetadata;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
