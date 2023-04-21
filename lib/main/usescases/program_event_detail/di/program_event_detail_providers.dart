import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../commons/custom_widgets/navigationbar/navigation_page_configurator.dart';
import '../program_event_detail_contract.dart';
import '../program_event_detail_presenter.dart';
import '../program_event_detail_repository.dart';
import '../program_event_detail_repository_impl.dart';
import '../program_event_mapper.dart';

part 'program_event_detail_providers.g.dart';

@riverpod
class ProgramUid extends _$ProgramUid {
  @override
  String build() {
    return '';
  }

  void setValue(String value) {
    state = value;
  }
}

@riverpod
ProgramEventMapper programEventMapper(ProgramEventMapperRef ref) {
  return ProgramEventMapper(ref);
}

/// ProgramEventDetailPresenter
@riverpod
ProgramEventDetailRepository programEventDetailRepository(
    ProgramEventDetailRepositoryRef ref) {
  //ProgramUid
  return ProgramEventDetailRepositoryImpl(
      ref.read(programUidProvider), ref, ref.read(programEventMapperProvider));
}

@riverpod
ProgramEventDetailPresenter programEventDetailPresenter(
    ProgramEventDetailPresenterRef ref, ProgramEventDetailView view) {
  return ProgramEventDetailPresenterImpl(ref, view);
}

@riverpod
NavigationPageConfigurator pageConfigurator(PageConfiguratorRef ref) {
  throw UnimplementedError();
}
