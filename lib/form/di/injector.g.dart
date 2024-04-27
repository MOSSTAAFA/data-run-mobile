// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formRepositoryHash() => r'987060202a447a369bf1520e2de32e7282dd7d1c';

/// See also [formRepository].
@ProviderFor(formRepository)
final formRepositoryProvider = AutoDisposeProvider<FormRepository>.internal(
  formRepository,
  name: r'formRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FormRepositoryRef = AutoDisposeProviderRef<FormRepository>;
String _$dataEntryRepositoryHash() =>
    r'3a09ee34dd7fbcba020c30b6322b9748ccf4f16b';

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

typedef _DataEntryRepositoryRef = AutoDisposeProviderRef<DataEntryRepository>;

/// See also [_dataEntryRepository].
@ProviderFor(_dataEntryRepository)
const _dataEntryRepositoryProvider = _DataEntryRepositoryFamily();

/// See also [_dataEntryRepository].
class _DataEntryRepositoryFamily extends Family<DataEntryRepository> {
  /// See also [_dataEntryRepository].
  const _DataEntryRepositoryFamily();

  /// See also [_dataEntryRepository].
  _DataEntryRepositoryProvider call({
    EntryMode? entryMode,
    required FormRepositoryRecords repositoryRecords,
  }) {
    return _DataEntryRepositoryProvider(
      entryMode: entryMode,
      repositoryRecords: repositoryRecords,
    );
  }

  @override
  _DataEntryRepositoryProvider getProviderOverride(
    covariant _DataEntryRepositoryProvider provider,
  ) {
    return call(
      entryMode: provider.entryMode,
      repositoryRecords: provider.repositoryRecords,
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
  String? get name => r'_dataEntryRepositoryProvider';
}

/// See also [_dataEntryRepository].
class _DataEntryRepositoryProvider
    extends AutoDisposeProvider<DataEntryRepository> {
  /// See also [_dataEntryRepository].
  _DataEntryRepositoryProvider({
    this.entryMode,
    required this.repositoryRecords,
  }) : super.internal(
          (ref) => _dataEntryRepository(
            ref,
            entryMode: entryMode,
            repositoryRecords: repositoryRecords,
          ),
          from: _dataEntryRepositoryProvider,
          name: r'_dataEntryRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dataEntryRepositoryHash,
          dependencies: _DataEntryRepositoryFamily._dependencies,
          allTransitiveDependencies:
              _DataEntryRepositoryFamily._allTransitiveDependencies,
        );

  final EntryMode? entryMode;
  final FormRepositoryRecords repositoryRecords;

  @override
  bool operator ==(Object other) {
    return other is _DataEntryRepositoryProvider &&
        other.entryMode == entryMode &&
        other.repositoryRecords == repositoryRecords;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, entryMode.hashCode);
    hash = _SystemHash.combine(hash, repositoryRecords.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$searchRepositoryHash() => r'76a860a0cb708c059a99ed5f7ec2bd84482d7263';
typedef _SearchRepositoryRef = AutoDisposeProviderRef<SearchRepository>;

/// See also [_searchRepository].
@ProviderFor(_searchRepository)
const _searchRepositoryProvider = _SearchRepositoryFamily();

/// See also [_searchRepository].
class _SearchRepositoryFamily extends Family<SearchRepository> {
  /// See also [_searchRepository].
  const _SearchRepositoryFamily();

  /// See also [_searchRepository].
  _SearchRepositoryProvider call(
    SearchRecords searchRecords,
  ) {
    return _SearchRepositoryProvider(
      searchRecords,
    );
  }

  @override
  _SearchRepositoryProvider getProviderOverride(
    covariant _SearchRepositoryProvider provider,
  ) {
    return call(
      provider.searchRecords,
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
  String? get name => r'_searchRepositoryProvider';
}

/// See also [_searchRepository].
class _SearchRepositoryProvider extends AutoDisposeProvider<SearchRepository> {
  /// See also [_searchRepository].
  _SearchRepositoryProvider(
    this.searchRecords,
  ) : super.internal(
          (ref) => _searchRepository(
            ref,
            searchRecords,
          ),
          from: _searchRepositoryProvider,
          name: r'_searchRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchRepositoryHash,
          dependencies: _SearchRepositoryFamily._dependencies,
          allTransitiveDependencies:
              _SearchRepositoryFamily._allTransitiveDependencies,
        );

  final SearchRecords searchRecords;

  @override
  bool operator ==(Object other) {
    return other is _SearchRepositoryProvider &&
        other.searchRecords == searchRecords;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchRecords.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$enrollmentRepositoryHash() =>
    r'da50c870be3150c4a202e7dc694427aa04882107';
typedef _EnrollmentRepositoryRef = AutoDisposeProviderRef<EnrollmentRepository>;

/// See also [_enrollmentRepository].
@ProviderFor(_enrollmentRepository)
const _enrollmentRepositoryProvider = _EnrollmentRepositoryFamily();

/// See also [_enrollmentRepository].
class _EnrollmentRepositoryFamily extends Family<EnrollmentRepository> {
  /// See also [_enrollmentRepository].
  const _EnrollmentRepositoryFamily();

  /// See also [_enrollmentRepository].
  _EnrollmentRepositoryProvider call(
    EnrollmentRecords enrollmentRecords,
  ) {
    return _EnrollmentRepositoryProvider(
      enrollmentRecords,
    );
  }

  @override
  _EnrollmentRepositoryProvider getProviderOverride(
    covariant _EnrollmentRepositoryProvider provider,
  ) {
    return call(
      provider.enrollmentRecords,
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
  String? get name => r'_enrollmentRepositoryProvider';
}

/// See also [_enrollmentRepository].
class _EnrollmentRepositoryProvider
    extends AutoDisposeProvider<EnrollmentRepository> {
  /// See also [_enrollmentRepository].
  _EnrollmentRepositoryProvider(
    this.enrollmentRecords,
  ) : super.internal(
          (ref) => _enrollmentRepository(
            ref,
            enrollmentRecords,
          ),
          from: _enrollmentRepositoryProvider,
          name: r'_enrollmentRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$enrollmentRepositoryHash,
          dependencies: _EnrollmentRepositoryFamily._dependencies,
          allTransitiveDependencies:
              _EnrollmentRepositoryFamily._allTransitiveDependencies,
        );

  final EnrollmentRecords enrollmentRecords;

  @override
  bool operator ==(Object other) {
    return other is _EnrollmentRepositoryProvider &&
        other.enrollmentRecords == enrollmentRecords;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, enrollmentRecords.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$eventRepositoryHash() => r'cb536a4559388480c12a3bd18b59178a32c01cac';
typedef _EventRepositoryRef = AutoDisposeProviderRef<EventRepository>;

/// See also [_eventRepository].
@ProviderFor(_eventRepository)
const _eventRepositoryProvider = _EventRepositoryFamily();

/// See also [_eventRepository].
class _EventRepositoryFamily extends Family<EventRepository> {
  /// See also [_eventRepository].
  const _EventRepositoryFamily();

  /// See also [_eventRepository].
  _EventRepositoryProvider call(
    EventRecords eventRecords,
  ) {
    return _EventRepositoryProvider(
      eventRecords,
    );
  }

  @override
  _EventRepositoryProvider getProviderOverride(
    covariant _EventRepositoryProvider provider,
  ) {
    return call(
      provider.eventRecords,
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
  String? get name => r'_eventRepositoryProvider';
}

/// See also [_eventRepository].
class _EventRepositoryProvider extends AutoDisposeProvider<EventRepository> {
  /// See also [_eventRepository].
  _EventRepositoryProvider(
    this.eventRecords,
  ) : super.internal(
          (ref) => _eventRepository(
            ref,
            eventRecords,
          ),
          from: _eventRepositoryProvider,
          name: r'_eventRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$eventRepositoryHash,
          dependencies: _EventRepositoryFamily._dependencies,
          allTransitiveDependencies:
              _EventRepositoryFamily._allTransitiveDependencies,
        );

  final EventRecords eventRecords;

  @override
  bool operator ==(Object other) {
    return other is _EventRepositoryProvider &&
        other.eventRecords == eventRecords;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, eventRecords.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$fieldViewModelFactoryHash() =>
    r'626abd8a21cb33bfa08cc3442a768024a6773752';
typedef _FieldViewModelFactoryRef
    = AutoDisposeProviderRef<FieldViewModelFactory>;

/// See also [_fieldViewModelFactory].
@ProviderFor(_fieldViewModelFactory)
const _fieldViewModelFactoryProvider = _FieldViewModelFactoryFamily();

/// See also [_fieldViewModelFactory].
class _FieldViewModelFactoryFamily extends Family<FieldViewModelFactory> {
  /// See also [_fieldViewModelFactory].
  const _FieldViewModelFactoryFamily();

  /// See also [_fieldViewModelFactory].
  _FieldViewModelFactoryProvider call(
    bool allowMandatoryFields,
    bool isBackgroundTransparent,
  ) {
    return _FieldViewModelFactoryProvider(
      allowMandatoryFields,
      isBackgroundTransparent,
    );
  }

  @override
  _FieldViewModelFactoryProvider getProviderOverride(
    covariant _FieldViewModelFactoryProvider provider,
  ) {
    return call(
      provider.allowMandatoryFields,
      provider.isBackgroundTransparent,
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
  String? get name => r'_fieldViewModelFactoryProvider';
}

/// See also [_fieldViewModelFactory].
class _FieldViewModelFactoryProvider
    extends AutoDisposeProvider<FieldViewModelFactory> {
  /// See also [_fieldViewModelFactory].
  _FieldViewModelFactoryProvider(
    this.allowMandatoryFields,
    this.isBackgroundTransparent,
  ) : super.internal(
          (ref) => _fieldViewModelFactory(
            ref,
            allowMandatoryFields,
            isBackgroundTransparent,
          ),
          from: _fieldViewModelFactoryProvider,
          name: r'_fieldViewModelFactoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fieldViewModelFactoryHash,
          dependencies: _FieldViewModelFactoryFamily._dependencies,
          allTransitiveDependencies:
              _FieldViewModelFactoryFamily._allTransitiveDependencies,
        );

  final bool allowMandatoryFields;
  final bool isBackgroundTransparent;

  @override
  bool operator ==(Object other) {
    return other is _FieldViewModelFactoryProvider &&
        other.allowMandatoryFields == allowMandatoryFields &&
        other.isBackgroundTransparent == isBackgroundTransparent;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, allowMandatoryFields.hashCode);
    hash = _SystemHash.combine(hash, isBackgroundTransparent.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$enrollmentObjectRepositoryHash() =>
    r'cc02474cbf3723f1ef51349b0ac3c379c9cff3ea';
typedef _EnrollmentObjectRepositoryRef
    = AutoDisposeProviderRef<EnrollmentObjectRepository>;

/// _provideEnrollmentObjectRepository(uid)
///
/// Copied from [_enrollmentObjectRepository].
@ProviderFor(_enrollmentObjectRepository)
const _enrollmentObjectRepositoryProvider = _EnrollmentObjectRepositoryFamily();

/// _provideEnrollmentObjectRepository(uid)
///
/// Copied from [_enrollmentObjectRepository].
class _EnrollmentObjectRepositoryFamily
    extends Family<EnrollmentObjectRepository> {
  /// _provideEnrollmentObjectRepository(uid)
  ///
  /// Copied from [_enrollmentObjectRepository].
  const _EnrollmentObjectRepositoryFamily();

  /// _provideEnrollmentObjectRepository(uid)
  ///
  /// Copied from [_enrollmentObjectRepository].
  _EnrollmentObjectRepositoryProvider call(
    String enrollmentUid,
  ) {
    return _EnrollmentObjectRepositoryProvider(
      enrollmentUid,
    );
  }

  @override
  _EnrollmentObjectRepositoryProvider getProviderOverride(
    covariant _EnrollmentObjectRepositoryProvider provider,
  ) {
    return call(
      provider.enrollmentUid,
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
  String? get name => r'_enrollmentObjectRepositoryProvider';
}

/// _provideEnrollmentObjectRepository(uid)
///
/// Copied from [_enrollmentObjectRepository].
class _EnrollmentObjectRepositoryProvider
    extends AutoDisposeProvider<EnrollmentObjectRepository> {
  /// _provideEnrollmentObjectRepository(uid)
  ///
  /// Copied from [_enrollmentObjectRepository].
  _EnrollmentObjectRepositoryProvider(
    this.enrollmentUid,
  ) : super.internal(
          (ref) => _enrollmentObjectRepository(
            ref,
            enrollmentUid,
          ),
          from: _enrollmentObjectRepositoryProvider,
          name: r'_enrollmentObjectRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$enrollmentObjectRepositoryHash,
          dependencies: _EnrollmentObjectRepositoryFamily._dependencies,
          allTransitiveDependencies:
              _EnrollmentObjectRepositoryFamily._allTransitiveDependencies,
        );

  final String enrollmentUid;

  @override
  bool operator ==(Object other) {
    return other is _EnrollmentObjectRepositoryProvider &&
        other.enrollmentUid == enrollmentUid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, enrollmentUid.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$formValueStoreHash() => r'02d1cb44f73e8d97f8b256b9fd324afa2567e018';
typedef _FormValueStoreRef = AutoDisposeProviderRef<FormValueStore?>;

/// See also [_formValueStore].
@ProviderFor(_formValueStore)
const _formValueStoreProvider = _FormValueStoreFamily();

/// See also [_formValueStore].
class _FormValueStoreFamily extends Family<FormValueStore?> {
  /// See also [_formValueStore].
  const _FormValueStoreFamily();

  /// See also [_formValueStore].
  _FormValueStoreProvider call(
    String? recordUid,
    EntryMode? entryMode, [
    EnrollmentObjectRepository? repository,
  ]) {
    return _FormValueStoreProvider(
      recordUid,
      entryMode,
      repository,
    );
  }

  @override
  _FormValueStoreProvider getProviderOverride(
    covariant _FormValueStoreProvider provider,
  ) {
    return call(
      provider.recordUid,
      provider.entryMode,
      provider.repository,
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
  String? get name => r'_formValueStoreProvider';
}

/// See also [_formValueStore].
class _FormValueStoreProvider extends AutoDisposeProvider<FormValueStore?> {
  /// See also [_formValueStore].
  _FormValueStoreProvider(
    this.recordUid,
    this.entryMode, [
    this.repository,
  ]) : super.internal(
          (ref) => _formValueStore(
            ref,
            recordUid,
            entryMode,
            repository,
          ),
          from: _formValueStoreProvider,
          name: r'_formValueStoreProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formValueStoreHash,
          dependencies: _FormValueStoreFamily._dependencies,
          allTransitiveDependencies:
              _FormValueStoreFamily._allTransitiveDependencies,
        );

  final String? recordUid;
  final EntryMode? entryMode;
  final EnrollmentObjectRepository? repository;

  @override
  bool operator ==(Object other) {
    return other is _FormValueStoreProvider &&
        other.recordUid == recordUid &&
        other.entryMode == entryMode &&
        other.repository == repository;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, recordUid.hashCode);
    hash = _SystemHash.combine(hash, entryMode.hashCode);
    hash = _SystemHash.combine(hash, repository.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$networkUtilsHash() => r'fe32a0e13dc1e5fe27a6e10a51b6a0016de0a588';

/// See also [_networkUtils].
@ProviderFor(_networkUtils)
final _networkUtilsProvider = AutoDisposeProvider<NetworkUtils>.internal(
  _networkUtils,
  name: r'_networkUtilsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$networkUtilsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _NetworkUtilsRef = AutoDisposeProviderRef<NetworkUtils>;
String _$fieldErrorMessageProviderHash() =>
    r'fa69b6ee68cd210315767469581362716420f302';

/// See also [_fieldErrorMessageProvider].
@ProviderFor(_fieldErrorMessageProvider)
final _fieldErrorMessageProviderProvider =
    AutoDisposeProvider<FieldErrorMessageProvider>.internal(
  _fieldErrorMessageProvider,
  name: r'_fieldErrorMessageProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fieldErrorMessageProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _FieldErrorMessageProviderRef
    = AutoDisposeProviderRef<FieldErrorMessageProvider>;
String _$enrollmentFormLabelsProviderHash() =>
    r'1ec86ab2ae11b114944162911ba65309fd49b20d';

/// See also [_enrollmentFormLabelsProvider].
@ProviderFor(_enrollmentFormLabelsProvider)
final _enrollmentFormLabelsProviderProvider =
    AutoDisposeProvider<EnrollmentFormLabelsProvider>.internal(
  _enrollmentFormLabelsProvider,
  name: r'_enrollmentFormLabelsProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$enrollmentFormLabelsProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _EnrollmentFormLabelsProviderRef
    = AutoDisposeProviderRef<EnrollmentFormLabelsProvider>;
String _$displayNameProviderHash() =>
    r'07e81200b5d5e74f4a789a907a26c465351bd53c';

/// See also [_displayNameProvider].
@ProviderFor(_displayNameProvider)
final _displayNameProviderProvider =
    AutoDisposeProvider<DisplayNameProvider>.internal(
  _displayNameProvider,
  name: r'_displayNameProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$displayNameProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _DisplayNameProviderRef = AutoDisposeProviderRef<DisplayNameProvider>;
String _$keyboardActionProviderHash() =>
    r'82b77d283045021f9b668aa7c86c1aba9024ce4c';

/// See also [_keyboardActionProvider].
@ProviderFor(_keyboardActionProvider)
final _keyboardActionProviderProvider =
    AutoDisposeProvider<KeyboardActionProvider>.internal(
  _keyboardActionProvider,
  name: r'_keyboardActionProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$keyboardActionProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _KeyboardActionProviderRef
    = AutoDisposeProviderRef<KeyboardActionProvider>;
String _$uiEventTypesProviderHash() =>
    r'489de6576326082be13beff297f8f2c12d93c36d';

/// See also [_uiEventTypesProvider].
@ProviderFor(_uiEventTypesProvider)
final _uiEventTypesProviderProvider =
    AutoDisposeProvider<UiEventTypesProvider>.internal(
  _uiEventTypesProvider,
  name: r'_uiEventTypesProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$uiEventTypesProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _UiEventTypesProviderRef = AutoDisposeProviderRef<UiEventTypesProvider>;
String _$hintProviderHash() => r'bfcb9525edffd8a66f8c820f137401493f633230';

/// See also [_hintProvider].
@ProviderFor(_hintProvider)
final _hintProviderProvider = AutoDisposeProvider<HintProvider>.internal(
  _hintProvider,
  name: r'_hintProviderProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$hintProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _HintProviderRef = AutoDisposeProviderRef<HintProvider>;
String _$uiStyleProviderHash() => r'ceb06436acaab32d95e684b6d928ab565206a7ed';
typedef _UiStyleProviderRef = AutoDisposeProviderRef<UiStyleProvider>;

/// See also [_uiStyleProvider].
@ProviderFor(_uiStyleProvider)
const _uiStyleProviderProvider = _UiStyleProviderFamily();

/// See also [_uiStyleProvider].
class _UiStyleProviderFamily extends Family<UiStyleProvider> {
  /// See also [_uiStyleProvider].
  const _UiStyleProviderFamily();

  /// See also [_uiStyleProvider].
  _UiStyleProviderProvider call(
    bool isBackgroundTransparent,
  ) {
    return _UiStyleProviderProvider(
      isBackgroundTransparent,
    );
  }

  @override
  _UiStyleProviderProvider getProviderOverride(
    covariant _UiStyleProviderProvider provider,
  ) {
    return call(
      provider.isBackgroundTransparent,
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
  String? get name => r'_uiStyleProviderProvider';
}

/// See also [_uiStyleProvider].
class _UiStyleProviderProvider extends AutoDisposeProvider<UiStyleProvider> {
  /// See also [_uiStyleProvider].
  _UiStyleProviderProvider(
    this.isBackgroundTransparent,
  ) : super.internal(
          (ref) => _uiStyleProvider(
            ref,
            isBackgroundTransparent,
          ),
          from: _uiStyleProviderProvider,
          name: r'_uiStyleProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$uiStyleProviderHash,
          dependencies: _UiStyleProviderFamily._dependencies,
          allTransitiveDependencies:
              _UiStyleProviderFamily._allTransitiveDependencies,
        );

  final bool isBackgroundTransparent;

  @override
  bool operator ==(Object other) {
    return other is _UiStyleProviderProvider &&
        other.isBackgroundTransparent == isBackgroundTransparent;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, isBackgroundTransparent.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$searchOptionSetOptionHash() =>
    r'0b5dc4c026f29a55460a9c58a08a5d5748079e03';

/// See also [_searchOptionSetOption].
@ProviderFor(_searchOptionSetOption)
final _searchOptionSetOptionProvider =
    AutoDisposeProvider<SearchOptionSetOption>.internal(
  _searchOptionSetOption,
  name: r'_searchOptionSetOptionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchOptionSetOptionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _SearchOptionSetOptionRef
    = AutoDisposeProviderRef<SearchOptionSetOption>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
