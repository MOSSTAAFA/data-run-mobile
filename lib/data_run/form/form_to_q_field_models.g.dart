// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_to_q_field_models.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formToQFieldModelsHash() =>
    r'285ed325c163197893007d36a311eefd8fe25f1c';

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

/// See also [formToQFieldModels].
@ProviderFor(formToQFieldModels)
const formToQFieldModelsProvider = FormToQFieldModelsFamily();

/// See also [formToQFieldModels].
class FormToQFieldModelsFamily
    extends Family<AsyncValue<IMap<String, QFieldModel>>> {
  /// See also [formToQFieldModels].
  const FormToQFieldModelsFamily();

  /// See also [formToQFieldModels].
  FormToQFieldModelsProvider call({
    required String form,
  }) {
    return FormToQFieldModelsProvider(
      form: form,
    );
  }

  @override
  FormToQFieldModelsProvider getProviderOverride(
    covariant FormToQFieldModelsProvider provider,
  ) {
    return call(
      form: provider.form,
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
  String? get name => r'formToQFieldModelsProvider';
}

/// See also [formToQFieldModels].
class FormToQFieldModelsProvider
    extends AutoDisposeFutureProvider<IMap<String, QFieldModel>> {
  /// See also [formToQFieldModels].
  FormToQFieldModelsProvider({
    required String form,
  }) : this._internal(
          (ref) => formToQFieldModels(
            ref as FormToQFieldModelsRef,
            form: form,
          ),
          from: formToQFieldModelsProvider,
          name: r'formToQFieldModelsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formToQFieldModelsHash,
          dependencies: FormToQFieldModelsFamily._dependencies,
          allTransitiveDependencies:
              FormToQFieldModelsFamily._allTransitiveDependencies,
          form: form,
        );

  FormToQFieldModelsProvider._internal(
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
    FutureOr<IMap<String, QFieldModel>> Function(FormToQFieldModelsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FormToQFieldModelsProvider._internal(
        (ref) => create(ref as FormToQFieldModelsRef),
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
  AutoDisposeFutureProviderElement<IMap<String, QFieldModel>> createElement() {
    return _FormToQFieldModelsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FormToQFieldModelsProvider && other.form == form;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, form.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FormToQFieldModelsRef
    on AutoDisposeFutureProviderRef<IMap<String, QFieldModel>> {
  /// The parameter `form` of this provider.
  String get form;
}

class _FormToQFieldModelsProviderElement
    extends AutoDisposeFutureProviderElement<IMap<String, QFieldModel>>
    with FormToQFieldModelsRef {
  _FormToQFieldModelsProviderElement(super.provider);

  @override
  String get form => (origin as FormToQFieldModelsProvider).form;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
