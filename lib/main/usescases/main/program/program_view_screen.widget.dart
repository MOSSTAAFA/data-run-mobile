import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/main/usescases/main/program/program_view.dart';

import 'program_view_model.dart';

/// ProgramFragment
class ProgramViewScreen extends StatefulWidget {
  const ProgramViewScreen({super.key});

  @override
  State<ProgramViewScreen> createState() => _ProgramViewScreenState();
}

class _ProgramViewScreenState extends State<ProgramViewScreen>
    with ProgramView {
  @override
  Widget build(BuildContext context) {
    return Container();
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
