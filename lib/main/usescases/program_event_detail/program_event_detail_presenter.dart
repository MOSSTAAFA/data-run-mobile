import 'package:d2_remote/core/common/feature_type.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'program_event_detail_contract.dart';
import 'program_event_detail_repository.dart';
import 'program_event_detail_repository_impl.dart';

part 'program_event_detail_presenter.g.dart';

@riverpod
ProgramEventDetailPresenter programEventDetailPresenter(
    ProgramEventDetailPresenterRef ref, ProgramEventDetailView view) {
  return ProgramEventDetailPresenterImpl(
      ref, view, ref.read(programEventDetailRepositoryProvider));
}

class ProgramEventDetailPresenterImpl implements ProgramEventDetailPresenter {
  ProgramEventDetailPresenterImpl(this.ref, this.view, this.eventRepository);

  final ProgramEventDetailPresenterRef ref;
  ProgramEventDetailView view;
  final ProgramEventDetailRepository eventRepository;

  // final SchedulerProvider schedulerProvider;
  // final FilterManager filterManager;
  // final FilterRepository filterRepository;
  //  ProgramEventDetailContract.View view;
  // CompositeDisposable compositeDisposable;
  //  FlowableProcessor<Unit> listDataProcessor;
  //  EventFilterToWorkingListItemMapper workingListMapper;
  //  DisableHomeFiltersFromSettingsApp disableHomFilters;
  //  MatomoAnalyticsController matomoAnalyticsController;

  @override
  void init() {
    eventRepository.hasAccessToAllCatOptions().then(view.setWritePermission);
    eventRepository.program().then(view.setProgram);
  }

  @override
  void onSyncIconClick(String uid) {
    // matomoAnalyticsController.trackEvent(EVENT_LIST, SYNC_EVENT, CLICK);
    view.showSyncDialog(uid);
  }

  @override
  void addEvent() {
    view.startNewEvent();
  }

  @override
  void onBackClick() {
    view.back();
  }

  @override
  void displayMessage(String message) {
    view.displayMessage(message);
  }

  @override
  void showFilter() {
    view.showHideFilter();
  }

  @override
  void clearFilterClick() {
    // filterManager.clearAllFilters();
  }

  @override
  void filterActivity(String selectedActivity) {
    // FilterManager.getInstance().addCatOptCombo(
    //         eventRepository.getActivity(selectedActivity)
    // );
  }

  @override
  Future<Program> getProgram() {
    return eventRepository.program();
  }

  @override
  Future<FeatureType> getFeatureType() {
    return eventRepository.featureType();
  }

  // @override
  //  List<WorkingListItem> workingLists() {
  //     return eventRepository.workingLists().toFlowable()
  //             .flatMapIterable(data -> data)
  //             .map(eventFilter -> workingListMapper.map(eventFilter))
  //             .toList().blockingGet();
  // }

  @override
  void clearOtherFiltersIfWebAppIsConfig() {
    // List<FilterItem> filters = filterRepository.homeFilters();
    // disableHomFilters.execute(filters);
  }

  @override
  void setOpeningFilterToNone() {
    // filterRepository.collapseAllFilters();
  }

  @override
  Future<String?> getStageUid() async {
    return (await eventRepository.programStage())?.id;
  }

  @override
  void setOrgUnitFilters(List<OrganisationUnit> selectedOrgUnits) {
    // FilterManager.getInstance().addOrgUnits(selectedOrgUnits);
  }

  @override
  void trackEventProgramAnalytics() {
    // matomoAnalyticsController.trackEvent(EVENT_LIST, OPEN_ANALYTICS, CLICK);
  }

  @override
  void trackEventProgramMap() {
    // matomoAnalyticsController.trackEvent(EVENT_LIST, MAP_VISUALIZATION, CLICK);
  }
}
