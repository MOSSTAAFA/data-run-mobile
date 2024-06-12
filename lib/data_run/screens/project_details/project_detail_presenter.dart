import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/auth/user/entities/d_user.entity.dart';
import 'package:get/get.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_screen_view.dart';
import 'package:mass_pro/data_run/utils/screens_constants.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_detail_presenter.g.dart';

@Riverpod(keepAlive: true)
ProjectDetailPresenter projectDetailPresenter(
    ProjectDetailPresenterRef ref, ProjectDetailScreenView view) {
  return ProjectDetailPresenter(view);
}

class ProjectDetailPresenter {
  ProjectDetailPresenter(this.view);

  final ProjectDetailScreenView view;

  Future<void> init() async {
    final projectUid = (Get.arguments as Bundle).getString(EXTRA_PROJECT_UID)!;
    final project =
        await D2Remote.projectModuleD.project.byId(projectUid).getOne();
    view.setProject(project!);
  }

  Future<String> getUserUid() async {
    try {
      return (await D2Remote.userModule.user.getOne())!.uid!;
    } catch (e) {
      return '';
    }
  }

  void onSyncAllClick() {
    view.showGranularSync();
  }

  // void blockSession() {
  //   workManagerController.cancelAllWork();
  //   view.back();
  // }

  String _username(DUser user) {
    return '${user.firstName} ${user.surname ?? ''}';
  }

  void onNavigateBackToHome() {
    view.goToHome();
  }
}
