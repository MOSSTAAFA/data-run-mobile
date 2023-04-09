// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$buildContextHash() => r'8efbd2b1f8fea84ba377c66d5c34bf33a25c0396';

/// See also [buildContext].
@ProviderFor(buildContext)
final buildContextProvider = AutoDisposeProvider<BuildContext>.internal(
  buildContext,
  name: r'buildContextProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$buildContextHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BuildContextRef = AutoDisposeProviderRef<BuildContext>;
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
String _$formRepositoryHash() => r'aa051a8713ca077d3d7b3e1c7e5d47c0822577f3';

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

String _$formValueStoreHash() => r'09db4c3689f0c6ae34bfae58603710df1f0b9794';
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
    BuildContext context,
    String? recordUid,
    EntryMode? entryMode,
  ) {
    return FormValueStoreProvider(
      context,
      recordUid,
      entryMode,
    );
  }

  @override
  FormValueStoreProvider getProviderOverride(
    covariant FormValueStoreProvider provider,
  ) {
    return call(
      provider.context,
      provider.recordUid,
      provider.entryMode,
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
    this.context,
    this.recordUid,
    this.entryMode,
  ) : super.internal(
          (ref) => formValueStore(
            ref,
            context,
            recordUid,
            entryMode,
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

  final BuildContext context;
  final String? recordUid;
  final EntryMode? entryMode;

  @override
  bool operator ==(Object other) {
    return other is FormValueStoreProvider &&
        other.context == context &&
        other.recordUid == recordUid &&
        other.entryMode == entryMode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);
    hash = _SystemHash.combine(hash, recordUid.hashCode);
    hash = _SystemHash.combine(hash, entryMode.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$networkUtilsHash() => r'338ed806a5fb394ee049f491bcae4fc04a53765f';
typedef NetworkUtilsRef = AutoDisposeProviderRef<NetworkUtils>;

/// See also [networkUtils].
@ProviderFor(networkUtils)
const networkUtilsProvider = NetworkUtilsFamily();

/// See also [networkUtils].
class NetworkUtilsFamily extends Family<NetworkUtils> {
  /// See also [networkUtils].
  const NetworkUtilsFamily();

  /// See also [networkUtils].
  NetworkUtilsProvider call(
    BuildContext context,
  ) {
    return NetworkUtilsProvider(
      context,
    );
  }

  @override
  NetworkUtilsProvider getProviderOverride(
    covariant NetworkUtilsProvider provider,
  ) {
    return call(
      provider.context,
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
  String? get name => r'networkUtilsProvider';
}

/// See also [networkUtils].
class NetworkUtilsProvider extends AutoDisposeProvider<NetworkUtils> {
  /// See also [networkUtils].
  NetworkUtilsProvider(
    this.context,
  ) : super.internal(
          (ref) => networkUtils(
            ref,
            context,
          ),
          from: networkUtilsProvider,
          name: r'networkUtilsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$networkUtilsHash,
          dependencies: NetworkUtilsFamily._dependencies,
          allTransitiveDependencies:
              NetworkUtilsFamily._allTransitiveDependencies,
        );

  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is NetworkUtilsProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$resourceManagerHash() => r'fd4e456eeb17248d90482730fd8bf4f9dcd8f891';
typedef ResourceManagerRef = AutoDisposeProviderRef<ResourceManager>;

/// See also [resourceManager].
@ProviderFor(resourceManager)
const resourceManagerProvider = ResourceManagerFamily();

/// See also [resourceManager].
class ResourceManagerFamily extends Family<ResourceManager> {
  /// See also [resourceManager].
  const ResourceManagerFamily();

  /// See also [resourceManager].
  ResourceManagerProvider call(
    BuildContext context,
  ) {
    return ResourceManagerProvider(
      context,
    );
  }

  @override
  ResourceManagerProvider getProviderOverride(
    covariant ResourceManagerProvider provider,
  ) {
    return call(
      provider.context,
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
  String? get name => r'resourceManagerProvider';
}

/// See also [resourceManager].
class ResourceManagerProvider extends AutoDisposeProvider<ResourceManager> {
  /// See also [resourceManager].
  ResourceManagerProvider(
    this.context,
  ) : super.internal(
          (ref) => resourceManager(
            ref,
            context,
          ),
          from: resourceManagerProvider,
          name: r'resourceManagerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$resourceManagerHash,
          dependencies: ResourceManagerFamily._dependencies,
          allTransitiveDependencies:
              ResourceManagerFamily._allTransitiveDependencies,
        );

  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is ResourceManagerProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$fieldErrorMessageProviderHash() =>
    r'6cbdd47bb20a54f2c51df1ce700df9a9c49cf84c';
typedef FieldErrorMessageProviderRef
    = AutoDisposeProviderRef<FieldErrorMessageProvider>;

/// See also [fieldErrorMessageProvider].
@ProviderFor(fieldErrorMessageProvider)
const fieldErrorMessageProviderProvider = FieldErrorMessageProviderFamily();

/// See also [fieldErrorMessageProvider].
class FieldErrorMessageProviderFamily
    extends Family<FieldErrorMessageProvider> {
  /// See also [fieldErrorMessageProvider].
  const FieldErrorMessageProviderFamily();

  /// See also [fieldErrorMessageProvider].
  FieldErrorMessageProviderProvider call(
    BuildContext context,
  ) {
    return FieldErrorMessageProviderProvider(
      context,
    );
  }

  @override
  FieldErrorMessageProviderProvider getProviderOverride(
    covariant FieldErrorMessageProviderProvider provider,
  ) {
    return call(
      provider.context,
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
  String? get name => r'fieldErrorMessageProviderProvider';
}

/// See also [fieldErrorMessageProvider].
class FieldErrorMessageProviderProvider
    extends AutoDisposeProvider<FieldErrorMessageProvider> {
  /// See also [fieldErrorMessageProvider].
  FieldErrorMessageProviderProvider(
    this.context,
  ) : super.internal(
          (ref) => fieldErrorMessageProvider(
            ref,
            context,
          ),
          from: fieldErrorMessageProviderProvider,
          name: r'fieldErrorMessageProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fieldErrorMessageProviderHash,
          dependencies: FieldErrorMessageProviderFamily._dependencies,
          allTransitiveDependencies:
              FieldErrorMessageProviderFamily._allTransitiveDependencies,
        );

  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is FieldErrorMessageProviderProvider &&
        other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$enrollmentRepositoryHash() =>
    r'324b1a62902ea248c89f2ea73de2e328a15788b4';
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
    BuildContext context,
    EnrollmentRecords enrollmentRecords,
  ) {
    return EnrollmentRepositoryProvider(
      context,
      enrollmentRecords,
    );
  }

  @override
  EnrollmentRepositoryProvider getProviderOverride(
    covariant EnrollmentRepositoryProvider provider,
  ) {
    return call(
      provider.context,
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
    this.context,
    this.enrollmentRecords,
  ) : super.internal(
          (ref) => enrollmentRepository(
            ref,
            context,
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

  final BuildContext context;
  final EnrollmentRecords enrollmentRecords;

  @override
  bool operator ==(Object other) {
    return other is EnrollmentRepositoryProvider &&
        other.context == context &&
        other.enrollmentRecords == enrollmentRecords;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);
    hash = _SystemHash.combine(hash, enrollmentRecords.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$eventRepositoryHash() => r'2dcdaa22db39e99e4247f6d490fcc238fcfee964';
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
    BuildContext context,
    EventRecords eventRecords,
  ) {
    return EventRepositoryProvider(
      context,
      eventRecords,
    );
  }

  @override
  EventRepositoryProvider getProviderOverride(
    covariant EventRepositoryProvider provider,
  ) {
    return call(
      provider.context,
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
    this.context,
    this.eventRecords,
  ) : super.internal(
          (ref) => eventRepository(
            ref,
            context,
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

  final BuildContext context;
  final EventRecords eventRecords;

  @override
  bool operator ==(Object other) {
    return other is EventRepositoryProvider &&
        other.context == context &&
        other.eventRecords == eventRecords;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);
    hash = _SystemHash.combine(hash, eventRecords.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$searchRepositoryHash() => r'a55417079b45f3aa0fcee55dbad1b99ac0b43dcf';
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
    BuildContext context,
    SearchRecords searchRecords,
  ) {
    return SearchRepositoryProvider(
      context,
      searchRecords,
    );
  }

  @override
  SearchRepositoryProvider getProviderOverride(
    covariant SearchRepositoryProvider provider,
  ) {
    return call(
      provider.context,
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
    this.context,
    this.searchRecords,
  ) : super.internal(
          (ref) => searchRepository(
            ref,
            context,
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

  final BuildContext context;
  final SearchRecords searchRecords;

  @override
  bool operator ==(Object other) {
    return other is SearchRepositoryProvider &&
        other.context == context &&
        other.searchRecords == searchRecords;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);
    hash = _SystemHash.combine(hash, searchRecords.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$enrollmentFormLabelsProviderHash() =>
    r'256f4d2dd498f37e9de1feaa0968d0a9d5767a32';
typedef EnrollmentFormLabelsProviderRef
    = AutoDisposeProviderRef<EnrollmentFormLabelsProvider>;

/// See also [enrollmentFormLabelsProvider].
@ProviderFor(enrollmentFormLabelsProvider)
const enrollmentFormLabelsProviderProvider =
    EnrollmentFormLabelsProviderFamily();

/// See also [enrollmentFormLabelsProvider].
class EnrollmentFormLabelsProviderFamily
    extends Family<EnrollmentFormLabelsProvider> {
  /// See also [enrollmentFormLabelsProvider].
  const EnrollmentFormLabelsProviderFamily();

  /// See also [enrollmentFormLabelsProvider].
  EnrollmentFormLabelsProviderProvider call(
    BuildContext context,
  ) {
    return EnrollmentFormLabelsProviderProvider(
      context,
    );
  }

  @override
  EnrollmentFormLabelsProviderProvider getProviderOverride(
    covariant EnrollmentFormLabelsProviderProvider provider,
  ) {
    return call(
      provider.context,
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
  String? get name => r'enrollmentFormLabelsProviderProvider';
}

/// See also [enrollmentFormLabelsProvider].
class EnrollmentFormLabelsProviderProvider
    extends AutoDisposeProvider<EnrollmentFormLabelsProvider> {
  /// See also [enrollmentFormLabelsProvider].
  EnrollmentFormLabelsProviderProvider(
    this.context,
  ) : super.internal(
          (ref) => enrollmentFormLabelsProvider(
            ref,
            context,
          ),
          from: enrollmentFormLabelsProviderProvider,
          name: r'enrollmentFormLabelsProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$enrollmentFormLabelsProviderHash,
          dependencies: EnrollmentFormLabelsProviderFamily._dependencies,
          allTransitiveDependencies:
              EnrollmentFormLabelsProviderFamily._allTransitiveDependencies,
        );

  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is EnrollmentFormLabelsProviderProvider &&
        other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$dataEntryRepositoryHash() =>
    r'2eced0cc3bc40939b093725d8fdc4dd94dfb1f94';
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
    required BuildContext context,
    required FormRepositoryRecords repositoryRecords,
  }) {
    return DataEntryRepositoryProvider(
      entryMode: entryMode,
      context: context,
      repositoryRecords: repositoryRecords,
    );
  }

  @override
  DataEntryRepositoryProvider getProviderOverride(
    covariant DataEntryRepositoryProvider provider,
  ) {
    return call(
      entryMode: provider.entryMode,
      context: provider.context,
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
    required this.context,
    required this.repositoryRecords,
  }) : super.internal(
          (ref) => dataEntryRepository(
            ref,
            entryMode: entryMode,
            context: context,
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
  final BuildContext context;
  final FormRepositoryRecords repositoryRecords;

  @override
  bool operator ==(Object other) {
    return other is DataEntryRepositoryProvider &&
        other.entryMode == entryMode &&
        other.context == context &&
        other.repositoryRecords == repositoryRecords;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, entryMode.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);
    hash = _SystemHash.combine(hash, repositoryRecords.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$fieldViewModelFactoryHash() =>
    r'e4a89bbe9a2599c24dcea350144619a8023e545a';
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
    BuildContext context,
    bool allowMandatoryFields,
    bool isBackgroundTransparent,
  ) {
    return FieldViewModelFactoryProvider(
      context,
      allowMandatoryFields,
      isBackgroundTransparent,
    );
  }

  @override
  FieldViewModelFactoryProvider getProviderOverride(
    covariant FieldViewModelFactoryProvider provider,
  ) {
    return call(
      provider.context,
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
    this.context,
    this.allowMandatoryFields,
    this.isBackgroundTransparent,
  ) : super.internal(
          (ref) => fieldViewModelFactory(
            ref,
            context,
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

  final BuildContext context;
  final bool allowMandatoryFields;
  final bool isBackgroundTransparent;

  @override
  bool operator ==(Object other) {
    return other is FieldViewModelFactoryProvider &&
        other.context == context &&
        other.allowMandatoryFields == allowMandatoryFields &&
        other.isBackgroundTransparent == isBackgroundTransparent;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);
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
String _$hintProviderHash() => r'bf990c4c480e8b6a6921d4ac6e3944beb6af02cf';
typedef HintProviderRef = AutoDisposeProviderRef<HintProvider>;

/// See also [hintProvider].
@ProviderFor(hintProvider)
const hintProviderProvider = HintProviderFamily();

/// See also [hintProvider].
class HintProviderFamily extends Family<HintProvider> {
  /// See also [hintProvider].
  const HintProviderFamily();

  /// See also [hintProvider].
  HintProviderProvider call(
    BuildContext context,
  ) {
    return HintProviderProvider(
      context,
    );
  }

  @override
  HintProviderProvider getProviderOverride(
    covariant HintProviderProvider provider,
  ) {
    return call(
      provider.context,
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
  String? get name => r'hintProviderProvider';
}

/// See also [hintProvider].
class HintProviderProvider extends AutoDisposeProvider<HintProvider> {
  /// See also [hintProvider].
  HintProviderProvider(
    this.context,
  ) : super.internal(
          (ref) => hintProvider(
            ref,
            context,
          ),
          from: hintProviderProvider,
          name: r'hintProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$hintProviderHash,
          dependencies: HintProviderFamily._dependencies,
          allTransitiveDependencies:
              HintProviderFamily._allTransitiveDependencies,
        );

  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is HintProviderProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

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
String _$uiStyleProviderHash() => r'05eb41d4a62d1a8c1d1e67a69424c4c816df26ca';
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
    BuildContext context,
    bool isBackgroundTransparent,
  ) {
    return UiStyleProviderProvider(
      context,
      isBackgroundTransparent,
    );
  }

  @override
  UiStyleProviderProvider getProviderOverride(
    covariant UiStyleProviderProvider provider,
  ) {
    return call(
      provider.context,
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
    this.context,
    this.isBackgroundTransparent,
  ) : super.internal(
          (ref) => uiStyleProvider(
            ref,
            context,
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

  final BuildContext context;
  final bool isBackgroundTransparent;

  @override
  bool operator ==(Object other) {
    return other is UiStyleProviderProvider &&
        other.context == context &&
        other.isBackgroundTransparent == isBackgroundTransparent;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);
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
