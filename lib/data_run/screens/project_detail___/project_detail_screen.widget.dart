// import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
// import 'package:d2_remote/modules/metadatarun/project/entities/d_project.entity.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get/get.dart';
// import 'package:mass_pro/data_run/screens/dashboard/dashboard_screen.widget.dart';
// import 'package:mass_pro/data_run/screens/project_details_detail/project_detail.view.dart';
// import 'package:mass_pro/data_run/screens/project_details_detail/project_detail_page_configurator.dart';
// import 'package:mass_pro/data_run/screens/project_details_detail/project_detail_presenter.dart';
// import 'package:mass_pro/main/l10n/app_localizations.dart';
// import 'package:mass_pro/main/usescases/bundle/bundle.dart';
//
// import '../../../commons/constants.dart';
// import '../../../commons/custom_widgets/navigationbar/navigation_page_configurator.dart';
// import '../../../commons/custom_widgets/navigationbar/navigation_tab_bar_view.widget.dart';
// import '../../../commons/data/event_creation_type.dart';
// import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
// import '../../../commons/helpers/collections.dart';
// import '../../../commons/state/app_state_notifier.dart';
// import '../../../commons/data_run/utils/view_actions.dart';
// import '../../../form/model/form_repository_records.dart';
// import '../../../form/ui/components/linear_loading_indicator.dart';
// import '../../../riverpod/use_on_init_hook.dart';
// import '../../l10n/app_localizations.dart';
// import '../../utils/event_mode.dart';
// import '../bundle/bundle.dart';
// import '../events_without_registration/event_capture/event_capture_screen.widget.dart';
// import '../events_without_registration/event_initial/event_initial_screen.widget.dart';
// import '../general/view_base.dart';
// import 'event_list/event_list_screen.widget.dart';
// import 'event_map/event_map.widget.dart';
// import 'event_table/event_table.widget.dart';
// import 'program_event_detail_contract.dart';
// import 'program_event_detail_presenter.dart';
// import 'program_event_detail_view_model.dart';
// import 'program_event_page_configurator.dart';
//
// final GlobalKey<NavigatorState> programNavigatorKey = GlobalKey<NavigatorState>();
// /// ProgramEventDetailActivity
// /// the screen that list the events of a particular program, navigated to from
// /// Program list in the main page
// ///
// /// ProgramStage selection screen has no layout and calls individual items layout for each program stage using
// /// [ProgramStageSelectionAdapter] in [ProgramStageSelectionActivity]
// const String EXTRA_ACTIVITY_UID = 'ACTIVITY_UID';
//
// class ProjectDetailScreen extends ConsumerStatefulWidget {
//   const ProjectDetailScreen({super.key});
//
//   static const String route = '/ProgramEventDetailScreen';
//
//   @override
//   ConsumerState<ProjectDetailScreen> createState() =>
//       _ProjectDetailScreenState();
// }
//
// class _ProjectDetailScreenState
//     extends ConsumerState<ProjectDetailScreen>
//     with ProjectDetailView, ViewBase {
//   late final ProjectDetailPresenter presenter;
//   late final String projectUid;
//   late final String? activityUid;
//   final NavigationPageConfigurator _pageConfigurator =
//       ProjectDetailPageConfigurator();
//
//   @override
//   Widget build(BuildContext context) {
//     final localization = AppLocalization.of(context)!;
//
//     return Column(
//       children: [
//         // Consumer(
//         //   // This builder will only get called when the
//         //   // programEventDetailModelProvider.progress is updated.
//         //   builder: (context, ref, child) => LinearLoadingIndicator(
//         //     isLoading: ref.watch(programEventDetailModelProvider
//         //         .select((value) => value.progress)),
//         //   ),
//         // ),
//         Expanded(
//           child: NavigationTabBarView(
//             pageConfigurator: _pageConfigurator,
//             appBarTitle: Text(ref.watch(programNameProvider)),
//             tabBuilder: (context, viewAction) {
//               final name = localization.lookup(viewAction.name);
//               return when(viewAction, {
//                 ViewAction.list_view: () => Tab(text: name),
//                 ViewAction.table_view: () => Tab(text: name),
//                 ViewAction.map_view: () => Tab(text: name),
//                 ViewAction.analytics: () => Tab(text: name),
//               })!;
//             },
//             pageBuilder: (context, viewAction) =>
//                 when<ViewAction, Widget>(viewAction, {
//               ViewAction.list_view: () => const EventListScreen(),
//               ViewAction.table_view: () => const EventTable(),
//               ViewAction.map_view: () => const EventMap(),
//             }).orElse(() => const Center(
//                       child: Text('Unimplemented Screen!'),
//                     )),
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     presenter = ref.read(programEventDetailPresenterProvider(this));
//     presenter.init();
//     projectUid = (Get.arguments as Bundle).getString(EXTRA_PROJECT_UID)!;
//     _setObservers();
//   }
//
//   // @override
//   // void didChangeDependencies() {
//   //   presenter.init();
//   //   super.didChangeDependencies();
//   // }
//
//   void _setObservers() {
//     ref.listenManual<String?>(
//         programEventDetailModelProvider
//             .select((value) => value.eventSyncClicked),
//         (previous, next) =>
//             next?.let((eventUid) => presenter.onSyncIconClick(eventUid)));
//
//     ref.listenManual<Pair<String, String>?>(
//         programEventDetailModelProvider.select((value) => value.eventClicked),
//         (previous, next) => next?.let((eventData) {
//               navigateToEvent(eventData.first, eventData.second);
//             }));
//   }
//
//   @override
//   void navigateToActivity(String eventId) {
//     ref.read(programEventDetailModelProvider.notifier).setUpdateEvent(eventId);
//     // programEventsViewModel.setUpdateEvent(eventId);
//
//     Bundle bundle = Bundle();
//     // Bundle bundle = ref.read(bundleObjectProvider);
//
//     bundle = bundle.putString(PROGRAM_UID, projectUid);
//
//     bundle = bundle.putString(EVENT_UID, eventId);
//     bundle = bundle.putString(ORG_UNIT, orgUnit);
//     // NMC
//     bundle = bundle.putString(EVENT_MODE, EventMode.CHECK.name);
//     bundle = bundle.putString(ACTIVITY_UID, activityUid);
//
//     bundle = bundle.putObject(RECORDS, EventRecords(eventId));
//
//     // set to the  Bundle activityUid
//     // ref.read(bundleObjectProvider.notifier).setValue(bundle);
//
//     // ref
//     //     .read(appStateNotifierProvider.notifier)
//     //     .navigateToScreen(const EventCaptureScreen(), bundle: bundle);
//     ref
//         .read(appStateNotifierProvider.notifier)
//         .navigateToRoute(EventCaptureScreen.route, arguments: bundle);
//   }
//
//   @override
//   void renderError(String message) {
//     // TODO: implement renderError
//   }
//
//   @override
//   void setProject(DProject project) {
//     useOnInit(() => ref
//         .read(programNameProvider.notifier)
//         .update((state) => project.displayName ?? project.name ?? ''));
//     // Future(() => ref
//     //     .read(programNameProvider.notifier)
//     //     .update((state) => program.displayName ?? program.name ?? ''));
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }
// }
//
// final programNameProvider = StateProvider.autoDispose<String>((ref) => '');
