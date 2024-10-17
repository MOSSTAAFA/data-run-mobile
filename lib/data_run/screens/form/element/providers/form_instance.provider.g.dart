// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_instance.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$submissionEditStatusHash() =>
    r'f7954bffcf640f4d5d00114f4615c83fbd284e75';

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

/// See also [submissionEditStatus].
@ProviderFor(submissionEditStatus)
const submissionEditStatusProvider = SubmissionEditStatusFamily();

/// See also [submissionEditStatus].
class SubmissionEditStatusFamily extends Family {
  /// See also [submissionEditStatus].
  const SubmissionEditStatusFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'submissionEditStatusProvider';

  /// See also [submissionEditStatus].
  SubmissionEditStatusProvider call({
    required String submission,
  }) {
    return SubmissionEditStatusProvider(
      submission: submission,
    );
  }

  @visibleForOverriding
  @override
  SubmissionEditStatusProvider getProviderOverride(
    covariant SubmissionEditStatusProvider provider,
  ) {
    return call(
      submission: provider.submission,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<bool> Function(SubmissionEditStatusRef ref) create) {
    return _$SubmissionEditStatusFamilyOverride(this, create);
  }
}

class _$SubmissionEditStatusFamilyOverride implements FamilyOverride {
  _$SubmissionEditStatusFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<bool> Function(SubmissionEditStatusRef ref) create;

  @override
  final SubmissionEditStatusFamily overriddenFamily;

  @override
  SubmissionEditStatusProvider getProviderOverride(
    covariant SubmissionEditStatusProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [submissionEditStatus].
class SubmissionEditStatusProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [submissionEditStatus].
  SubmissionEditStatusProvider({
    required String submission,
  }) : this._internal(
          (ref) => submissionEditStatus(
            ref as SubmissionEditStatusRef,
            submission: submission,
          ),
          from: submissionEditStatusProvider,
          name: r'submissionEditStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$submissionEditStatusHash,
          dependencies: SubmissionEditStatusFamily._dependencies,
          allTransitiveDependencies:
              SubmissionEditStatusFamily._allTransitiveDependencies,
          submission: submission,
        );

  SubmissionEditStatusProvider._internal(
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
    FutureOr<bool> Function(SubmissionEditStatusRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubmissionEditStatusProvider._internal(
        (ref) => create(ref as SubmissionEditStatusRef),
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
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _SubmissionEditStatusProviderElement(this);
  }

  SubmissionEditStatusProvider _copyWith(
    FutureOr<bool> Function(SubmissionEditStatusRef ref) create,
  ) {
    return SubmissionEditStatusProvider._internal(
      (ref) => create(ref as SubmissionEditStatusRef),
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
    return other is SubmissionEditStatusProvider &&
        other.submission == submission;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, submission.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SubmissionEditStatusRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `submission` of this provider.
  String get submission;
}

class _SubmissionEditStatusProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with SubmissionEditStatusRef {
  _SubmissionEditStatusProviderElement(super.provider);

  @override
  String get submission => (origin as SubmissionEditStatusProvider).submission;
}

String _$deviceInfoServiceHash() => r'1d77fcc69a9ffefcc2d342a2e0dfdd413ffc02af';

/// See also [deviceInfoService].
@ProviderFor(deviceInfoService)
final deviceInfoServiceProvider =
    AutoDisposeFutureProvider<AndroidDeviceInfoService>.internal(
  deviceInfoService,
  name: r'deviceInfoServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deviceInfoServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeviceInfoServiceRef
    = AutoDisposeFutureProviderRef<AndroidDeviceInfoService>;
String _$formInstanceServiceHash() =>
    r'164ebe81d382cdb1f3140f37d88be79c8eb3c1cc';

/// See also [formInstanceService].
@ProviderFor(formInstanceService)
const formInstanceServiceProvider = FormInstanceServiceFamily();

/// See also [formInstanceService].
class FormInstanceServiceFamily extends Family {
  /// See also [formInstanceService].
  const FormInstanceServiceFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'formInstanceServiceProvider';

  /// See also [formInstanceService].
  FormInstanceServiceProvider call({
    required FormMetadata formMetaData,
    String? orgUnit,
  }) {
    return FormInstanceServiceProvider(
      formMetaData: formMetaData,
      orgUnit: orgUnit,
    );
  }

  @visibleForOverriding
  @override
  FormInstanceServiceProvider getProviderOverride(
    covariant FormInstanceServiceProvider provider,
  ) {
    return call(
      formMetaData: provider.formMetaData,
      orgUnit: provider.orgUnit,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<FormInstanceService> Function(FormInstanceServiceRef ref)
          create) {
    return _$FormInstanceServiceFamilyOverride(this, create);
  }
}

class _$FormInstanceServiceFamilyOverride implements FamilyOverride {
  _$FormInstanceServiceFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<FormInstanceService> Function(FormInstanceServiceRef ref)
      create;

  @override
  final FormInstanceServiceFamily overriddenFamily;

  @override
  FormInstanceServiceProvider getProviderOverride(
    covariant FormInstanceServiceProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [formInstanceService].
class FormInstanceServiceProvider
    extends AutoDisposeFutureProvider<FormInstanceService> {
  /// See also [formInstanceService].
  FormInstanceServiceProvider({
    required FormMetadata formMetaData,
    String? orgUnit,
  }) : this._internal(
          (ref) => formInstanceService(
            ref as FormInstanceServiceRef,
            formMetaData: formMetaData,
            orgUnit: orgUnit,
          ),
          from: formInstanceServiceProvider,
          name: r'formInstanceServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formInstanceServiceHash,
          dependencies: FormInstanceServiceFamily._dependencies,
          allTransitiveDependencies:
              FormInstanceServiceFamily._allTransitiveDependencies,
          formMetaData: formMetaData,
          orgUnit: orgUnit,
        );

  FormInstanceServiceProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.formMetaData,
    required this.orgUnit,
  }) : super.internal();

  final FormMetadata formMetaData;
  final String? orgUnit;

  @override
  Override overrideWith(
    FutureOr<FormInstanceService> Function(FormInstanceServiceRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FormInstanceServiceProvider._internal(
        (ref) => create(ref as FormInstanceServiceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        formMetaData: formMetaData,
        orgUnit: orgUnit,
      ),
    );
  }

  @override
  ({
    FormMetadata formMetaData,
    String? orgUnit,
  }) get argument {
    return (
      formMetaData: formMetaData,
      orgUnit: orgUnit,
    );
  }

  @override
  AutoDisposeFutureProviderElement<FormInstanceService> createElement() {
    return _FormInstanceServiceProviderElement(this);
  }

  FormInstanceServiceProvider _copyWith(
    FutureOr<FormInstanceService> Function(FormInstanceServiceRef ref) create,
  ) {
    return FormInstanceServiceProvider._internal(
      (ref) => create(ref as FormInstanceServiceRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      formMetaData: formMetaData,
      orgUnit: orgUnit,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FormInstanceServiceProvider &&
        other.formMetaData == formMetaData &&
        other.orgUnit == orgUnit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, formMetaData.hashCode);
    hash = _SystemHash.combine(hash, orgUnit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FormInstanceServiceRef
    on AutoDisposeFutureProviderRef<FormInstanceService> {
  /// The parameter `formMetaData` of this provider.
  FormMetadata get formMetaData;

  /// The parameter `orgUnit` of this provider.
  String? get orgUnit;
}

class _FormInstanceServiceProviderElement
    extends AutoDisposeFutureProviderElement<FormInstanceService>
    with FormInstanceServiceRef {
  _FormInstanceServiceProviderElement(super.provider);

  @override
  FormMetadata get formMetaData =>
      (origin as FormInstanceServiceProvider).formMetaData;
  @override
  String? get orgUnit => (origin as FormInstanceServiceProvider).orgUnit;
}

String _$formInstanceHash() => r'c826079f50f92898089ea637b9ab6774038ded6a';

/// See also [formInstance].
@ProviderFor(formInstance)
const formInstanceProvider = FormInstanceFamily();

/// See also [formInstance].
class FormInstanceFamily extends Family {
  /// See also [formInstance].
  const FormInstanceFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'formInstanceProvider';

  /// See also [formInstance].
  FormInstanceProvider call({
    required FormMetadata formMetaData,
  }) {
    return FormInstanceProvider(
      formMetaData: formMetaData,
    );
  }

  @visibleForOverriding
  @override
  FormInstanceProvider getProviderOverride(
    covariant FormInstanceProvider provider,
  ) {
    return call(
      formMetaData: provider.formMetaData,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<FormInstance> Function(FormInstanceRef ref) create) {
    return _$FormInstanceFamilyOverride(this, create);
  }
}

class _$FormInstanceFamilyOverride implements FamilyOverride {
  _$FormInstanceFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<FormInstance> Function(FormInstanceRef ref) create;

  @override
  final FormInstanceFamily overriddenFamily;

  @override
  FormInstanceProvider getProviderOverride(
    covariant FormInstanceProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [formInstance].
class FormInstanceProvider extends AutoDisposeFutureProvider<FormInstance> {
  /// See also [formInstance].
  FormInstanceProvider({
    required FormMetadata formMetaData,
  }) : this._internal(
          (ref) => formInstance(
            ref as FormInstanceRef,
            formMetaData: formMetaData,
          ),
          from: formInstanceProvider,
          name: r'formInstanceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formInstanceHash,
          dependencies: FormInstanceFamily._dependencies,
          allTransitiveDependencies:
              FormInstanceFamily._allTransitiveDependencies,
          formMetaData: formMetaData,
        );

  FormInstanceProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.formMetaData,
  }) : super.internal();

  final FormMetadata formMetaData;

  @override
  Override overrideWith(
    FutureOr<FormInstance> Function(FormInstanceRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FormInstanceProvider._internal(
        (ref) => create(ref as FormInstanceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        formMetaData: formMetaData,
      ),
    );
  }

  @override
  ({
    FormMetadata formMetaData,
  }) get argument {
    return (formMetaData: formMetaData,);
  }

  @override
  AutoDisposeFutureProviderElement<FormInstance> createElement() {
    return _FormInstanceProviderElement(this);
  }

  FormInstanceProvider _copyWith(
    FutureOr<FormInstance> Function(FormInstanceRef ref) create,
  ) {
    return FormInstanceProvider._internal(
      (ref) => create(ref as FormInstanceRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      formMetaData: formMetaData,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FormInstanceProvider && other.formMetaData == formMetaData;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, formMetaData.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FormInstanceRef on AutoDisposeFutureProviderRef<FormInstance> {
  /// The parameter `formMetaData` of this provider.
  FormMetadata get formMetaData;
}

class _FormInstanceProviderElement
    extends AutoDisposeFutureProviderElement<FormInstance>
    with FormInstanceRef {
  _FormInstanceProviderElement(super.provider);

  @override
  FormMetadata get formMetaData =>
      (origin as FormInstanceProvider).formMetaData;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
