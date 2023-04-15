// ignore_for_file: avoid_dynamic_calls

import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/entities/enrollment.entity.dart';
import 'package:d2_remote/modules/data/tracker/entities/event.entity.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/event/event_status.dart';
import 'event_capture_contract.dart';

class EventCaptureRepositoryImpl implements EventCaptureRepository {
  EventCaptureRepositoryImpl(this.ref);
  final AutoDisposeRef ref;

  late final String _eventUid;

  Future<Event> _getCurrentEvent() async {
    return (await D2Remote.trackerModule.event.byId(_eventUid).getOne())!;
        // return await d2.eventModule().events().uid(eventUid).blockingGet();
    }

    @override
     Future<bool> isEnrollmentOpen() async {
        final Event currentEvent = await _getCurrentEvent();
        return currentEvent.enrollment() == null || d2.enrollmentModule().enrollmentService().blockingIsOpen(currentEvent.enrollment());
    }

    @override
     Future<bool> isEnrollmentCancelled() {
        final Enrollment enrollment = d2.enrollmentModule().enrollments().uid(getCurrentEvent().enrollment()).blockingGet();
        if (enrollment == null)
            return false;
        else
            return enrollment.status() == EnrollmentStatus.CANCELLED;
    }

    @override
     Future<bool> isEventEditable(String eventUid) {
        return d2.eventModule().eventService().blockingIsEditable(eventUid);
    }

    @override
     Future<String> programStageName() {
        return d2.programModule().programStages().uid(getCurrentEvent().programStage()).get()
                .map(BaseIdentifiableObject::displayName)
                .toFlowable();
    }

    @override
     Future<String> eventDate() {
        final Event currentEvent = getCurrentEvent();
        return Future.just(
                currentEvent.eventDate() != null ? DateUtils.uiDateFormat().format(currentEvent.eventDate()) : ""
        );
    }

    @override
     Future<OrganisationUnit> orgUnit() {
        return Future.just(d2.organisationUnitModule().organisationUnits().uid(getCurrentEvent().organisationUnit()).blockingGet());
    }


    @override
     Future<String> catOption() {
        return Future.just(d2.categoryModule().categoryOptionCombos().uid(getCurrentEvent().attributeOptionCombo()))
                .map(categoryOptionComboRepo -> {
                    if (categoryOptionComboRepo.blockingGet() == null)
                        return "";
                    else
                        return categoryOptionComboRepo.blockingGet().displayName();
                })
                .map(displayName -> displayName.equals("default") ? "" : displayName);
    }

    @override
     Future<bool> completeEvent() {
        return Future.fromCallable(() -> {
            try {
                d2.eventModule().events().uid(eventUid).setStatus(EventStatus.COMPLETED);
                return true;
            } catch (D2Error d2Error) {
                d2Error.printStackTrace();
                return false;
            }
        });
    }

    @override
     Future<bool> deleteEvent() {
        return d2.eventModule().events().uid(eventUid).delete()
                .andThen(Future.just(true));
    }

    @override
     Future<bool> updateEventStatus(EventStatus status) {

        return Future.fromCallable(() -> {
            d2.eventModule().events().uid(eventUid)
                    .setStatus(status);
            return true;
        });
    }

    @override
     Future<bool> rescheduleEvent(Date newDate) {
        return Future.fromCallable(() -> {
            d2.eventModule().events().uid(eventUid)
                    .setDueDate(newDate);
            d2.eventModule().events().uid(eventUid)
                    .setStatus(EventStatus.SCHEDULE);
            return true;
        });
    }

    @override
     Future<String> programStage() {
        return Future.just(Objects.requireNonNull(getCurrentEvent().programStage()));
    }

    @override
     bool getAccessDataWrite() {
        return d2.eventModule().eventService().blockingHasDataWriteAccess(eventUid);
    }

    @override
     Future<EventStatus> eventStatus() {
        return Future.just(Objects.requireNonNull(getCurrentEvent().status()));
    }

    @override
     Future<bool> canReOpenEvent() {
        return Future.fromCallable(() -> d2.userModule().authorities()
                .byName().in(AuthoritiesKt.AUTH_UNCOMPLETE_EVENT, AuthoritiesKt.AUTH_ALL).one().blockingExists()
        );
    }

    @override
     Future<bool> isCompletedEventExpired(String eventUid) {
        return d2.eventModule().eventService().getEditableStatus(eventUid).map(editionStatus -> {
            if (editionStatus instanceof EventEditableStatus.NonEditable) {
                return ((EventEditableStatus.NonEditable) editionStatus).getReason() == EventNonEditableReason.EXPIRED;
            } else {
                return false;
            }
        }).toObservable();
    }

    @override
     Future<bool> eventIntegrityCheck() {
        final Event currentEvent = getCurrentEvent();
        return Future.just(currentEvent).map(event ->
                (event.status() == EventStatus.COMPLETED ||
                        event.status() == EventStatus.ACTIVE) &&
                        event.eventDate() != null && !event.eventDate().after(new Date())
        );
    }

    @override
     Future<int> getNoteCount() {
        return d2.noteModule().notes().byEventUid().eq(eventUid).count();
    }

    @override
     Future<bool> showCompletionPercentage() {
        if (d2.settingModule().appearanceSettings().blockingExists()) {
            ProgramConfigurationSetting programConfigurationSetting = d2.settingModule()
                    .appearanceSettings()
                    .getProgramConfigurationByUid(getCurrentEvent().program());

            if (programConfigurationSetting != null &&
                    programConfigurationSetting.completionSpinner() != null) {
                return programConfigurationSetting.completionSpinner();
            }
        }
        return true;
    }

    @override
     Future<bool> hasAnalytics() {
        final Event currentEvent = getCurrentEvent();
        final bool hasProgramIndicators = !d2.programModule().programIndicators().byProgramUid().eq(currentEvent.program()).blockingIsEmpty();
        List<ProgramRule> programRules = d2.programModule().programRules().withProgramRuleActions()
                .byProgramUid().eq(currentEvent.program()).blockingGet();
        bool hasProgramRules = false;
        for (ProgramRule rule : programRules) {
            for (ProgramRuleAction action : Objects.requireNonNull(rule.programRuleActions())) {
                if (action.programRuleActionType() == ProgramRuleActionType.DISPLAYKEYVALUEPAIR ||
                        action.programRuleActionType() == ProgramRuleActionType.DISPLAYTEXT) {
                    hasProgramRules = true;
                }
            }
        }
        return hasProgramIndicators || hasProgramRules;
    }

    @override
     Future<bool> hasRelationships() {
        return !d2.relationshipModule().relationshipTypes()
                .byAvailableForEvent(eventUid)
                .blockingIsEmpty();
    }
    
      @override
      Future<String> activity() {
    // TODO: implement activity
    throw UnimplementedError();
      }
}
