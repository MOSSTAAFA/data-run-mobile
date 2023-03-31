import 'package:flutter/material.dart';

import '../../../../../commons/resources/resource_manager.dart';
import '../../../../../form/data/metadata/option_set_configuration.dart';
import '../../../../../form/data/metadata/org_unit_configuration.dart';
import '../../../../../form/ui/field_view_model_factory.dart';
import '../../../../../form/ui/field_view_model_factory_impl.dart';
import '../../../../../form/ui/layout_provider_impl.dart';
import '../../../../../form/ui/provider/display_name_provider_impl.dart';
import '../../../../../form/ui/provider/hint_provider_impl.dart';
import '../../../../../form/ui/provider/keyboard_action_provider_impl.dart';
import '../../../../../form/ui/provider/ui_event_types_provider_impl.dart';
import '../../../../../form/ui/provider/ui_style_provider_impl.dart';
import '../../../../../form/ui/style/form_ui_model_color_factory_impl.dart';
import '../../../../../form/ui/style/long_text_ui_color_factory_impl.dart';
import '../../../../l10n/app_localizations.dart';
import '../../event_capture/event_field_mapper.dart';
import '../event_initial_repository.dart';
import '../event_initial_repository_impl.dart';

class EventInitialModule {
  EventInitialModule(
      {required String stageUid,
      String? eventUid,
      required BuildContext activityContext})
      : _stageUid = stageUid,
        _eventUid = eventUid,
        _activityContext = activityContext;

  // final EventInitialContract.View view;
  final String _stageUid;
  final String? _eventUid;
  final BuildContext _activityContext;

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

  EventFieldMapper provideFieldMapper(
      BuildContext context,

      /// injected from [fieldFactory()]
      FieldViewModelFactory fieldFactory) {
    return EventFieldMapper(
        fieldFactory: fieldFactory,
        mandatoryFieldWarning:
            AppLocalization.of(context)!.lookup('field_is_mandatory'));
  }

  FieldViewModelFactory fieldFactory(
      BuildContext context,

      /// injected from global appModule [resources()]
      ResourceManager resourceManager) {
    return FieldViewModelFactoryImpl(
      noMandatoryFields: false,
      uiStyleProvider: UiStyleProviderImpl(
          colorFactory: FormUiModelColorFactoryImpl(
              context: _activityContext, isBackgroundTransparent: true),
          longTextColorFactory: LongTextUiColorFactoryImpl(
              context: _activityContext, isBackgroundTransparent: true)),
      layoutProvider: const LayoutProviderImpl(),
      hintProvider: HintProviderImpl(context),
      displayNameProvider: const DisplayNameProviderImpl(
          OptionSetConfiguration(), OrgUnitConfiguration()),
      uiEventTypesProvider: const UiEventTypesProviderImpl(),
      keyboardActionProvider: const KeyboardActionProviderImpl(),
      // legendValueProvider: LegendValueProviderImpl(resourceManager)
    );
  }

  // FormRepository formRepository(RulesRepository rulesRepository) {
  //   return EventRepository(rulesRepository, eventUid, d2);
  // }

  // RulesRepository rulesRepository() {
  //   return RulesRepository();
  // }

  EventInitialRepository eventDetailRepository(
      FieldViewModelFactory

          /// injected from [fieldFactory()]
          fieldViewModelFactory /*,
      RuleEngineRepository ruleEngineRepository*/
      ) {
    return EventInitialRepositoryImpl(
        eventUid: _eventUid,
        stageUid: _stageUid,
        fieldFactory: fieldViewModelFactory /*, ruleEngineRepository*/);
  }

// RuleEngineRepository ruleEngineRepository(FormRepository formRepository) {
//   return EventRuleEngineRepository(d2, formRepository, eventUid);
// }
}
