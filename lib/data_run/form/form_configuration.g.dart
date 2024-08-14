// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_configuration.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formConfigurationHash() => r'd219895f8097e17515fb4d5be1522a06c04f2ae5';

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
  FormConfigurationProvider call({
    required String form,
    int? formVersion,
  }) {
    return FormConfigurationProvider(
      form: form,
      formVersion: formVersion,
    );
  }

  @override
  FormConfigurationProvider getProviderOverride(
    covariant FormConfigurationProvider provider,
  ) {
    return call(
      form: provider.form,
      formVersion: provider.formVersion,
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
  FormConfigurationProvider({
    required String form,
    int? formVersion,
  }) : this._internal(
          (ref) => formConfiguration(
            ref as FormConfigurationRef,
            form: form,
            formVersion: formVersion,
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
          formVersion: formVersion,
        );

  FormConfigurationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.form,
    required this.formVersion,
  }) : super.internal();

  final String form;
  final int? formVersion;

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
        formVersion: formVersion,
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
        other.formVersion == formVersion;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, form.hashCode);
    hash = _SystemHash.combine(hash, formVersion.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FormConfigurationRef on AutoDisposeFutureProviderRef<FormConfiguration> {
  /// The parameter `form` of this provider.
  String get form;

  /// The parameter `formVersion` of this provider.
  int? get formVersion;
}

class _FormConfigurationProviderElement
    extends AutoDisposeFutureProviderElement<FormConfiguration>
    with FormConfigurationRef {
  _FormConfigurationProviderElement(super.provider);

  @override
  String get form => (origin as FormConfigurationProvider).form;
  @override
  int? get formVersion => (origin as FormConfigurationProvider).formVersion;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
