import 'package:d2_remote/modules/data/tracker/models/geometry.dart';
import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_stage.entity.dart';
import 'package:flutter/material.dart';

import '../../../../commons/extensions/string_extension.dart';
import '../../../../commons/helpers/collections.dart';
import '../../../../commons/prefs/preference.dart';
import '../../../../core/event/event_editable_status.dart';
import '../../../../form/data/form_section_view_model.dart';
import '../../../../form/model/field_ui_model.dart';
import '../../../../main.dart';
import '../../../l10n/app_localizations.dart';
import '../event_capture/event_section_model.dart';
import 'di/event_initial_module.dart';
import 'event_initial_repository.dart';
import 'event_initial_view.dart';

class EventInitialPresenter {
  EventInitialPresenter(this.ref, this.view, this.eventInitialRepository);

  final EventInitialPresenterRef ref;

  // final PreferenceProvider preferences;
  //  final AnalyticsHelper analyticsHelper;

  final EventInitialRepository eventInitialRepository;

  //  final RulesUtilsProvider ruleUtils;
  final EventInitialView view;

  //  final SchedulerProvider schedulerProvider;
  // final EventFieldMapper eventFieldMapper;

  String? eventId;

  Program? program;

  String? programStageId;

  // late final Bundle eventBundle;

  Future<void> init(String? programId, String? eventId, String? orgInitId,
      String? programStageId) async {
    // eventBundle = ref.read(bundleObjectProvider);

    this.eventId = eventId;
    this.programStageId = programStageId;

    // view.setAccessDataWrite(
    //             eventInitialRepository.accessDataWrite(programId).blockingFirst()
    //     );
    if (eventId != null) {
      final program = await eventInitialRepository.getProgramWithId(programId);
      final programStage =
          await eventInitialRepository.programStageForEvent(eventId);
      this.program = program;
      view.setProgram(program);
    } else {
      eventInitialRepository
          .getProgramWithId(programId)
          .then((Program? program) {
        this.program = program;
        view.setProgram(program);
      });

      _getProgramStages(programId, programStageId);
    }

    if (eventId != null) {
      _getSectionCompletion();
    }
  }

  String getCurrentOrgUnit(String orgUnitUid) {
    if (ref.read(preferencesInstanceProvider).contains([CURRENT_ORG_UNIT])) {
      return ref.read(preferencesInstanceProvider).getString(CURRENT_ORG_UNIT)!;
    } else {
      return orgUnitUid;
    }
  }

  void onShareClick() {
    // view.showQR();
  }

  void deleteEvent(String trackedEntityInstance) {
    final BuildContext context = navigatorKey.currentContext!;
    if (eventId != null) {
      eventInitialRepository.deleteEvent(eventId!, trackedEntityInstance);
      view.showEventWasDeleted();
    } else {
      view.displayMessage(AppLocalization.of(context)!.lookup('delete_event_error'));
    }
  }

  Future<bool> isEnrollmentOpen() {
    return eventInitialRepository.isEnrollmentOpen();
  }

  void getProgramStage(String programStageUid) {
    eventInitialRepository
        .programStageWithId(programStageUid)
        .then((programStage) => view.setProgramStage(programStage))
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
      String? programUid, String? programStageUid) async {
    Future<ProgramStage?> programStage;
    if (programStageId.isNullOrEmpty && programUid != null) {
      programStage = eventInitialRepository.programStage(programUid);
    } else {
      programStage = eventInitialRepository.programStageWithId(programStageUid);
    }
    programStage
        .then(
            (ProgramStage? programStage) => view.setProgramStage(programStage))
        .onError((error, stackTrace) {
      // view.showProgramStageSelection();
    });
  }

  void onBackClick() {
    view.back();
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
    if (program != null) {
      ref
          .read(preferencesInstanceProvider)
          .setValue(CURRENT_ORG_UNIT, orgUnitUid);
      eventInitialRepository
          .createEvent(enrollmentUid, trackedEntityInstance, program!.id!,
              programStageModel, date, orgUnitUid, activityUid, geometry)
          .then((String value) => view.onEventCreated(
              value) /*ref.read(onEventCreatedProvider.notifier).setValue(value)*/)
          .onError((error, stackTrace) => view.renderError(error
                  .toString()) /*ref
              .read(errorRenderProvider.notifier)
              .setValue(error.toString())*/
              );
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
    if (program != null) {
      ref
          .read(preferencesInstanceProvider)
          .setValue(CURRENT_ORG_UNIT, orgUnitUid);
      eventInitialRepository
          .permanentReferral(
              enrollmentUid,
              trackedEntityInstanceUid,
              program!.id!,
              programStageModel,
              dueDate,
              orgUnitUid,
              activityUid,
              geometry)
          .then((String value) => view.onEventCreated(
              value) /*ref.read(onEventCreatedProvider.notifier).setValue(value)*/)
          .onError((error, stackTrace) => view.renderError(error
                  .toString()) /*ref
              .read(errorRenderProvider.notifier)
              .setValue(error.toString())*/
              );
    }
  }

  void scheduleEvent(
      String enrollmentUid,
      String programStageModel,
      DateTime dueDate,
      String orgUnitUid,
      String activityUid,
      Geometry geometry) {
    if (program != null) {
      ref
          .read(preferencesInstanceProvider)
          .setValue(CURRENT_ORG_UNIT, orgUnitUid);
      eventInitialRepository
          .scheduleEvent(enrollmentUid, null, program!.id!, programStageModel,
              dueDate, orgUnitUid, activityUid, geometry)
          .then((String value) => view.onEventCreated(
              value) /*ref.read(onEventCreatedProvider.notifier).setValue(value)*/)
          .onError((error, stackTrace) => view.renderError(error
                  .toString()) /*ref
              .read(errorRenderProvider.notifier)
              .setValue(error.toString())*/
              );
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
    }).then((Pair<List<EventSectionModel>, List<FieldUiModel>> value) =>
            view.updatePercentage(ref
                .read(fieldMapperProvider)
                .completedFieldsPercentage()) /*ref
        .read(percentageUpdaterProvider.notifier)
        .setValue(ref.read(fieldMapperProvider).completedFieldsPercentage())*/
        );
  }

  void setChangingCoordinates(bool changingCoordinates) {
    if (changingCoordinates) {
      ref
          .read(preferencesInstanceProvider)
          .setValue(EVENT_COORDINATE_CHANGED, true);
    } else {
      ref
          .read(preferencesInstanceProvider)
          .removeValue(EVENT_COORDINATE_CHANGED);
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
