import 'package:d2_remote/modules/data/tracker/queries/event.query.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../commons/resources/resource_manager.dart';
import '../../../../mp_logic/mp_program_utils.dart';
import '../program.view.dart';
import '../program_presenter.dart';
import '../program_repository.dart';
import '../program_repository_impl.dart';

part 'program_providers.g.dart';

@Riverpod(keepAlive: true)
ProgramPresenter programPresenter(ProgramPresenterRef ref, ProgramView view) {
  return ProgramPresenter(ref, view, ref.read(programRepositoryProvider));
}

@Riverpod(keepAlive: true)
ProgramRepository programRepository(ProgramRepositoryRef ref) {
  return ProgramRepositoryImpl(
      ref,
      ref.read(mpProgramUtilsProvider(EventQuery())),
      ref.read(resourceManagerProvider));
}
