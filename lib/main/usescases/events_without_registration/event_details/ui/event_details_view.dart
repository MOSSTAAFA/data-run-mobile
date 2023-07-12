import '../../../general/view_base.dart';

mixin EventDetailsView implements ViewBase {
  void showDateDialog();
  void showOrgUnitDialog();
  void showNoOrgUnitsDialog();
  void showPeriods();
  void requestLocationPermissions();
  void showEnableLocationMessage();
  void requestLocationByMap(String featureType, String? initCoordinate);
  void onButtonClickCallback();
  void showEventUpdateStatus(String result);
  void onReopenError(String message);
  void onReopenSuccess(String message);
}
