// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_element_builder.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formElementBuilderHash() =>
    r'5e65bf80f09291504c8ad42b62718eec17a1cbaa';

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

/// See also [formElementBuilder].
@ProviderFor(formElementBuilder)
const formElementBuilderProvider = FormElementBuilderFamily();

/// See also [formElementBuilder].
class FormElementBuilderFamily extends Family {
  /// See also [formElementBuilder].
  const FormElementBuilderFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'formElementBuilderProvider';

  /// See also [formElementBuilder].
  FormElementBuilderProvider call({
    required FormMetadata formMetadata,
  }) {
    return FormElementBuilderProvider(
      formMetadata: formMetadata,
    );
  }

  @visibleForOverriding
  @override
  FormElementBuilderProvider getProviderOverride(
    covariant FormElementBuilderProvider provider,
  ) {
    return call(
      formMetadata: provider.formMetadata,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<FormElementBuilder> Function(FormElementBuilderRef ref) create) {
    return _$FormElementBuilderFamilyOverride(this, create);
  }
}

class _$FormElementBuilderFamilyOverride implements FamilyOverride {
  _$FormElementBuilderFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<FormElementBuilder> Function(FormElementBuilderRef ref) create;

  @override
  final FormElementBuilderFamily overriddenFamily;

  @override
  FormElementBuilderProvider getProviderOverride(
    covariant FormElementBuilderProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [formElementBuilder].
class FormElementBuilderProvider
    extends AutoDisposeFutureProvider<FormElementBuilder> {
  /// See also [formElementBuilder].
  FormElementBuilderProvider({
    required FormMetadata formMetadata,
  }) : this._internal(
          (ref) => formElementBuilder(
            ref as FormElementBuilderRef,
            formMetadata: formMetadata,
          ),
          from: formElementBuilderProvider,
          name: r'formElementBuilderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formElementBuilderHash,
          dependencies: FormElementBuilderFamily._dependencies,
          allTransitiveDependencies:
              FormElementBuilderFamily._allTransitiveDependencies,
          formMetadata: formMetadata,
        );

  FormElementBuilderProvider._internal(
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
    FutureOr<FormElementBuilder> Function(FormElementBuilderRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FormElementBuilderProvider._internal(
        (ref) => create(ref as FormElementBuilderRef),
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
  AutoDisposeFutureProviderElement<FormElementBuilder> createElement() {
    return _FormElementBuilderProviderElement(this);
  }

  FormElementBuilderProvider _copyWith(
    FutureOr<FormElementBuilder> Function(FormElementBuilderRef ref) create,
  ) {
    return FormElementBuilderProvider._internal(
      (ref) => create(ref as FormElementBuilderRef),
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
    return other is FormElementBuilderProvider &&
        other.formMetadata == formMetadata;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, formMetadata.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FormElementBuilderRef
    on AutoDisposeFutureProviderRef<FormElementBuilder> {
  /// The parameter `formMetadata` of this provider.
  FormMetadata get formMetadata;
}

class _FormElementBuilderProviderElement
    extends AutoDisposeFutureProviderElement<FormElementBuilder>
    with FormElementBuilderRef {
  _FormElementBuilderProviderElement(super.provider);

  @override
  FormMetadata get formMetadata =>
      (origin as FormElementBuilderProvider).formMetadata;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
