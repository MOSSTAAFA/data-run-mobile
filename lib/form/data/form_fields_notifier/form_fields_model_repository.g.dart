// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_fields_model_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formFieldsModelRepositoryHash() =>
    r'078a106b29129775e5b61fab447d829891346c76';

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

abstract class _$FormFieldsModelRepository
    extends BuildlessAutoDisposeNotifier<FormFieldsModel> {
  late final FormValueStore? formValueStore;
  late final FieldErrorMessageProvider fieldErrorMessageProvider;
  late final DisplayNameProvider displayNameProvider;
  late final DataEntryRepository? dataEntryRepository;

  FormFieldsModel build({
    FormValueStore? formValueStore,
    required FieldErrorMessageProvider fieldErrorMessageProvider,
    required DisplayNameProvider displayNameProvider,
    DataEntryRepository? dataEntryRepository,
  });
}

/// See also [FormFieldsModelRepository].
@ProviderFor(FormFieldsModelRepository)
const formFieldsModelRepositoryProvider = FormFieldsModelRepositoryFamily();

/// See also [FormFieldsModelRepository].
class FormFieldsModelRepositoryFamily extends Family<FormFieldsModel> {
  /// See also [FormFieldsModelRepository].
  const FormFieldsModelRepositoryFamily();

  /// See also [FormFieldsModelRepository].
  FormFieldsModelRepositoryProvider call({
    FormValueStore? formValueStore,
    required FieldErrorMessageProvider fieldErrorMessageProvider,
    required DisplayNameProvider displayNameProvider,
    DataEntryRepository? dataEntryRepository,
  }) {
    return FormFieldsModelRepositoryProvider(
      formValueStore: formValueStore,
      fieldErrorMessageProvider: fieldErrorMessageProvider,
      displayNameProvider: displayNameProvider,
      dataEntryRepository: dataEntryRepository,
    );
  }

  @override
  FormFieldsModelRepositoryProvider getProviderOverride(
    covariant FormFieldsModelRepositoryProvider provider,
  ) {
    return call(
      formValueStore: provider.formValueStore,
      fieldErrorMessageProvider: provider.fieldErrorMessageProvider,
      displayNameProvider: provider.displayNameProvider,
      dataEntryRepository: provider.dataEntryRepository,
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
  String? get name => r'formFieldsModelRepositoryProvider';
}

/// See also [FormFieldsModelRepository].
class FormFieldsModelRepositoryProvider extends AutoDisposeNotifierProviderImpl<
    FormFieldsModelRepository, FormFieldsModel> {
  /// See also [FormFieldsModelRepository].
  FormFieldsModelRepositoryProvider({
    this.formValueStore,
    required this.fieldErrorMessageProvider,
    required this.displayNameProvider,
    this.dataEntryRepository,
  }) : super.internal(
          () => FormFieldsModelRepository()
            ..formValueStore = formValueStore
            ..fieldErrorMessageProvider = fieldErrorMessageProvider
            ..displayNameProvider = displayNameProvider
            ..dataEntryRepository = dataEntryRepository,
          from: formFieldsModelRepositoryProvider,
          name: r'formFieldsModelRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formFieldsModelRepositoryHash,
          dependencies: FormFieldsModelRepositoryFamily._dependencies,
          allTransitiveDependencies:
              FormFieldsModelRepositoryFamily._allTransitiveDependencies,
        );

  final FormValueStore? formValueStore;
  final FieldErrorMessageProvider fieldErrorMessageProvider;
  final DisplayNameProvider displayNameProvider;
  final DataEntryRepository? dataEntryRepository;

  @override
  bool operator ==(Object other) {
    return other is FormFieldsModelRepositoryProvider &&
        other.formValueStore == formValueStore &&
        other.fieldErrorMessageProvider == fieldErrorMessageProvider &&
        other.displayNameProvider == displayNameProvider &&
        other.dataEntryRepository == dataEntryRepository;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, formValueStore.hashCode);
    hash = _SystemHash.combine(hash, fieldErrorMessageProvider.hashCode);
    hash = _SystemHash.combine(hash, displayNameProvider.hashCode);
    hash = _SystemHash.combine(hash, dataEntryRepository.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FormFieldsModel runNotifierBuild(
    covariant FormFieldsModelRepository notifier,
  ) {
    return notifier.build(
      formValueStore: formValueStore,
      fieldErrorMessageProvider: fieldErrorMessageProvider,
      displayNameProvider: displayNameProvider,
      dataEntryRepository: dataEntryRepository,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
