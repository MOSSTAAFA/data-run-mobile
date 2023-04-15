import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../commons/prefs/preference_provider.dart';
import '../../../../../form/di/injector.dart';
import '../../../../l10n/app_localizations.dart';
import '../../event_capture/event_field_mapper.dart';
import '../event_initial_presenter.dart';
import '../event_initial_repository.dart';
import '../event_initial_repository_impl.dart';
import '../model/event_initial_bundle.dart';

part 'event_initial_module.g.dart';

// @riverpod
// EventInitialBundle eventInitialBundle(EventInitialBundleRef ref) {
//   throw UnimplementedError();
// }

@riverpod
class EventBundle extends _$EventBundle {
  @override
  EventInitialBundle build() {
    return EventInitialBundle();
  }

  void setValue(EventInitialBundle value) {
    state = value;
  }
}

@riverpod
EventFieldMapper fieldMapper(FieldMapperRef ref) {
  final BuildContext context = ref.read(buildContextProvider);
  return EventFieldMapper(
      fieldFactory:
          ref.read(fieldViewModelFactoryProvider(context, true, true)),
      mandatoryFieldWarning:
          AppLocalization.of(context)!.lookup('field_is_mandatory'));
}

@riverpod
EventInitialRepository eventInitialRepository(EventInitialRepositoryRef ref) {
  final BuildContext context = ref.read(buildContextProvider);
  final EventInitialBundle eventBundle = ref.read(eventBundleProvider);

  return EventInitialRepositoryImpl(ref,
      fieldFactory:
          ref.read(fieldViewModelFactoryProvider(context, true, true)),
      eventUid: eventBundle.eventUid,
      stageUid: eventBundle.programStageUid!);
}

@riverpod
EventInitialPresenter eventInitialPresenter(EventInitialPresenterRef ref) {
  return EventInitialPresenter(ref);
}

@Riverpod(keepAlive: true)
PreferenceProvider preferences(PreferencesRef ref) {
  throw UnimplementedError();
}

// class EventInitialModule {
//   EventInitialModule(this.ref,
//       {required String stageUid,
//       String? eventUid,
//       required BuildContext activityContext})
//       : _stageUid = stageUid,
//         _eventUid = eventUid,
//         _activityContext = activityContext;

//   // final EventInitialContract.View view;
//   final AutoDisposeRef ref;

//   final String _stageUid;
//   final String? _eventUid;
//   final BuildContext _activityContext;

  // EventInitialPresenter providesPresenter(
  //     // RulesUtilsProvider rulesUtilsProvider,
  //     EventInitialRepository eventInitialRepository,
  //     PreferenceProvider preferenceProvider,
  //     // AnalyticsHelper analyticsHelper,
  //     // MatomoAnalyticsController matomoAnalyticsController,
  //     EventFieldMapper eventFieldMapper) {
  //   return EventInitialPresenter(
  //       view,
  //       rulesUtilsProvider,
  //       /// injected from (eventDetailRepository)
  //       eventInitialRepository,
  //       schedulerProvider,
  //       preferenceProvider,
  //       analyticsHelper,
  //       matomoAnalyticsController,
  //       eventFieldMapper);
  // }

  // EventFieldMapper provideFieldMapper(
  //     BuildContext context,

  //     /// injected from [fieldFactory()]
  //     FieldViewModelFactory fieldFactory) {
  //   return EventFieldMapper(
  //       fieldFactory: fieldFactory,
  //       mandatoryFieldWarning:
  //           AppLocalization.of(context)!.lookup('field_is_mandatory'));
  // }

  // FieldViewModelFactory fieldFactory(
  //     BuildContext context,

  //     /// injected from global appModule [resources()]
  //     ResourceManager resourceManager) {
  //   return FieldViewModelFactoryImpl(
  //     noMandatoryFields: false,
  //     uiStyleProvider: UiStyleProviderImpl(
  //         colorFactory: FormUiModelColorFactoryImpl(
  //             context: _activityContext, isBackgroundTransparent: true),
  //         longTextColorFactory: LongTextUiColorFactoryImpl(
  //             context: _activityContext, isBackgroundTransparent: true)),
  //     layoutProvider: const LayoutProviderImpl(),
  //     hintProvider: HintProviderImpl(context),
  //     displayNameProvider: const DisplayNameProviderImpl(
  //         OptionSetConfiguration(), OrgUnitConfiguration()),
  //     uiEventTypesProvider: const UiEventTypesProviderImpl(),
  //     keyboardActionProvider: const KeyboardActionProviderImpl(),
  //     // legendValueProvider: LegendValueProviderImpl(resourceManager)
  //   );
  // }

  // FormRepository formRepository(RulesRepository rulesRepository) {
  //   return EventRepository(rulesRepository, eventUid, d2);
  // }

  // RulesRepository rulesRepository() {
  //   return RulesRepository();
  // }

  // EventInitialRepository eventDetailRepository(
  //     FieldViewModelFactory

  //         /// injected from [fieldFactory()]
  //         fieldViewModelFactory /*,
  //     RuleEngineRepository ruleEngineRepository*/
  //     ) {
  //   return EventInitialRepositoryImpl(
  //       eventUid: _eventUid,
  //       stageUid: _stageUid,
  //       fieldFactory: fieldViewModelFactory /*, ruleEngineRepository*/);
  // }

// RuleEngineRepository ruleEngineRepository(FormRepository formRepository) {
//   return EventRuleEngineRepository(d2, formRepository, eventUid);
// }
// }
