// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_configuration.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formVersionHash() => r'fabef7cbe82f2753dabd32fe81109eace8fdc0df';

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

/// See also [formVersion].
@ProviderFor(formVersion)
const formVersionProvider = FormVersionFamily();

/// See also [formVersion].
class FormVersionFamily extends Family<AsyncValue<int>> {
  /// See also [formVersion].
  const FormVersionFamily();

  /// See also [formVersion].
  FormVersionProvider call(
    String form, {
    String? submissionUid,
  }) {
    return FormVersionProvider(
      form,
      submissionUid: submissionUid,
    );
  }

  @override
  FormVersionProvider getProviderOverride(
    covariant FormVersionProvider provider,
  ) {
    return call(
      provider.form,
      submissionUid: provider.submissionUid,
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
  String? get name => r'formVersionProvider';
}

/// See also [formVersion].
class FormVersionProvider extends AutoDisposeFutureProvider<int> {
  /// See also [formVersion].
  FormVersionProvider(
    String form, {
    String? submissionUid,
  }) : this._internal(
          (ref) => formVersion(
            ref as FormVersionRef,
            form,
            submissionUid: submissionUid,
          ),
          from: formVersionProvider,
          name: r'formVersionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formVersionHash,
          dependencies: FormVersionFamily._dependencies,
          allTransitiveDependencies:
              FormVersionFamily._allTransitiveDependencies,
          form: form,
          submissionUid: submissionUid,
        );

  FormVersionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.form,
    required this.submissionUid,
  }) : super.internal();

  final String form;
  final String? submissionUid;

  @override
  Override overrideWith(
    FutureOr<int> Function(FormVersionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FormVersionProvider._internal(
        (ref) => create(ref as FormVersionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        form: form,
        submissionUid: submissionUid,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _FormVersionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FormVersionProvider &&
        other.form == form &&
        other.submissionUid == submissionUid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, form.hashCode);
    hash = _SystemHash.combine(hash, submissionUid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FormVersionRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `form` of this provider.
  String get form;

  /// The parameter `submissionUid` of this provider.
  String? get submissionUid;
}

class _FormVersionProviderElement extends AutoDisposeFutureProviderElement<int>
    with FormVersionRef {
  _FormVersionProviderElement(super.provider);

  @override
  String get form => (origin as FormVersionProvider).form;
  @override
  String? get submissionUid => (origin as FormVersionProvider).submissionUid;
}

String _$formConfigurationHash() => r'58de47245dfefc24be95473697dbf2c62d0333b2';

/// See also [formConfiguration].
@ProviderFor(formConfiguration)
const formConfigurationProvider = FormConfigurationFamily();

/// See also [formConfiguration].
class FormConfigurationFamily extends Family<AsyncValue<FormConfiguration>> {
  /// See also [formConfiguration].
  const FormConfigurationFamily();

  /// See also [formConfiguration].
  FormConfigurationProvider call(
    String form,
  ) {
    return FormConfigurationProvider(
      form,
    );
  }

  @override
  FormConfigurationProvider getProviderOverride(
    covariant FormConfigurationProvider provider,
  ) {
    return call(
      provider.form,
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
  String? get name => r'formConfigurationProvider';
}

/// See also [formConfiguration].
class FormConfigurationProvider
    extends AutoDisposeFutureProvider<FormConfiguration> {
  /// See also [formConfiguration].
  FormConfigurationProvider(
    String form,
  ) : this._internal(
          (ref) => formConfiguration(
            ref as FormConfigurationRef,
            form,
          ),
          from: formConfigurationProvider,
          name: r'formConfigurationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formConfigurationHash,
          dependencies: FormConfigurationFamily._dependencies,
          allTransitiveDependencies:
              FormConfigurationFamily._allTransitiveDependencies,
          form: form,
        );

  FormConfigurationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.form,
  }) : super.internal();

  final String form;

  @override
  Override overrideWith(
    FutureOr<FormConfiguration> Function(FormConfigurationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FormConfigurationProvider._internal(
        (ref) => create(ref as FormConfigurationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        form: form,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<FormConfiguration> createElement() {
    return _FormConfigurationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FormConfigurationProvider && other.form == form;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, form.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FormConfigurationRef on AutoDisposeFutureProviderRef<FormConfiguration> {
  /// The parameter `form` of this provider.
  String get form;
}

class _FormConfigurationProviderElement
    extends AutoDisposeFutureProviderElement<FormConfiguration>
    with FormConfigurationRef {
  _FormConfigurationProviderElement(super.provider);

  @override
  String get form => (origin as FormConfigurationProvider).form;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
