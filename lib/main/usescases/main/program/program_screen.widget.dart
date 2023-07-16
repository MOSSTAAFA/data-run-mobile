import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../../commons/extensions/dynamic_extensions.dart';
import '../../../../commons/extensions/standard_extensions.dart';
import '../../../../commons/state/app_state_notifier.dart';
import '../../../../core/program/program_type.dart';
import '../../bundle/bundle.dart';
import '../../general/view_base.dart';
import '../../program_event_detail/program_event_detail_screen.widget.dart';
import 'di/program_providers.dart';
import 'program.view.dart';
import 'program_list/program_list.widget.dart';
import 'program_presenter.dart';
import 'program_view.model.dart';

/// ProgramFragment
class ProgramViewScreen extends ConsumerStatefulWidget {
  const ProgramViewScreen({super.key});

  @override
  ConsumerState<ProgramViewScreen> createState() => _ProgramViewScreenState();
}

class _ProgramViewScreenState extends ConsumerState<ProgramViewScreen>
    with ProgramView, ViewBase {
  Bundle bundle = Bundle();
  late final KeepAliveLink bundleKeepAliveLink;
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
    // bundle = ref.read(bundleObjectProvider.notifier).ref;
    // bundleKeepAliveLink = ref.read(bundleObjectProvider.notifier).ref.keepAlive();
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
        Get.snackbar('', '${program.programType} not Implemented yet1',
            snackPosition: SnackPosition.BOTTOM,
            barBlur: 16,
            backgroundColor: Colors.orangeAccent.withOpacity(0.3));
        // Intent(activity, SearchTEActivity::class.java).apply {
        //     putExtras(bundle)
        //     getActivityContent.launch(this)
        // }
      },
      ProgramType.WITHOUT_REGISTRATION.name: () {
        // ref
        //     .read(bundleObjectProvider.notifier)
        //     .putString(EXTRA_PROGRAM_UID, program.uid);
        bundle = bundle.putString(EXTRA_PROGRAM_UID, program.uid);
        logInfo(info: 'EXTRA_PROGRAM_UID, ${program.uid}');
        // navigatorKey.currentState!.pushNamed(ProgramEventDetailScreen.route);
        ref
            .read(appStateNotifierProvider.notifier)
            .navigateToRoute(ProgramEventDetailScreen.route, arguments: bundle);
        // Intent(activity, ProgramEventDetailActivity::class.java).apply {
        //     putExtras(ProgramEventDetailActivity.getBundle(program.uid))
        //     getActivityContent.launch(this)
        // }
      }
    }) /*.orElse(() {
      Get.snackbar('', '${program.programType} not Implemented yet');
      // Intent(activity, DataSetDetailActivity::class.java).apply {
      //               putExtras(bundle)
      //               getActivityContent.launch(this)
      //           }
    })*/
        ;
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
