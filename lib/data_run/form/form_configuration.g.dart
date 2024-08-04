// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_configuration.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formConfigurationHash() => r'153f487f0e7aa14460bdd02c3c3e2cb3034b7fec';

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

/// See also [formConfiguration].
@ProviderFor(formConfiguration)
const formConfigurationProvider = FormConfigurationFamily();

/// See also [formConfiguration].
class FormConfigurationFamily extends Family<AsyncValue<FormConfiguration>> {
  /// See also [formConfiguration].
  const FormConfigurationFamily();

  /// See also [formConfiguration].
  FormConfigurationProvider call(
    String form, [
    int? version,
  ]) {
    return FormConfigurationProvider(
      form,
      version,
    );
  }

  @override
  FormConfigurationProvider getProviderOverride(
    covariant FormConfigurationProvider provider,
  ) {
    return call(
      provider.form,
      provider.version,
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
    String form, [
    int? version,
  ]) : this._internal(
          (ref) => formConfiguration(
            ref as FormConfigurationRef,
            form,
            version,
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
          version: version,
        );

  FormConfigurationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.form,
    required this.version,
  }) : super.internal();

  final String form;
  final int? version;

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
        version: version,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<FormConfiguration> createElement() {
    return _FormConfigurationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FormConfigurationProvider &&
        other.form == form &&
        other.version == version;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, form.hashCode);
    hash = _SystemHash.combine(hash, version.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FormConfigurationRef on AutoDisposeFutureProviderRef<FormConfiguration> {
  /// The parameter `form` of this provider.
  String get form;

  /// The parameter `version` of this provider.
  int? get version;
}

class _FormConfigurationProviderElement
    extends AutoDisposeFutureProviderElement<FormConfiguration>
    with FormConfigurationRef {
  _FormConfigurationProviderElement(super.provider);

  @override
  String get form => (origin as FormConfigurationProvider).form;
  @override
  int? get version => (origin as FormConfigurationProvider).version;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
