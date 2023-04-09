import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/entities/enrollment.entity.dart';
import 'package:flutter/material.dart';
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
BuildContext buildContext(BuildContextRef ref) {
  throw UnimplementedError();
}

@riverpod
FormRepositoryRecords formRepositoryRecords(FormRepositoryRecordsRef ref) {
  throw UnimplementedError();
}

@riverpod
FormRepository formRepository(FormRepositoryRef ref) {
  return FormRepositoryImpl(
    formValueStore: ref.watch(FormValueStoreProvider(
        ref.watch(buildContextProvider),
        ref.watch(formRepositoryRecordsProvider).recordUid,
        ref.watch(formRepositoryRecordsProvider).entryMode)),
    fieldErrorMessageProvider: ref.watch(
        fieldErrorMessageProviderProvider(ref.watch(buildContextProvider))),
    displayNameProvider: ref.watch(displayNameProviderProvider),
    dataEntryRepository: ref.watch(dataEntryRepositoryProvider(
        entryMode: ref.watch(formRepositoryRecordsProvider).entryMode,
        context: ref.watch(buildContextProvider),
        repositoryRecords: ref.watch(formRepositoryRecordsProvider))),
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
FormValueStore? formValueStore(FormValueStoreRef ref, BuildContext context,
    String? recordUid, EntryMode? entryMode) {
  Future<String> uid;
  if (entryMode != null) {
    EnrollmentObjectRepository? enrollmentObjectRepository;
    if (entryMode == EntryMode.ATTR) {
      enrollmentObjectRepository =
          ref.watch(enrollmentObjectRepositoryProvider(recordUid!));
      uid = enrollmentObjectRepository!.getEnrollment().then<String>(
          (Enrollment? enrollment) =>
              enrollment?.trackedEntityInstance ?? recordUid);
    } else {
      enrollmentObjectRepository = null;
      uid = Future.value(recordUid!);
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
        networkUtils: ref.watch(networkUtilsProvider(context)),
        resourceManager: ref.watch(resourceManagerProvider(context)));
  }
  return null;
}

@riverpod
NetworkUtils networkUtils(NetworkUtilsRef ref, BuildContext context) {
  return NetworkUtils(context);
}

@riverpod
ResourceManager resourceManager(ResourceManagerRef ref, BuildContext context) {
  return ResourceManager(context);
}

@riverpod
FieldErrorMessageProvider fieldErrorMessageProvider(
    FieldErrorMessageProviderRef ref, BuildContext context) {
  return FieldErrorMessageProvider(context);
}

@riverpod
EnrollmentRepository enrollmentRepository(EnrollmentRepositoryRef ref,
    BuildContext context, EnrollmentRecords enrollmentRecords) {
  return EnrollmentRepository(
      fieldFactory: ref.watch(fieldViewModelFactoryProvider(
          context,
          enrollmentRecords.allowMandatoryFields,
          enrollmentRecords.isBackgroundTransparent)),
      enrollmentUid: enrollmentRecords.enrollmentUid,
      // d2: _provideD2(),
      enrollmentMode: enrollmentRecords.enrollmentMode,
      enrollmentFormLabelsProvider:
          ref.watch(enrollmentFormLabelsProviderProvider(context)));
}

@riverpod
EventRepository eventRepository(
    EventRepositoryRef ref, BuildContext context, EventRecords eventRecords) {
  return EventRepository(
      fieldFactory: ref.watch(fieldViewModelFactoryProvider(
          context,
          eventRecords.allowMandatoryFields,
          eventRecords.isBackgroundTransparent)),
      eventUid: eventRecords.eventUid);
}

@riverpod
SearchRepository searchRepository(SearchRepositoryRef ref, BuildContext context,
    SearchRecords searchRecords) {
  return SearchRepository(
      // d2: _provideD2(),
      fieldViewModelFactory: ref.watch(fieldViewModelFactoryProvider(
          context,
          searchRecords.allowMandatoryFields,
          searchRecords.isBackgroundTransparent)),
      programUid: searchRecords.programUid,
      teiTypeUid: searchRecords.teiTypeUid,
      currentSearchValues: searchRecords.currentSearchValues);
}

@riverpod
EnrollmentFormLabelsProvider enrollmentFormLabelsProvider(
    EnrollmentFormLabelsProviderRef ref, BuildContext context) {
  return EnrollmentFormLabelsProvider(
      ref.watch(resourceManagerProvider(context)));
}

@riverpod
DataEntryRepository dataEntryRepository(DataEntryRepositoryRef ref,
    {EntryMode? entryMode,
    required BuildContext context,
    required FormRepositoryRecords repositoryRecords}) {
  switch (entryMode) {
    case EntryMode.ATTR:
      return ref.watch(enrollmentRepositoryProvider(
          context, repositoryRecords as EnrollmentRecords));
    case EntryMode.DE:
      return ref.watch(
          eventRepositoryProvider(context, repositoryRecords as EventRecords));
  }
  return ref.watch(
      searchRepositoryProvider(context, repositoryRecords as SearchRecords));
}

@riverpod
FieldViewModelFactory fieldViewModelFactory(
    FieldViewModelFactoryRef ref,
    BuildContext context,
    bool allowMandatoryFields,
    bool isBackgroundTransparent) {
  return FieldViewModelFactoryImpl(
    noMandatoryFields: !allowMandatoryFields,
    uiStyleProvider:
        ref.watch(uiStyleProviderProvider(context, isBackgroundTransparent)),
    layoutProvider: ref.watch(layoutProviderProvider),
    hintProvider: ref.watch(hintProviderProvider(context)),
    displayNameProvider: ref.watch(displayNameProviderProvider),
    uiEventTypesProvider: ref.watch(uiEventTypesProviderProvider),
    keyboardActionProvider: ref.watch(keyboardActionProviderProvider),
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
HintProvider hintProvider(HintProviderRef ref, BuildContext context) {
  return HintProviderImpl(context);
}

@riverpod
LayoutProvider layoutProvider(LayoutProviderRef ref) {
  return const LayoutProviderImpl();
}

@riverpod
UiStyleProvider uiStyleProvider(UiStyleProviderRef ref, BuildContext context,
    bool isBackgroundTransparent) {
  return UiStyleProviderImpl(
      colorFactory: FormUiModelColorFactoryImpl(
          context: context, isBackgroundTransparent: isBackgroundTransparent),
      longTextColorFactory: LongTextUiColorFactoryImpl(
          context: context, isBackgroundTransparent: isBackgroundTransparent));
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
