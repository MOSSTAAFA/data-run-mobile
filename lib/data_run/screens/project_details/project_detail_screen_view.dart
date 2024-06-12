import 'package:d2_remote/modules/metadatarun/project/entities/d_project.entity.dart';
import 'package:mass_pro/data_run/screens/general/view_base.dart';

mixin ProjectDetailScreenView implements ViewBase {
  void renderUsername(String username);

  void navigateToActivity(String activityId);

  void onLockClick();

  void goToHome();

  void showGranularSync();

  bool hasToNotSync();

  void setProject(DProject project);
}
