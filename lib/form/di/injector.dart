import 'package:d2_remote/d2_remote.dart';
import 'package:flutter/material.dart';
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
import '../ui/form_view_model_factory.dart';
import '../ui/layout_provider_impl.dart';
import '../ui/provider/display_name_provider_impl.dart';
import '../ui/provider/enrollment_form_labels_provider.dart';
import '../ui/provider/hint_provider_impl.dart';
import '../ui/provider/keyboard_action_provider_impl.dart';
import '../ui/provider/ui_event_types_provider_impl.dart';
import '../ui/provider/ui_style_provider.dart';
import '../ui/provider/ui_style_provider_impl.dart';
import '../ui/style/form_ui_model_color_factory_impl.dart';
import '../ui/style/long_text_ui_color_factory_impl.dart';
import '../ui/validation/field_error_message_provider.dart';

// /// Function that returns a [BuiltValueToStringHelper].
// typedef BuiltValueToStringHelperProvider = BuiltValueToStringHelper Function(
//     String className);
//
// /// Function used by generated code to get a [BuiltValueToStringHelper].
// /// Set this to change built_value class toString() output. Built-in examples
// /// are [IndentingBuiltValueToStringHelper], which is the default, and
// /// [FlatBuiltValueToStringHelper].
// BuiltValueToStringHelperProvider newBuiltValueToStringHelper =
//     (String className) => IndentingBuiltValueToStringHelper(className);

class Injector {

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory Injector() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  Injector._internal() {
    // initialization logic
  }
  static final Injector _instance = Injector._internal();

  FormViewModelFactory provideFormViewModelFactory(
      BuildContext context, FormRepositoryRecords repositoryRecords) {
    return FormViewModelFactory(
      _provideFormRepository(
          context, repositoryRecords), /*provideDispatchers()*/
    );
  }

  // static D2Remote get _provideD2 => D2Remote();

  SearchOptionSetOption provideOptionSetDialog() {
    return SearchOptionSetOption(D2Remote.optionModule);
  }

  // DispatcherProvider provideDispatchers() {
  //   return FormDispatcher();
  // }

  FormRepository _provideFormRepository(
      BuildContext context, FormRepositoryRecords repositoryRecords) {
    return FormRepositoryImpl(
      formValueStore: _provideFormValueStore(
          context, repositoryRecords.recordUid, repositoryRecords.entryMode),
      fieldErrorMessageProvider: _provideFieldErrorMessage(context),
      displayNameProvider: _provideDisplayNameProvider(),
      dataEntryRepository: _provideDataEntryRepository(
          entryMode: repositoryRecords.entryMode,
          context: context,
          repositoryRecords: repositoryRecords),
      /*ruleEngineRepository: _provideRuleEngineRepository(
            repositoryRecords.entryMode, repositoryRecords.recordUid),
        rulesUtilsProvider: _provideRulesUtilsProvider(),
        legendValueProvider: _provideLegendValueProvider(context)*/
    );
  }

  DataEntryRepository _provideDataEntryRepository(
      {EntryMode? entryMode,
      required BuildContext context,
      required FormRepositoryRecords repositoryRecords}) {
    switch (entryMode) {
      case EntryMode.ATTR:
        return _provideEnrollmentRepository(
            context, repositoryRecords as EnrollmentRecords);
      case EntryMode.DE:
        return _provideEventRepository(
            context, repositoryRecords as EventRecords);
      default:
        return _provideSearchRepository(
            context, repositoryRecords as SearchRecords);
    }
  }

  DataEntryRepository _provideSearchRepository(
      BuildContext context, SearchRecords searchRecords) {
    return SearchRepository(
        // d2: _provideD2(),
        fieldViewModelFactory: _provideFieldFactory(
            context,
            searchRecords.allowMandatoryFields,
            searchRecords.isBackgroundTransparent),
        programUid: searchRecords.programUid,
        teiTypeUid: searchRecords.teiTypeUid,
        currentSearchValues: searchRecords.currentSearchValues);
  }

  DataEntryRepository _provideEnrollmentRepository(
      BuildContext context, EnrollmentRecords enrollmentRecords) {
    return EnrollmentRepository(
        fieldFactory: _provideFieldFactory(
            context,
            enrollmentRecords.allowMandatoryFields,
            enrollmentRecords.isBackgroundTransparent),
        enrollmentUid: enrollmentRecords.enrollmentUid,
        // d2: _provideD2(),
        enrollmentMode: enrollmentRecords.enrollmentMode,
        enrollmentFormLabelsProvider:
            _provideEnrollmentFormLabelsProvider(context));
  }

  DataEntryRepository _provideEventRepository(
      BuildContext context, EventRecords eventRecords) {
    return EventRepository(
      fieldFactory: _provideFieldFactory(
          context,
          eventRecords.allowMandatoryFields,
          eventRecords.isBackgroundTransparent),
      eventUid: eventRecords.eventUid, /*d2: _provideD2()*/
    );
  }

  EnrollmentFormLabelsProvider _provideEnrollmentFormLabelsProvider(
      BuildContext context) {
    return EnrollmentFormLabelsProvider(_provideResourcesManager(context));
  }

  FieldViewModelFactory _provideFieldFactory(BuildContext context,
      bool allowMandatoryFields, bool isBackgroundTransparent) {
    return FieldViewModelFactoryImpl(
      noMandatoryFields: !allowMandatoryFields,
      uiStyleProvider:
          _provideUiStyleProvider(context, isBackgroundTransparent),
      layoutProvider: _provideLayoutProvider(),
      hintProvider: _provideHintProvider(context),
      displayNameProvider: _provideDisplayNameProvider(),
      uiEventTypesProvider: _provideUiEventTypesProvider(),
      keyboardActionProvider: _provideKeyBoardActionProvider(),
      // legendValueProvider: _provideLegendValueProvider(context)
    );
  }

  KeyboardActionProviderImpl _provideKeyBoardActionProvider() =>
      const KeyboardActionProviderImpl();

  UiEventTypesProviderImpl _provideUiEventTypesProvider() =>
      const UiEventTypesProviderImpl();

  HintProviderImpl _provideHintProvider(BuildContext context) =>
      HintProviderImpl(context);

  LayoutProviderImpl _provideLayoutProvider() => const LayoutProviderImpl();

  UiStyleProvider _provideUiStyleProvider(
          BuildContext context, bool isBackgroundTransparent) =>
      UiStyleProviderImpl(
          colorFactory: FormUiModelColorFactoryImpl(
              context: context,
              isBackgroundTransparent: isBackgroundTransparent),
          longTextColorFactory: LongTextUiColorFactoryImpl(
              context: context,
              isBackgroundTransparent: isBackgroundTransparent));

  FormValueStore? _provideFormValueStore(
      BuildContext context, String? recordUid, EntryMode? entryMode) {
    Future<String> uid;
    if (entryMode != null) {
      EnrollmentObjectRepository? enrollmentObjectRepository;
      if (entryMode == EntryMode.ATTR) {
        enrollmentObjectRepository =
            _provideEnrollmentObjectRepository(recordUid!);
        uid = enrollmentObjectRepository.getEnrollment().then<String>(
            (enrollment) => enrollment?.trackedEntityInstance ?? recordUid);
      } else {
        enrollmentObjectRepository = null;
        uid = Future.value(recordUid!);
      }

      // Future<String> uid =
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
          networkUtils: _provideNetworkUtils(context),
          resourceManager: _provideResourcesManager(context));
    }
    return null;
  }

  EnrollmentObjectRepository _provideEnrollmentObjectRepository(
      String enrollmentUid) {
    return EnrollmentObjectRepository(enrollmentUid);
  }

  // CrashReportControllerImpl _provideCrashReportController() =>
  //     CrashReportControllerImpl();
  //
  NetworkUtils _provideNetworkUtils(BuildContext context) =>
      NetworkUtils(context);

  ResourceManager _provideResourcesManager(BuildContext context) =>
      ResourceManager(context);

  FieldErrorMessageProvider _provideFieldErrorMessage(BuildContext context) {
    return FieldErrorMessageProvider(context);
  }

  DisplayNameProviderImpl _provideDisplayNameProvider() =>
      const DisplayNameProviderImpl(
          OptionSetConfiguration(), OrgUnitConfiguration());

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
}
