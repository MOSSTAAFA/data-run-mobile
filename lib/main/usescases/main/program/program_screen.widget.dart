import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'di/program_providers.dart';
import 'program_list/program_list.widget.dart';
import 'program_presenter.dart';
import 'program.view.dart';
import 'program_view.model.dart';

/// ProgramFragment
class ProgramViewScreen extends ConsumerStatefulWidget {
  const ProgramViewScreen({super.key});

  @override
  ConsumerState<ProgramViewScreen> createState() => _ProgramViewScreenState();
}

class _ProgramViewScreenState extends ConsumerState<ProgramViewScreen>
    with ProgramView {
  late final ProgramPresenter presenter;
  @override
  Widget build(BuildContext context) {
    return ProgramList(
      onItemClick: (programViewModel) =>
          presenter.onItemClick(programViewModel!),
      onGranularSyncClick: (programViewModel) =>
          presenter.onSyncStatusClick(programViewModel!),
      onDescriptionClick: (programViewModel) =>
          presenter.showDescription(programViewModel?.description),
    );
  }

  @override
  void initState() {
    presenter = ref.read(programPresenterProvider(this));
    super.initState();
  }

  @override
  void clearFilters() {
    // TODO: implement clearFilters
  }

  @override
  void navigateTo(ProgramViewModel program) {
    // TODO: implement navigateTo
  }

  @override
  void openOrgUnitTreeSelector() {
    // TODO: implement openOrgUnitTreeSelector
  }

  @override
  void showFilterProgress() {
    // TODO: implement showFilterProgress
  }

  @override
  void showHideFilter() {
    // TODO: implement showHideFilter
  }

  @override
  void swapProgramModelData(IList<ProgramViewModel> programs) {
    // TODO: implement swapProgramModelData
  }

  @override
  Future<void> showSyncDialog<ProgramViewModel>(
      [ProgramViewModel? program]) async {}
}
