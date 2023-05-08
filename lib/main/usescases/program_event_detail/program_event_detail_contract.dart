import 'package:d2_remote/core/common/feature_type.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';

import '../general/presenter.dart';
import '../general/view_base.dart';

mixin ProgramEventDetailView implements ViewBase {
  void setProgram(Program programModel);

  void renderError(String message);

  void showHideFilter();

  void setWritePermission(bool aBoolean);

  void showFilterProgress();

  void updateFilters(int totalFilters);

  void openOrgUnitTreeSelector();

  // void showPeriodRequest(FilterManager.PeriodRequest periodRequest);

  void startNewEvent();

  void navigateToEvent(String eventId, String orgUnit);

  @override
  Future<void> showSyncDialog<String>([String? uid]);

  void showCatOptComboDialog(String catComboUid);

  // void setFilterItems(List<FilterItem> programFilters);

  void hideFilters();
}

abstract class ProgramEventDetailPresenter extends Presenter {
  void init();

  void addEvent();

  void onBackClick();

  void showFilter();

  void onSyncIconClick(String uid);

  void clearFilterClick();

  void filterActivity(String selectedActivity);

  Future<Program> getProgram();

  Future<FeatureType> getFeatureType();

  // List<WorkingListItem> workingLists();

  void clearOtherFiltersIfWebAppIsConfig();

  void setOpeningFilterToNone();

  Future<String?> getStageUid();

  void setOrgUnitFilters(List<OrganisationUnit> selectedOrgUnits);

  void trackEventProgramAnalytics();

  void trackEventProgramMap();
}
