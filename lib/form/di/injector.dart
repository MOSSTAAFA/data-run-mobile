import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/entities/enrollment.entity.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../commons/constants.dart';
import '../../commons/date/entry_mode.dart';
import '../../commons/network/network_utils.dart';
import '../../commons/resources/resource_manager.dart';
import '../../core/enrollment/enrollment_object_repository.dart';
import '../../main/usescases/bundle/bundle.dart';
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
import '../ui/provider/display_name_provider.dart';
import '../ui/provider/display_name_provider_impl.dart';
import '../ui/provider/enrollment_form_labels_provider.dart';
import '../ui/provider/hint_provider.dart';
import '../ui/provider/hint_provider_impl.dart';
import '../ui/provider/keyboard_action_provider.dart';
import '../ui/provider/keyboard_action_provider_impl.dart';
import '../ui/provider/ui_event_types_provider.dart';
import '../ui/provider/ui_event_types_provider_impl.dart';
import '../ui/provider/ui_style_provider.dart';
import '../ui/provider/ui_style_provider_impl.dart';
import '../ui/style/form_ui_model_color_factory_impl.dart';
import '../ui/style/long_text_ui_color_factory_impl.dart';
import '../ui/validation/field_error_message_provider.dart';

part 'injector.g.dart';

// @Riverpod(dependencies: [formRepositoryRecordsInstance])
@riverpod
FormRepository formRepository(
    FormRepositoryRef ref /*, FormRepositoryRecords repositoryRecords*/) {
  // final FormRepositoryRecords repositoryRecords =
  //     ref.watch(formRepositoryRecordsInstanceProvider);
  final Bundle eventBundle = Get.arguments as Bundle;
  final records = eventBundle.getObject(RECORDS);
  if (records == null) {
    throw Exception(
        'You need to set record information in order to persist your data');
  }
  final FormRepositoryRecords repositoryRecords =
      records as FormRepositoryRecords;

  debugPrint(
      'formRepositoryL: Records.recordUid ${repositoryRecords.recordUid}');
  return FormRepositoryImpl(
    formValueStore: ref.watch(_formValueStoreProvider(
        repositoryRecords.recordUid, repositoryRecords.entryMode)),
    fieldErrorMessageProvider: ref.watch(_fieldErrorMessageProviderProvider),
    displayNameProvider: ref.watch(_displayNameProviderProvider),
    dataEntryRepository: ref.watch(_dataEntryRepositoryProvider(
        entryMode: repositoryRecords.entryMode,
        repositoryRecords: repositoryRecords)),
    /*ruleEngineRepository: _provideRuleEngineRepository(
            repositoryRecords.entryMode, repositoryRecords.recordUid),
        rulesUtilsProvider: _provideRulesUtilsProvider(),
        legendValueProvider: _provideLegendValueProvider(context)*/
  );
}

@riverpod
DataEntryRepository _dataEntryRepository(_DataEntryRepositoryRef ref,
    {EntryMode? entryMode, required FormRepositoryRecords repositoryRecords}) {
  switch (entryMode) {
    case EntryMode.ATTR:
      return ref.watch(_enrollmentRepositoryProvider(
          repositoryRecords as EnrollmentRecords));
    case EntryMode.DE:
      return ref
          .watch(_eventRepositoryProvider(repositoryRecords as EventRecords));
    default:
  }
  return ref
      .watch(_searchRepositoryProvider(repositoryRecords as SearchRecords));
}

@riverpod
SearchRepository _searchRepository(
    _SearchRepositoryRef ref, SearchRecords searchRecords) {
  return SearchRepository(
      // d2: _provideD2(),
      fieldViewModelFactory: ref.watch(_fieldViewModelFactoryProvider(
          searchRecords.allowMandatoryFields,
          searchRecords.isBackgroundTransparent)),
      programUid: searchRecords.programUid,
      teiTypeUid: searchRecords.teiTypeUid,
      currentSearchValues: searchRecords.currentSearchValues);
}

@riverpod
EnrollmentRepository _enrollmentRepository(
    _EnrollmentRepositoryRef ref, EnrollmentRecords enrollmentRecords) {
  return EnrollmentRepository(
      fieldFactory: ref.watch(_fieldViewModelFactoryProvider(
          enrollmentRecords.allowMandatoryFields,
          enrollmentRecords.isBackgroundTransparent)),
      enrollmentUid: enrollmentRecords.enrollmentUid,
      // d2: _provideD2(),
      enrollmentMode: enrollmentRecords.enrollmentMode,
      enrollmentFormLabelsProvider:
          ref.watch(_enrollmentFormLabelsProviderProvider));
}

@riverpod
EventRepository _eventRepository(
    _EventRepositoryRef ref, EventRecords eventRecords) {
  return EventRepository(
      fieldFactory: ref.watch(_fieldViewModelFactoryProvider(
          eventRecords.allowMandatoryFields,
          eventRecords.isBackgroundTransparent)),
      eventUid: eventRecords.eventUid);
}

@riverpod
FieldViewModelFactory _fieldViewModelFactory(_FieldViewModelFactoryRef ref,
    bool allowMandatoryFields, bool isBackgroundTransparent) {
  return FieldViewModelFactoryImpl(
    noMandatoryFields: !allowMandatoryFields,
    uiStyleProvider:
        ref.watch(_uiStyleProviderProvider(isBackgroundTransparent)),
    // layoutProvider: ref.watch(_layoutProviderProvider),
    hintProvider: ref.watch(_hintProviderProvider),
    displayNameProvider: ref.watch(_displayNameProviderProvider),
    uiEventTypesProvider: ref.watch(_uiEventTypesProviderProvider),
    keyboardActionProvider: ref.watch(_keyboardActionProviderProvider),
    // legendValueProvider: _provideLegendValueProvider(context)
  );
}

/// _provideEnrollmentObjectRepository(uid)
@riverpod
EnrollmentObjectRepository _enrollmentObjectRepository(
    _EnrollmentObjectRepositoryRef ref, String enrollmentUid) {
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
FormValueStore? _formValueStore(
    _FormValueStoreRef ref, String? recordUid, EntryMode? entryMode,
    [EnrollmentObjectRepository? repository]) {
  Future<String> uid;
  EnrollmentObjectRepository? enrollmentObjectRepository = repository;
  if (entryMode != null) {
    if (entryMode == EntryMode.ATTR) {
      enrollmentObjectRepository =
          ref.watch(_enrollmentObjectRepositoryProvider(recordUid!));
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
        networkUtils: ref.watch(networkUtilsProvider),
        resourceManager: ref.watch(resourceManagerProvider));
  }
  return null;
}

@riverpod
NetworkUtils _networkUtils(_NetworkUtilsRef ref) {
  return const NetworkUtils();
}

@riverpod
FieldErrorMessageProvider _fieldErrorMessageProvider(
    _FieldErrorMessageProviderRef ref) {
  return const FieldErrorMessageProvider();
}

@riverpod
EnrollmentFormLabelsProvider _enrollmentFormLabelsProvider(
    _EnrollmentFormLabelsProviderRef ref) {
  return EnrollmentFormLabelsProvider(ref.watch(resourceManagerProvider));
}

@riverpod
DisplayNameProvider _displayNameProvider(_DisplayNameProviderRef ref) {
  return const DisplayNameProviderImpl(
      OptionSetConfiguration(), OrgUnitConfiguration());
}

@riverpod
KeyboardActionProvider _keyboardActionProvider(_KeyboardActionProviderRef ref) {
  return const KeyboardActionProviderImpl();
}

@riverpod
UiEventTypesProvider _uiEventTypesProvider(_UiEventTypesProviderRef ref) {
  return const UiEventTypesProviderImpl();
}

@riverpod
HintProvider _hintProvider(_HintProviderRef ref) {
  return const HintProviderImpl();
}

@riverpod
UiStyleProvider _uiStyleProvider(
    _UiStyleProviderRef ref, bool isBackgroundTransparent) {
  return UiStyleProviderImpl(
      colorFactory: FormUiModelColorFactoryImpl(
          isBackgroundTransparent: isBackgroundTransparent),
      longTextColorFactory: LongTextUiColorFactoryImpl(
          isBackgroundTransparent: isBackgroundTransparent));
}

@riverpod
SearchOptionSetOption _searchOptionSetOption(_SearchOptionSetOptionRef ref) {
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
