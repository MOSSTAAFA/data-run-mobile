import 'package:d2_remote/modules/data/tracker/models/geometry.dart';
import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_stage.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../commons/extensions/string_extension.dart';
import '../../../../commons/helpers/collections.dart';
import '../../../../commons/prefs/preference.dart';
import '../../../../core/event/event_editable_status.dart';
import '../../../../form/data/form_section_view_model.dart';
import '../../../../form/di/injector.dart';
import '../../../../form/model/field_ui_model.dart';
import '../../../../form/ui/form_view_model.dart';
import '../../../l10n/app_localizations.dart';
import '../event_capture/event_section_model.dart';
import 'di/event_initial_module.dart';
import 'event_initial_repository.dart';
import 'model/event_initial_bundle.dart';
import 'di/presenter_providers.dart';

class EventInitialPresenter {
  EventInitialPresenter(this.ref) {
    _init();
  }
  final AutoDisposeRef ref;
  // final PreferenceProvider preferences;
  //  final AnalyticsHelper analyticsHelper;

  late final EventInitialRepository eventInitialRepository;

  //  final RulesUtilsProvider ruleUtils;

  //  final SchedulerProvider schedulerProvider;
  // final EventFieldMapper eventFieldMapper;

  // String? eventId;

  // Program? program;

  // String? programStageId;
  late final EventInitialBundle eventBundle;

  Future<void> _init() async {
    eventBundle = ref.read(eventBundleProvider);
    // eventId = eventBundle.eventUid;
    // programStageId = eventBundle.programStageUid!;
    eventInitialRepository = ref.read(eventInitialRepositoryProvider);
    // view.setAccessDataWrite(
    //             eventInitialRepository.accessDataWrite(programId).blockingFirst()
    //     );
    if (eventBundle.eventUid != null) {
      final program = await eventInitialRepository
          .getProgramWithId(eventBundle.programUid!);
      final programStage = await eventInitialRepository
          .programStageForEvent(eventBundle.eventUid!);
      ref.read(eventBundleProvider.notifier).setValue(
          eventBundle.copyWith(program: program, programStage: programStage));
    } else {
      eventInitialRepository
          .getProgramWithId(eventBundle.programUid!)
          .then((Program? program) {
        ref
            .read(eventBundleProvider.notifier)
            .setValue(eventBundle.copyWith(program: program));
      });

      _getProgramStages(eventBundle.programUid!, eventBundle.programStageUid!);
    }

    if (eventBundle.eventUid != null) {
      _getSectionCompletion();
    }
  }

  String getCurrentOrgUnit(String orgUnitUid) {
    if (ref.read(preferencesProvider).contains([CURRENT_ORG_UNIT])) {
      return ref.read(preferencesProvider).getString(CURRENT_ORG_UNIT)!;
    } else {
      return orgUnitUid;
    }
  }

  void onShareClick() {
    // view.showQR();
  }

  void deleteEvent(String trackedEntityInstance) {
    final BuildContext context = ref.read(buildContextProvider);
    if (eventBundle.eventUid != null) {
      eventInitialRepository.deleteEvent(
          eventBundle.eventUid!, trackedEntityInstance);
      ref
          .read(showToastProvider.notifier)
          .setValue(AppLocalization.of(context)!.lookup('event_was_deleted'));
    } else {
      ref
          .read(showToastProvider.notifier)
          .setValue(AppLocalization.of(context)!.lookup('delete_event_error'));
    }
  }

  Future<bool> isEnrollmentOpen() {
    return eventInitialRepository.isEnrollmentOpen();
  }

  void getProgramStage(String programStageUid) {
    eventInitialRepository
        .programStageWithId(programStageUid)
        .then((value) => ref
            .read(eventBundleProvider.notifier)
            .setValue(eventBundle.copyWith(programStage: value)))
        .onError((error, stackTrace) {
      // view.showProgramStageSelection();
    });
    //   compositeDisposable.add(
    //           eventInitialRepository.programStageWithId(programStageUid)
    //                   .subscribeOn(schedulerProvider.io())
    //                   .observeOn(schedulerProvider.ui())
    //                   .subscribe(
    //                           programStage -> view.setProgramStage(programStage),
    //                           throwable -> view.showProgramStageSelection()
    //                   )
    //   );
  }

  Future<void> _getProgramStages(
      String programUid, String programStageUid) async {
    Future<ProgramStage?> programStage;
    if (eventBundle.programStageUid.isNullOrEmpty) {
      programStage = eventInitialRepository.programStage(programUid);
    } else {
      programStage = eventInitialRepository.programStageWithId(programStageUid);
    }
    programStage
        .then((ProgramStage? value) => ref
            .read(eventBundleProvider.notifier)
            .setValue(eventBundle.copyWith(programStage: value)))
        .onError((error, stackTrace) {
      // view.showProgramStageSelection();
    });
  }

  void onBackClick() {
    // setChangingCoordinates(false);
    // if (eventId != null)
    //     analyticsHelper.setEvent(BACK_EVENT, CLICK, CREATE_EVENT);
    // view.back();
  }

  void createEvent(
      String enrollmentUid,
      String programStageModel,
      DateTime date,
      String activityUid,
      String orgUnitUid,
      Geometry geometry,
      String trackedEntityInstance) {
    if (eventBundle.program != null) {
      ref.read(preferencesProvider).setValue(CURRENT_ORG_UNIT, orgUnitUid);
      eventInitialRepository
          .createEvent(
              enrollmentUid,
              trackedEntityInstance,
              eventBundle.program!.id!,
              programStageModel,
              date,
              orgUnitUid,
              activityUid,
              geometry)
          .then((String value) =>
              ref.read(onEventCreatedProvider.notifier).setValue(value))
          .onError((error, stackTrace) => ref
              .read(errorRenderProvider.notifier)
              .setValue(error.toString()));
    }
  }

  void scheduleEventPermanent(
      String enrollmentUid,
      String trackedEntityInstanceUid,
      String programStageModel,
      DateTime dueDate,
      String activityUid,
      String orgUnitUid,
      Geometry geometry) {
    if (eventBundle.program != null) {
      ref.read(preferencesProvider).setValue(CURRENT_ORG_UNIT, orgUnitUid);
      eventInitialRepository
          .permanentReferral(
              enrollmentUid,
              trackedEntityInstanceUid,
              eventBundle.program!.id!,
              programStageModel,
              dueDate,
              orgUnitUid,
              activityUid,
              geometry)
          .then((String value) =>
              ref.read(onEventCreatedProvider.notifier).setValue(value))
          .onError((error, stackTrace) => ref
              .read(errorRenderProvider.notifier)
              .setValue(error.toString()));
    }
  }

  void scheduleEvent(
      String enrollmentUid,
      String programStageModel,
      DateTime dueDate,
      String orgUnitUid,
      String activityUid,
      Geometry geometry) {
    if (eventBundle.program != null) {
      ref.read(preferencesProvider).setValue(CURRENT_ORG_UNIT, orgUnitUid);
      eventInitialRepository
          .scheduleEvent(enrollmentUid, null, eventBundle.program!.id!,
              programStageModel, dueDate, orgUnitUid, activityUid, geometry)
          .then((String value) =>
              ref.read(onEventCreatedProvider.notifier).setValue(value))
          .onError((error, stackTrace) => ref
              .read(errorRenderProvider.notifier)
              .setValue(error.toString()));
    }
  }

  void _getSectionCompletion() {
    final Future<List<FieldUiModel>> fieldsFlowable =
        eventInitialRepository.list();
    // Future<Result<RuleEffect>> ruleEffectFlowable = eventInitialRepository.calculate()
    //         .subscribeOn(schedulerProvider.computation())
    //         .onErrorReturn(throwable -> Result.failure(new Exception(throwable)));

    // Future<List<FieldUiModel>> viewModelsFlowable = Future.wait([fieldsFlowable, ruleEffectFlowable,
    //         this.applyEffects]);

    final Future<List<FieldUiModel>> viewModelsFuture = fieldsFlowable;
    eventInitialRepository.eventSections().then(
        (List<FormSectionViewModel> sectionList) {
      sectionList.map((item) => null);
      return viewModelsFuture.then((List<FieldUiModel> fields) {
        return ref.read(fieldMapperProvider).map(fields, sectionList, '', {},
            {}, {}, const Pair<bool, bool>(false, false));
      });
    }).then((Pair<List<EventSectionModel>, List<FieldUiModel>> value) => ref
        .read(percentageUpdaterProvider.notifier)
        .setValue(ref.read(fieldMapperProvider).completedFieldsPercentage()));
  }

  void setChangingCoordinates(bool changingCoordinates) {
    if (changingCoordinates) {
      ref.read(preferencesProvider).setValue(EVENT_COORDINATE_CHANGED, true);
    } else {
      ref.read(preferencesProvider).removeValue(EVENT_COORDINATE_CHANGED);
    }
  }

  bool getCompletionPercentageVisibility() {
    return eventInitialRepository.showCompletionPercentage();
  }

  void onEventCreated() {
    // matomoAnalyticsController.trackEvent(EVENT_LIST, CREATE_EVENT, CLICK);
  }

  Future<bool> isEventEditable() async {
    return (await eventInitialRepository.getEditableStatus()) is Editable;
  }
}
