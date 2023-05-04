import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../commons/extensions/standard_extensions.dart';
import '../../../../commons/state/app_state_notifier.dart';
import '../../../../core/program/program_type.dart';
import '../../program_event_detail/program_event_detail_screen.widget.dart';
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
    when(program.programType, {
      ProgramType.WITH_REGISTRATION.name: () {
        // Intent(activity, SearchTEActivity::class.java).apply {
        //     putExtras(bundle)
        //     getActivityContent.launch(this)
        // }
      },
      ProgramType.WITHOUT_REGISTRATION.name: () {
        ref
            .read(appStateNotifierProvider.notifier)
            .navigateToScreen(const ProgramEventDetailScreen());
        // Intent(activity, ProgramEventDetailActivity::class.java).apply {
        //     putExtras(ProgramEventDetailActivity.getBundle(program.uid))
        //     getActivityContent.launch(this)
        // }
      }
    }).orElse(() {
      // Intent(activity, DataSetDetailActivity::class.java).apply {
      //               putExtras(bundle)
      //               getActivityContent.launch(this)
      //           }
    });
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
