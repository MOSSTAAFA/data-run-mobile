// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_elements_factories.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formInitialDataHash() => r'c09ca62d53ea0123db78a0a2d8b81d27097eb87f';

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

/// See also [formInitialData].
@ProviderFor(formInitialData)
const formInitialDataProvider = FormInitialDataFamily();

/// See also [formInitialData].
class FormInitialDataFamily extends Family {
  /// See also [formInitialData].
  const FormInitialDataFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'formInitialDataProvider';

  /// See also [formInitialData].
  FormInitialDataProvider call({
    required String submission,
  }) {
    return FormInitialDataProvider(
      submission: submission,
    );
  }

  @visibleForOverriding
  @override
  FormInitialDataProvider getProviderOverride(
    covariant FormInitialDataProvider provider,
  ) {
    return call(
      submission: provider.submission,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<Map<String, dynamic>?> Function(FormInitialDataRef ref) create) {
    return _$FormInitialDataFamilyOverride(this, create);
  }
}

class _$FormInitialDataFamilyOverride implements FamilyOverride {
  _$FormInitialDataFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<Map<String, dynamic>?> Function(FormInitialDataRef ref) create;

  @override
  final FormInitialDataFamily overriddenFamily;

  @override
  FormInitialDataProvider getProviderOverride(
    covariant FormInitialDataProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [formInitialData].
class FormInitialDataProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>?> {
  /// See also [formInitialData].
  FormInitialDataProvider({
    required String submission,
  }) : this._internal(
          (ref) => formInitialData(
            ref as FormInitialDataRef,
            submission: submission,
          ),
          from: formInitialDataProvider,
          name: r'formInitialDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formInitialDataHash,
          dependencies: FormInitialDataFamily._dependencies,
          allTransitiveDependencies:
              FormInitialDataFamily._allTransitiveDependencies,
          submission: submission,
        );

  FormInitialDataProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.submission,
  }) : super.internal();

  final String submission;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>?> Function(FormInitialDataRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FormInitialDataProvider._internal(
        (ref) => create(ref as FormInitialDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        submission: submission,
      ),
    );
  }

  @override
  ({
    String submission,
  }) get argument {
    return (submission: submission,);
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>?> createElement() {
    return _FormInitialDataProviderElement(this);
  }

  FormInitialDataProvider _copyWith(
    FutureOr<Map<String, dynamic>?> Function(FormInitialDataRef ref) create,
  ) {
    return FormInitialDataProvider._internal(
      (ref) => create(ref as FormInitialDataRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      submission: submission,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FormInitialDataProvider && other.submission == submission;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, submission.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FormInitialDataRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>?> {
  /// The parameter `submission` of this provider.
  String get submission;
}

class _FormInitialDataProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>?>
    with FormInitialDataRef {
  _FormInitialDataProviderElement(super.provider);

  @override
  String get submission => (origin as FormInitialDataProvider).submission;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
