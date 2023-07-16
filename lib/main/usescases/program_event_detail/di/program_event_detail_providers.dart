// part 'program_event_detail_providers.g.dart';

// @riverpod
// class ProgramUid extends _$ProgramUid {
//   @override
//   String build() {
//     return '';
//   }

//   void setValue(String value) {
//     state = value;
//   }
// }

// @riverpod
// ProgramEventMapper programEventMapper(ProgramEventMapperRef ref) {
//   return ProgramEventMapper(ref);
// }

// /// ProgramEventDetailPresenter
// @riverpod
// ProgramEventDetailRepository programEventDetailRepository(
//     ProgramEventDetailRepositoryRef ref) {
//   //ProgramUid
//   return ProgramEventDetailRepositoryImpl(
//       ref.read(bundleObjectProvider).getString(EXTRA_PROGRAM_UID)!,
//       ref,
//       ref.read(programEventMapperProvider));
// }

// @riverpod
// ProgramEventDetailPresenter programEventDetailPresenter(
//     ProgramEventDetailPresenterRef ref, ProgramEventDetailView view) {
//   return ProgramEventDetailPresenterImpl(
//       ref, view, ref.read(programEventDetailRepositoryProvider));
// }

// @riverpod
// NavigationPageConfigurator pageConfigurator(PageConfiguratorRef ref) {
//   throw UnimplementedError();
// }
