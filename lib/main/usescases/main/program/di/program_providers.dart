import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../form/di/injector.dart';
import '../../../../mp_logic/mp_program_utils.dart';
import '../program_presenter.dart';
import '../program_repository.dart';
import '../program_repository_impl.dart';
import '../program_view.dart';

part 'program_providers.g.dart';

@Riverpod(keepAlive: true)
ProgramPresenter programPresenter(ProgramPresenterRef ref, ProgramView view) {
  return ProgramPresenter(ref, view, ref.read(programRepositoryProvider));
}

@Riverpod(keepAlive: true)
ProgramRepository programRepository(ProgramRepositoryRef ref) {
  return ProgramRepositoryImpl(
      ref.read(mpProgramUtilsProvider), ref.read(resourceManagerProvider));
}
