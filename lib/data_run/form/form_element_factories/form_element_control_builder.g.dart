// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_element_control_builder.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formElementControlBuilderHash() =>
    r'd62c0de88d59cc71b5f478075ba797bb0fadf1cd';

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

/// See also [formElementControlBuilder].
@ProviderFor(formElementControlBuilder)
const formElementControlBuilderProvider = FormElementControlBuilderFamily();

/// See also [formElementControlBuilder].
class FormElementControlBuilderFamily extends Family {
  /// See also [formElementControlBuilder].
  const FormElementControlBuilderFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'formElementControlBuilderProvider';

  /// See also [formElementControlBuilder].
  FormElementControlBuilderProvider call({
    required FormMetadata formMetadata,
  }) {
    return FormElementControlBuilderProvider(
      formMetadata: formMetadata,
    );
  }

  @visibleForOverriding
  @override
  FormElementControlBuilderProvider getProviderOverride(
    covariant FormElementControlBuilderProvider provider,
  ) {
    return call(
      formMetadata: provider.formMetadata,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<FormElementControlBuilder> Function(
              FormElementControlBuilderRef ref)
          create) {
    return _$FormElementControlBuilderFamilyOverride(this, create);
  }
}

class _$FormElementControlBuilderFamilyOverride implements FamilyOverride {
  _$FormElementControlBuilderFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<FormElementControlBuilder> Function(
      FormElementControlBuilderRef ref) create;

  @override
  final FormElementControlBuilderFamily overriddenFamily;

  @override
  FormElementControlBuilderProvider getProviderOverride(
    covariant FormElementControlBuilderProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [formElementControlBuilder].
class FormElementControlBuilderProvider
    extends AutoDisposeFutureProvider<FormElementControlBuilder> {
  /// See also [formElementControlBuilder].
  FormElementControlBuilderProvider({
    required FormMetadata formMetadata,
  }) : this._internal(
          (ref) => formElementControlBuilder(
            ref as FormElementControlBuilderRef,
            formMetadata: formMetadata,
          ),
          from: formElementControlBuilderProvider,
          name: r'formElementControlBuilderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formElementControlBuilderHash,
          dependencies: FormElementControlBuilderFamily._dependencies,
          allTransitiveDependencies:
              FormElementControlBuilderFamily._allTransitiveDependencies,
          formMetadata: formMetadata,
        );

  FormElementControlBuilderProvider._internal(
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
    FutureOr<FormElementControlBuilder> Function(
            FormElementControlBuilderRef ref)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FormElementControlBuilderProvider._internal(
        (ref) => create(ref as FormElementControlBuilderRef),
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
  AutoDisposeFutureProviderElement<FormElementControlBuilder> createElement() {
    return _FormElementControlBuilderProviderElement(this);
  }

  FormElementControlBuilderProvider _copyWith(
    FutureOr<FormElementControlBuilder> Function(
            FormElementControlBuilderRef ref)
        create,
  ) {
    return FormElementControlBuilderProvider._internal(
      (ref) => create(ref as FormElementControlBuilderRef),
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
    return other is FormElementControlBuilderProvider &&
        other.formMetadata == formMetadata;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, formMetadata.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FormElementControlBuilderRef
    on AutoDisposeFutureProviderRef<FormElementControlBuilder> {
  /// The parameter `formMetadata` of this provider.
  FormMetadata get formMetadata;
}

class _FormElementControlBuilderProviderElement
    extends AutoDisposeFutureProviderElement<FormElementControlBuilder>
    with FormElementControlBuilderRef {
  _FormElementControlBuilderProviderElement(super.provider);

  @override
  FormMetadata get formMetadata =>
      (origin as FormElementControlBuilderProvider).formMetadata;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
