import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/entities/enrollment.entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../commons/date/entry_mode.dart';
import '../../commons/network/network_utils.dart';
import '../../commons/resources/resource_manager.dart';
import '../../core/enrollment/enrollment_object_repository.dart';
import '../data/data_entry_repository.dart';
import '../data/enrollment_repository.dart';
import '../data/event_repository.dart';
import '../data/form_repository.dart';
import '../data/form_repository_impl.dart';
import '../data/form_value_store.dart';
import '../data/metadata/option_set_configuration.dart';
import '../data/metadata/org_unit_configuration.dart';
import '../data/search_option_set_option.dart';
import '../data/search_repository.dart';
import '../model/form_repository_records.dart';
import '../ui/field_view_model_factory.dart';
import '../ui/field_view_model_factory_impl.dart';
import '../ui/layout_provider_impl.dart';
import '../ui/provider/display_name_provider.dart';
import '../ui/provider/display_name_provider_impl.dart';
import '../ui/provider/enrollment_form_labels_provider.dart';
import '../ui/provider/hint_provider.dart';
import '../ui/provider/hint_provider_impl.dart';
import '../ui/provider/keyboard_action_provider.dart';
import '../ui/provider/keyboard_action_provider_impl.dart';
import '../ui/provider/layout_provider.dart';
import '../ui/provider/ui_event_types_provider.dart';
import '../ui/provider/ui_event_types_provider_impl.dart';
import '../ui/provider/ui_style_provider.dart';
import '../ui/provider/ui_style_provider_impl.dart';
import '../ui/style/form_ui_model_color_factory_impl.dart';
import '../ui/style/long_text_ui_color_factory_impl.dart';
import '../ui/validation/field_error_message_provider.dart';

part 'injector.g.dart';

@riverpod
FormRepositoryRecords formRepositoryRecords(FormRepositoryRecordsRef ref) {
  throw UnimplementedError();
}

@riverpod
FormRepository formRepository(FormRepositoryRef ref) {
  return FormRepositoryImpl(
    formValueStore: ref.read(FormValueStoreProvider(
        ref.read(formRepositoryRecordsProvider).recordUid,
        ref.read(formRepositoryRecordsProvider).entryMode)),
    fieldErrorMessageProvider: ref.read(fieldErrorMessageProviderProvider),
    displayNameProvider: ref.read(displayNameProviderProvider),
    dataEntryRepository: ref.read(dataEntryRepositoryProvider(
        entryMode: ref.read(formRepositoryRecordsProvider).entryMode,
        repositoryRecords: ref.read(formRepositoryRecordsProvider))),
    /*ruleEngineRepository: _provideRuleEngineRepository(
            repositoryRecords.entryMode, repositoryRecords.recordUid),
        rulesUtilsProvider: _provideRulesUtilsProvider(),
        legendValueProvider: _provideLegendValueProvider(context)*/
  );
}

/// _provideEnrollmentObjectRepository(uid)
@riverpod
EnrollmentObjectRepository enrollmentObjectRepository(
    EnrollmentObjectRepositoryRef ref, String enrollmentUid) {
  return EnrollmentObjectRepository(enrollmentUid);
}

// @riverpod
// String enrollmentUid(EnrollmentUidRef ref) {
//   throw UnimplementedError();
// }

// @riverpod
// EnrollmentObjectRepository? enrollmentObjectRepositoryForFormValueStore(
//     EnrollmentObjectRepositoryRef ref, String enrollmentUid, ) {
//   return EnrollmentObjectRepository(enrollmentUid);
// }

@riverpod
FormValueStore? formValueStore(
    FormValueStoreRef ref, String? recordUid, EntryMode? entryMode,
    [EnrollmentObjectRepository? repository]) {
  Future<String> uid;
  EnrollmentObjectRepository? enrollmentObjectRepository = repository;
  if (entryMode != null) {
    if (entryMode == EntryMode.ATTR) {
      enrollmentObjectRepository =
          ref.read(enrollmentObjectRepositoryProvider(recordUid!));
      uid = enrollmentObjectRepository!.getEnrollment().then<String>(
          (Enrollment? enrollment) =>
              enrollment?.trackedEntityInstance ?? recordUid);
    } else {
      enrollmentObjectRepository = null;
      uid = Future.value(recordUid);
    }

    return FormValueStore(
        // d2: _provideD2(),
        // recordUid: enrollmentObjectRepository
        //         ?.blockingGet()
        //         ?.trackedEntityInstance() ??
        //     recordUid!,
        recordUidFuture: uid,
        entryMode: entryMode,
        enrollmentRepository: enrollmentObjectRepository,
        // crashReportController: _provideCrashReportController(),
        networkUtils: ref.read(networkUtilsProvider),
        resourceManager: ref.read(resourceManagerProvider));
  }
  return null;
}

@riverpod
NetworkUtils networkUtils(NetworkUtilsRef ref) {
  return const NetworkUtils();
}

@riverpod
FieldErrorMessageProvider fieldErrorMessageProvider(
    FieldErrorMessageProviderRef ref) {
  return const FieldErrorMessageProvider();
}

@riverpod
EnrollmentRepository enrollmentRepository(
    EnrollmentRepositoryRef ref, EnrollmentRecords enrollmentRecords) {
  return EnrollmentRepository(
      fieldFactory: ref.read(fieldViewModelFactoryProvider(
          enrollmentRecords.allowMandatoryFields,
          enrollmentRecords.isBackgroundTransparent)),
      enrollmentUid: enrollmentRecords.enrollmentUid,
      // d2: _provideD2(),
      enrollmentMode: enrollmentRecords.enrollmentMode,
      enrollmentFormLabelsProvider:
          ref.read(enrollmentFormLabelsProviderProvider));
}

@riverpod
EventRepository eventRepository(
    EventRepositoryRef ref, EventRecords eventRecords) {
  return EventRepository(
      fieldFactory: ref.read(fieldViewModelFactoryProvider(
          eventRecords.allowMandatoryFields,
          eventRecords.isBackgroundTransparent)),
      eventUid: eventRecords.eventUid);
}

@riverpod
SearchRepository searchRepository(
    SearchRepositoryRef ref, SearchRecords searchRecords) {
  return SearchRepository(
      // d2: _provideD2(),
      fieldViewModelFactory: ref.read(fieldViewModelFactoryProvider(
          searchRecords.allowMandatoryFields,
          searchRecords.isBackgroundTransparent)),
      programUid: searchRecords.programUid,
      teiTypeUid: searchRecords.teiTypeUid,
      currentSearchValues: searchRecords.currentSearchValues);
}

@riverpod
EnrollmentFormLabelsProvider enrollmentFormLabelsProvider(
    EnrollmentFormLabelsProviderRef ref) {
  return EnrollmentFormLabelsProvider(ref.read(resourceManagerProvider));
}

@riverpod
DataEntryRepository dataEntryRepository(DataEntryRepositoryRef ref,
    {EntryMode? entryMode, required FormRepositoryRecords repositoryRecords}) {
  switch (entryMode) {
    case EntryMode.ATTR:
      return ref.read(
          enrollmentRepositoryProvider(repositoryRecords as EnrollmentRecords));
    case EntryMode.DE:
      return ref
          .read(eventRepositoryProvider(repositoryRecords as EventRecords));
    default:
  }
  return ref.read(searchRepositoryProvider(repositoryRecords as SearchRecords));
}

@riverpod
FieldViewModelFactory fieldViewModelFactory(FieldViewModelFactoryRef ref,
    bool allowMandatoryFields, bool isBackgroundTransparent) {
  return FieldViewModelFactoryImpl(
    noMandatoryFields: !allowMandatoryFields,
    uiStyleProvider: ref.read(uiStyleProviderProvider(isBackgroundTransparent)),
    layoutProvider: ref.read(layoutProviderProvider),
    hintProvider: ref.read(hintProviderProvider),
    displayNameProvider: ref.read(displayNameProviderProvider),
    uiEventTypesProvider: ref.read(uiEventTypesProviderProvider),
    keyboardActionProvider: ref.read(keyboardActionProviderProvider),
    // legendValueProvider: _provideLegendValueProvider(context)
  );
}

@riverpod
DisplayNameProvider displayNameProvider(DisplayNameProviderRef ref) {
  return const DisplayNameProviderImpl(
      OptionSetConfiguration(), OrgUnitConfiguration());
}

@riverpod
KeyboardActionProvider keyboardActionProvider(KeyboardActionProviderRef ref) {
  return const KeyboardActionProviderImpl();
}

@riverpod
UiEventTypesProvider uiEventTypesProvider(UiEventTypesProviderRef ref) {
  return const UiEventTypesProviderImpl();
}

@riverpod
HintProvider hintProvider(HintProviderRef ref) {
  return const HintProviderImpl();
}

@riverpod
LayoutProvider layoutProvider(LayoutProviderRef ref) {
  return const LayoutProviderImpl();
}

@riverpod
UiStyleProvider uiStyleProvider(
    UiStyleProviderRef ref, bool isBackgroundTransparent) {
  return UiStyleProviderImpl(
      colorFactory: FormUiModelColorFactoryImpl(
          isBackgroundTransparent: isBackgroundTransparent),
      longTextColorFactory: LongTextUiColorFactoryImpl(
          isBackgroundTransparent: isBackgroundTransparent));
}

@riverpod
SearchOptionSetOption searchOptionSetOption(SearchOptionSetOptionRef ref) {
  return SearchOptionSetOption(D2Remote.optionModule);
}

// RuleEngineRepository? _provideRuleEngineRepository(EntryMode? entryMode,
//     String? recordUid) {
//   switch (entryMode) {
//     case EntryMode.ATTR:
//       return _provideEnrollmentRuleEngineRepository(recordUid!);
//     case EntryMode.DE:
//       return _provideEventRuleEngineRepository(recordUid!);
//     default:
//       return null;
//   }
// }
//
// EnrollmentRuleEngineRepository _provideEnrollmentRuleEngineRepository(
//     String enrollmentUid) =>
//     EnrollmentRuleEngineRepository(_provideD2(), enrollmentUid);
//
// EventRuleEngineRepository _provideEventRuleEngineRepository(
//     String eventUid) =>
//     EventRuleEngineRepository(_provideD2(), eventUid);
//
// RulesUtilsProviderImpl _provideRulesUtilsProvider() =>
//     RulesUtilsProviderImpl(_provideD2());
//
// LegendValueProviderImpl _provideLegendValueProvider(BuildContext context) =>
//     LegendValueProviderImpl(
//         _provideD2(),
//         _provideResourcesManager(context)
//     );
