// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_view_config.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formViewContentModelHash() =>
    r'7025da2f93880fd1ec6f02620e7e9ab9503c3a55';

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

/// See also [formViewContentModel].
@ProviderFor(formViewContentModel)
const formViewContentModelProvider = FormViewContentModelFamily();

/// See also [formViewContentModel].
class FormViewContentModelFamily extends Family {
  /// See also [formViewContentModel].
  const FormViewContentModelFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'formViewContentModelProvider';

  /// See also [formViewContentModel].
  FormViewContentModelProvider call({
    required FormMetadata formMetadata,
  }) {
    return FormViewContentModelProvider(
      formMetadata: formMetadata,
    );
  }

  @visibleForOverriding
  @override
  FormViewContentModelProvider getProviderOverride(
    covariant FormViewContentModelProvider provider,
  ) {
    return call(
      formMetadata: provider.formMetadata,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FormViewContentModel Function(FormViewContentModelRef ref) create) {
    return _$FormViewContentModelFamilyOverride(this, create);
  }
}

class _$FormViewContentModelFamilyOverride implements FamilyOverride {
  _$FormViewContentModelFamilyOverride(this.overriddenFamily, this.create);

  final FormViewContentModel Function(FormViewContentModelRef ref) create;

  @override
  final FormViewContentModelFamily overriddenFamily;

  @override
  FormViewContentModelProvider getProviderOverride(
    covariant FormViewContentModelProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [formViewContentModel].
class FormViewContentModelProvider
    extends AutoDisposeProvider<FormViewContentModel> {
  /// See also [formViewContentModel].
  FormViewContentModelProvider({
    required FormMetadata formMetadata,
  }) : this._internal(
          (ref) => formViewContentModel(
            ref as FormViewContentModelRef,
            formMetadata: formMetadata,
          ),
          from: formViewContentModelProvider,
          name: r'formViewContentModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formViewContentModelHash,
          dependencies: FormViewContentModelFamily._dependencies,
          allTransitiveDependencies:
              FormViewContentModelFamily._allTransitiveDependencies,
          formMetadata: formMetadata,
        );

  FormViewContentModelProvider._internal(
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
    FormViewContentModel Function(FormViewContentModelRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FormViewContentModelProvider._internal(
        (ref) => create(ref as FormViewContentModelRef),
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
  AutoDisposeProviderElement<FormViewContentModel> createElement() {
    return _FormViewContentModelProviderElement(this);
  }

  FormViewContentModelProvider _copyWith(
    FormViewContentModel Function(FormViewContentModelRef ref) create,
  ) {
    return FormViewContentModelProvider._internal(
      (ref) => create(ref as FormViewContentModelRef),
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
    return other is FormViewContentModelProvider &&
        other.formMetadata == formMetadata;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, formMetadata.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FormViewContentModelRef on AutoDisposeProviderRef<FormViewContentModel> {
  /// The parameter `formMetadata` of this provider.
  FormMetadata get formMetadata;
}

class _FormViewContentModelProviderElement
    extends AutoDisposeProviderElement<FormViewContentModel>
    with FormViewContentModelRef {
  _FormViewContentModelProviderElement(super.provider);

  @override
  FormMetadata get formMetadata =>
      (origin as FormViewContentModelProvider).formMetadata;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
