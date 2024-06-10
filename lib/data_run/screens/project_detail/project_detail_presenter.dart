// import 'package:d2_remote/core/common/feature_type.dart';
// import 'package:d2_remote/modules/metadatarun/project/entities/d_project.entity.dart';
// import 'package:mass_pro/data_run/screens/project_detail/project_detail.view.dart';
// import 'package:mass_pro/data_run/screens/project_detail/project_detail_repository.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// part 'project_detail_presenter.g.dart';
//
// @riverpod
// ProjectDetailPresenter projectDetailPresenter(
//     ProjectDetailPresenterRef ref, ProjectDetailView view) {
//   return ProjectDetailPresenter(
//       ref, view, ref.read(projectDetailRepositoryProvider));
// }
//
// class ProjectDetailPresenter {
//   ProjectDetailPresenter(this.ref, this.view, this.projectDetailRepository);
//
//   final ProjectDetailPresenterRef ref;
//   final ProjectDetailView view;
//   final ProjectDetailRepository projectDetailRepository;
//
//   void init() {
//     // projectDetailRepository.hasAccessToAllCatOptions().then(view.setWritePermission);
//     projectDetailRepository.project().then(view.setProject);
//   }
//
//   void onNavigateBackToHome() {
//     view.goToHome();
//   }
//
//   void onSyncIconClick(String uid) {
//     // matomoAnalyticsController.trackEvent(EVENT_LIST, SYNC_EVENT, CLICK);
//     view.showSyncDialog(uid);
//   }
//
//   void displayMessage(String message) {
//     view.displayMessage(message);
//   }
//
//   Future<DProject> getProject() {
//     return projectDetailRepository.project();
//   }
//
//   Future<FeatureType> getProjectType() {
//     return projectDetailRepository.featureType();
//   }
// }
