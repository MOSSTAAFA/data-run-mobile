// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formRepositoryRecordsHash() =>
    r'9a3120d831c80fd25293cfa369832874d55a7a4a';

/// See also [formRepositoryRecords].
@ProviderFor(formRepositoryRecords)
final formRepositoryRecordsProvider =
    AutoDisposeProvider<FormRepositoryRecords>.internal(
  formRepositoryRecords,
  name: r'formRepositoryRecordsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$formRepositoryRecordsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FormRepositoryRecordsRef
    = AutoDisposeProviderRef<FormRepositoryRecords>;
String _$formRepositoryHash() => r'aa42c44ce8a918d4929e48a4bf800c7704df2467';

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
String _$enrollmentObjectRepositoryHash() =>
    r'4919d65e95bf99a17cf66735ecada85fbe6fa545';

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

typedef EnrollmentObjectRepositoryRef
    = AutoDisposeProviderRef<EnrollmentObjectRepository>;

/// _provideEnrollmentObjectRepository(uid)
///
/// Copied from [enrollmentObjectRepository].
@ProviderFor(enrollmentObjectRepository)
const enrollmentObjectRepositoryProvider = EnrollmentObjectRepositoryFamily();

/// _provideEnrollmentObjectRepository(uid)
///
/// Copied from [enrollmentObjectRepository].
class EnrollmentObjectRepositoryFamily
    extends Family<EnrollmentObjectRepository> {
  /// _provideEnrollmentObjectRepository(uid)
  ///
  /// Copied from [enrollmentObjectRepository].
  const EnrollmentObjectRepositoryFamily();

  /// _provideEnrollmentObjectRepository(uid)
  ///
  /// Copied from [enrollmentObjectRepository].
  EnrollmentObjectRepositoryProvider call(
    String enrollmentUid,
  ) {
    return EnrollmentObjectRepositoryProvider(
      enrollmentUid,
    );
  }

  @override
  EnrollmentObjectRepositoryProvider getProviderOverride(
    covariant EnrollmentObjectRepositoryProvider provider,
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
  String? get name => r'enrollmentObjectRepositoryProvider';
}

/// _provideEnrollmentObjectRepository(uid)
///
/// Copied from [enrollmentObjectRepository].
class EnrollmentObjectRepositoryProvider
    extends AutoDisposeProvider<EnrollmentObjectRepository> {
  /// _provideEnrollmentObjectRepository(uid)
  ///
  /// Copied from [enrollmentObjectRepository].
  EnrollmentObjectRepositoryProvider(
    this.enrollmentUid,
  ) : super.internal(
          (ref) => enrollmentObjectRepository(
            ref,
            enrollmentUid,
          ),
          from: enrollmentObjectRepositoryProvider,
          name: r'enrollmentObjectRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$enrollmentObjectRepositoryHash,
          dependencies: EnrollmentObjectRepositoryFamily._dependencies,
          allTransitiveDependencies:
              EnrollmentObjectRepositoryFamily._allTransitiveDependencies,
        );

  final String enrollmentUid;

  @override
  bool operator ==(Object other) {
    return other is EnrollmentObjectRepositoryProvider &&
        other.enrollmentUid == enrollmentUid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, enrollmentUid.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$formValueStoreHash() => r'b5ddf273362a5ba94e679283a0551e18bc59ec76';
typedef FormValueStoreRef = AutoDisposeProviderRef<FormValueStore?>;

/// See also [formValueStore].
@ProviderFor(formValueStore)
const formValueStoreProvider = FormValueStoreFamily();

/// See also [formValueStore].
class FormValueStoreFamily extends Family<FormValueStore?> {
  /// See also [formValueStore].
  const FormValueStoreFamily();

  /// See also [formValueStore].
  FormValueStoreProvider call(
    String? recordUid,
    EntryMode? entryMode, [
    EnrollmentObjectRepository? repository,
  ]) {
    return FormValueStoreProvider(
      recordUid,
      entryMode,
      repository,
    );
  }

  @override
  FormValueStoreProvider getProviderOverride(
    covariant FormValueStoreProvider provider,
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
  String? get name => r'formValueStoreProvider';
}

/// See also [formValueStore].
class FormValueStoreProvider extends AutoDisposeProvider<FormValueStore?> {
  /// See also [formValueStore].
  FormValueStoreProvider(
    this.recordUid,
    this.entryMode, [
    this.repository,
  ]) : super.internal(
          (ref) => formValueStore(
            ref,
            recordUid,
            entryMode,
            repository,
          ),
          from: formValueStoreProvider,
          name: r'formValueStoreProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formValueStoreHash,
          dependencies: FormValueStoreFamily._dependencies,
          allTransitiveDependencies:
              FormValueStoreFamily._allTransitiveDependencies,
        );

  final String? recordUid;
  final EntryMode? entryMode;
  final EnrollmentObjectRepository? repository;

  @override
  bool operator ==(Object other) {
    return other is FormValueStoreProvider &&
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

String _$networkUtilsHash() => r'536cfd3bfc12b51db1953e2689f637b9fb80df7a';

/// See also [networkUtils].
@ProviderFor(networkUtils)
final networkUtilsProvider = AutoDisposeProvider<NetworkUtils>.internal(
  networkUtils,
  name: r'networkUtilsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$networkUtilsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NetworkUtilsRef = AutoDisposeProviderRef<NetworkUtils>;
String _$fieldErrorMessageProviderHash() =>
    r'736b9ff87eb263423b1e96b2d64ec7d447b1294c';

/// See also [fieldErrorMessageProvider].
@ProviderFor(fieldErrorMessageProvider)
final fieldErrorMessageProviderProvider =
    AutoDisposeProvider<FieldErrorMessageProvider>.internal(
  fieldErrorMessageProvider,
  name: r'fieldErrorMessageProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fieldErrorMessageProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FieldErrorMessageProviderRef
    = AutoDisposeProviderRef<FieldErrorMessageProvider>;
String _$enrollmentRepositoryHash() =>
    r'9e4288f89c8cefc360ce928617f79639fddd4754';
typedef EnrollmentRepositoryRef = AutoDisposeProviderRef<EnrollmentRepository>;

/// See also [enrollmentRepository].
@ProviderFor(enrollmentRepository)
const enrollmentRepositoryProvider = EnrollmentRepositoryFamily();

/// See also [enrollmentRepository].
class EnrollmentRepositoryFamily extends Family<EnrollmentRepository> {
  /// See also [enrollmentRepository].
  const EnrollmentRepositoryFamily();

  /// See also [enrollmentRepository].
  EnrollmentRepositoryProvider call(
    EnrollmentRecords enrollmentRecords,
  ) {
    return EnrollmentRepositoryProvider(
      enrollmentRecords,
    );
  }

  @override
  EnrollmentRepositoryProvider getProviderOverride(
    covariant EnrollmentRepositoryProvider provider,
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
  String? get name => r'enrollmentRepositoryProvider';
}

/// See also [enrollmentRepository].
class EnrollmentRepositoryProvider
    extends AutoDisposeProvider<EnrollmentRepository> {
  /// See also [enrollmentRepository].
  EnrollmentRepositoryProvider(
    this.enrollmentRecords,
  ) : super.internal(
          (ref) => enrollmentRepository(
            ref,
            enrollmentRecords,
          ),
          from: enrollmentRepositoryProvider,
          name: r'enrollmentRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$enrollmentRepositoryHash,
          dependencies: EnrollmentRepositoryFamily._dependencies,
          allTransitiveDependencies:
              EnrollmentRepositoryFamily._allTransitiveDependencies,
        );

  final EnrollmentRecords enrollmentRecords;

  @override
  bool operator ==(Object other) {
    return other is EnrollmentRepositoryProvider &&
        other.enrollmentRecords == enrollmentRecords;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, enrollmentRecords.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$eventRepositoryHash() => r'376067aa3bfcf77ddbf65d2a42d19539546570d3';
typedef EventRepositoryRef = AutoDisposeProviderRef<EventRepository>;

/// See also [eventRepository].
@ProviderFor(eventRepository)
const eventRepositoryProvider = EventRepositoryFamily();

/// See also [eventRepository].
class EventRepositoryFamily extends Family<EventRepository> {
  /// See also [eventRepository].
  const EventRepositoryFamily();

  /// See also [eventRepository].
  EventRepositoryProvider call(
    EventRecords eventRecords,
  ) {
    return EventRepositoryProvider(
      eventRecords,
    );
  }

  @override
  EventRepositoryProvider getProviderOverride(
    covariant EventRepositoryProvider provider,
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
  String? get name => r'eventRepositoryProvider';
}

/// See also [eventRepository].
class EventRepositoryProvider extends AutoDisposeProvider<EventRepository> {
  /// See also [eventRepository].
  EventRepositoryProvider(
    this.eventRecords,
  ) : super.internal(
          (ref) => eventRepository(
            ref,
            eventRecords,
          ),
          from: eventRepositoryProvider,
          name: r'eventRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$eventRepositoryHash,
          dependencies: EventRepositoryFamily._dependencies,
          allTransitiveDependencies:
              EventRepositoryFamily._allTransitiveDependencies,
        );

  final EventRecords eventRecords;

  @override
  bool operator ==(Object other) {
    return other is EventRepositoryProvider &&
        other.eventRecords == eventRecords;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, eventRecords.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$searchRepositoryHash() => r'9890909d1c9a5b032be96cf2670a66ee07321912';
typedef SearchRepositoryRef = AutoDisposeProviderRef<SearchRepository>;

/// See also [searchRepository].
@ProviderFor(searchRepository)
const searchRepositoryProvider = SearchRepositoryFamily();

/// See also [searchRepository].
class SearchRepositoryFamily extends Family<SearchRepository> {
  /// See also [searchRepository].
  const SearchRepositoryFamily();

  /// See also [searchRepository].
  SearchRepositoryProvider call(
    SearchRecords searchRecords,
  ) {
    return SearchRepositoryProvider(
      searchRecords,
    );
  }

  @override
  SearchRepositoryProvider getProviderOverride(
    covariant SearchRepositoryProvider provider,
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
  String? get name => r'searchRepositoryProvider';
}

/// See also [searchRepository].
class SearchRepositoryProvider extends AutoDisposeProvider<SearchRepository> {
  /// See also [searchRepository].
  SearchRepositoryProvider(
    this.searchRecords,
  ) : super.internal(
          (ref) => searchRepository(
            ref,
            searchRecords,
          ),
          from: searchRepositoryProvider,
          name: r'searchRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchRepositoryHash,
          dependencies: SearchRepositoryFamily._dependencies,
          allTransitiveDependencies:
              SearchRepositoryFamily._allTransitiveDependencies,
        );

  final SearchRecords searchRecords;

  @override
  bool operator ==(Object other) {
    return other is SearchRepositoryProvider &&
        other.searchRecords == searchRecords;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchRecords.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$enrollmentFormLabelsProviderHash() =>
    r'ba3eb7fa1326c6bc894995e0dba238d981be723d';

/// See also [enrollmentFormLabelsProvider].
@ProviderFor(enrollmentFormLabelsProvider)
final enrollmentFormLabelsProviderProvider =
    AutoDisposeProvider<EnrollmentFormLabelsProvider>.internal(
  enrollmentFormLabelsProvider,
  name: r'enrollmentFormLabelsProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$enrollmentFormLabelsProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EnrollmentFormLabelsProviderRef
    = AutoDisposeProviderRef<EnrollmentFormLabelsProvider>;
String _$dataEntryRepositoryHash() =>
    r'ebc5aa68a873d842cce188db6952b872a0bff427';
typedef DataEntryRepositoryRef = AutoDisposeProviderRef<DataEntryRepository>;

/// See also [dataEntryRepository].
@ProviderFor(dataEntryRepository)
const dataEntryRepositoryProvider = DataEntryRepositoryFamily();

/// See also [dataEntryRepository].
class DataEntryRepositoryFamily extends Family<DataEntryRepository> {
  /// See also [dataEntryRepository].
  const DataEntryRepositoryFamily();

  /// See also [dataEntryRepository].
  DataEntryRepositoryProvider call({
    EntryMode? entryMode,
    required FormRepositoryRecords repositoryRecords,
  }) {
    return DataEntryRepositoryProvider(
      entryMode: entryMode,
      repositoryRecords: repositoryRecords,
    );
  }

  @override
  DataEntryRepositoryProvider getProviderOverride(
    covariant DataEntryRepositoryProvider provider,
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
  String? get name => r'dataEntryRepositoryProvider';
}

/// See also [dataEntryRepository].
class DataEntryRepositoryProvider
    extends AutoDisposeProvider<DataEntryRepository> {
  /// See also [dataEntryRepository].
  DataEntryRepositoryProvider({
    this.entryMode,
    required this.repositoryRecords,
  }) : super.internal(
          (ref) => dataEntryRepository(
            ref,
            entryMode: entryMode,
            repositoryRecords: repositoryRecords,
          ),
          from: dataEntryRepositoryProvider,
          name: r'dataEntryRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dataEntryRepositoryHash,
          dependencies: DataEntryRepositoryFamily._dependencies,
          allTransitiveDependencies:
              DataEntryRepositoryFamily._allTransitiveDependencies,
        );

  final EntryMode? entryMode;
  final FormRepositoryRecords repositoryRecords;

  @override
  bool operator ==(Object other) {
    return other is DataEntryRepositoryProvider &&
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

String _$fieldViewModelFactoryHash() =>
    r'88ca3cc50ab2bbd97ab6a9fc1d945838e68b2abb';
typedef FieldViewModelFactoryRef
    = AutoDisposeProviderRef<FieldViewModelFactory>;

/// See also [fieldViewModelFactory].
@ProviderFor(fieldViewModelFactory)
const fieldViewModelFactoryProvider = FieldViewModelFactoryFamily();

/// See also [fieldViewModelFactory].
class FieldViewModelFactoryFamily extends Family<FieldViewModelFactory> {
  /// See also [fieldViewModelFactory].
  const FieldViewModelFactoryFamily();

  /// See also [fieldViewModelFactory].
  FieldViewModelFactoryProvider call(
    bool allowMandatoryFields,
    bool isBackgroundTransparent,
  ) {
    return FieldViewModelFactoryProvider(
      allowMandatoryFields,
      isBackgroundTransparent,
    );
  }

  @override
  FieldViewModelFactoryProvider getProviderOverride(
    covariant FieldViewModelFactoryProvider provider,
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
  String? get name => r'fieldViewModelFactoryProvider';
}

/// See also [fieldViewModelFactory].
class FieldViewModelFactoryProvider
    extends AutoDisposeProvider<FieldViewModelFactory> {
  /// See also [fieldViewModelFactory].
  FieldViewModelFactoryProvider(
    this.allowMandatoryFields,
    this.isBackgroundTransparent,
  ) : super.internal(
          (ref) => fieldViewModelFactory(
            ref,
            allowMandatoryFields,
            isBackgroundTransparent,
          ),
          from: fieldViewModelFactoryProvider,
          name: r'fieldViewModelFactoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fieldViewModelFactoryHash,
          dependencies: FieldViewModelFactoryFamily._dependencies,
          allTransitiveDependencies:
              FieldViewModelFactoryFamily._allTransitiveDependencies,
        );

  final bool allowMandatoryFields;
  final bool isBackgroundTransparent;

  @override
  bool operator ==(Object other) {
    return other is FieldViewModelFactoryProvider &&
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

String _$displayNameProviderHash() =>
    r'26363eae505b09df003ce9976655a76d6c344e7d';

/// See also [displayNameProvider].
@ProviderFor(displayNameProvider)
final displayNameProviderProvider =
    AutoDisposeProvider<DisplayNameProvider>.internal(
  displayNameProvider,
  name: r'displayNameProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$displayNameProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DisplayNameProviderRef = AutoDisposeProviderRef<DisplayNameProvider>;
String _$keyboardActionProviderHash() =>
    r'4128ad924924503bff3919a7fdb496bc371f822f';

/// See also [keyboardActionProvider].
@ProviderFor(keyboardActionProvider)
final keyboardActionProviderProvider =
    AutoDisposeProvider<KeyboardActionProvider>.internal(
  keyboardActionProvider,
  name: r'keyboardActionProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$keyboardActionProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef KeyboardActionProviderRef
    = AutoDisposeProviderRef<KeyboardActionProvider>;
String _$uiEventTypesProviderHash() =>
    r'df39471c76d4ad7ef28bcee13a9642624bdc756d';

/// See also [uiEventTypesProvider].
@ProviderFor(uiEventTypesProvider)
final uiEventTypesProviderProvider =
    AutoDisposeProvider<UiEventTypesProvider>.internal(
  uiEventTypesProvider,
  name: r'uiEventTypesProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$uiEventTypesProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UiEventTypesProviderRef = AutoDisposeProviderRef<UiEventTypesProvider>;
String _$hintProviderHash() => r'e776cc0b3d1930e6482c052f222e1059e07926ca';

/// See also [hintProvider].
@ProviderFor(hintProvider)
final hintProviderProvider = AutoDisposeProvider<HintProvider>.internal(
  hintProvider,
  name: r'hintProviderProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$hintProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HintProviderRef = AutoDisposeProviderRef<HintProvider>;
String _$layoutProviderHash() => r'62a05ae0de3c8aebe885eee3eed6b11cc00f72e7';

/// See also [layoutProvider].
@ProviderFor(layoutProvider)
final layoutProviderProvider = AutoDisposeProvider<LayoutProvider>.internal(
  layoutProvider,
  name: r'layoutProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$layoutProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LayoutProviderRef = AutoDisposeProviderRef<LayoutProvider>;
String _$uiStyleProviderHash() => r'27f9751e8b6848b249be8c91488785e3d2eea4a0';
typedef UiStyleProviderRef = AutoDisposeProviderRef<UiStyleProvider>;

/// See also [uiStyleProvider].
@ProviderFor(uiStyleProvider)
const uiStyleProviderProvider = UiStyleProviderFamily();

/// See also [uiStyleProvider].
class UiStyleProviderFamily extends Family<UiStyleProvider> {
  /// See also [uiStyleProvider].
  const UiStyleProviderFamily();

  /// See also [uiStyleProvider].
  UiStyleProviderProvider call(
    bool isBackgroundTransparent,
  ) {
    return UiStyleProviderProvider(
      isBackgroundTransparent,
    );
  }

  @override
  UiStyleProviderProvider getProviderOverride(
    covariant UiStyleProviderProvider provider,
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
  String? get name => r'uiStyleProviderProvider';
}

/// See also [uiStyleProvider].
class UiStyleProviderProvider extends AutoDisposeProvider<UiStyleProvider> {
  /// See also [uiStyleProvider].
  UiStyleProviderProvider(
    this.isBackgroundTransparent,
  ) : super.internal(
          (ref) => uiStyleProvider(
            ref,
            isBackgroundTransparent,
          ),
          from: uiStyleProviderProvider,
          name: r'uiStyleProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$uiStyleProviderHash,
          dependencies: UiStyleProviderFamily._dependencies,
          allTransitiveDependencies:
              UiStyleProviderFamily._allTransitiveDependencies,
        );

  final bool isBackgroundTransparent;

  @override
  bool operator ==(Object other) {
    return other is UiStyleProviderProvider &&
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
    r'b52c0b160deb4050a2ca7c26c503ab0b9f47ff5b';

/// See also [searchOptionSetOption].
@ProviderFor(searchOptionSetOption)
final searchOptionSetOptionProvider =
    AutoDisposeProvider<SearchOptionSetOption>.internal(
  searchOptionSetOption,
  name: r'searchOptionSetOptionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchOptionSetOptionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SearchOptionSetOptionRef
    = AutoDisposeProviderRef<SearchOptionSetOption>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
