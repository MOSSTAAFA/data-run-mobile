// import 'package:d2_remote/shared/entities/identifiable.entity.dart';
// import 'package:flutter/material.dart';
// import '../../main/l10n/app_localizations.dart';

// import '../../main/utils/event_mode.dart';
// import '../../utils/mass_utils/platforms.dart';
// import '../utils/presenter.dart';
// import '../utils/view_actions.dart';
// import 'actions_menu_button.dart';
// import 'copy_to_clipboard.dart';

// class ViewScaffold extends StatelessWidget {
//   const ViewScaffold({
//     super.key,
//     required this.body,
//     required this.entity,
//     this.floatingActionButton,
//     this.appBarBottom,
//     this.isFilter = false,
//     this.onBackPressed,
//     this.eventMode,
//   });

//   final bool isFilter;
//   final IdentifiableEntity entity;
//   final EventMode? eventMode;
//   final List<ViewAction> viewActions;
//   final Widget body;
//   final Function? onBackPressed;
//   final Widget? floatingActionButton;
//   final Widget? appBarBottom;

//   @override
//   Widget build(BuildContext context) {
//     final localization = AppLocalization.of(context)!.localized!;
//     // final AppBloc appBloc = context.watch<AppBloc>();
//     // final AppState appState = appBloc.state;
//     // final D2User user = appState.user;
//     // final bool isSettings = entity.entityType.isSetting;

//     String title;
//     if (eventMode == EventMode.NEW) {
//       title = '';
//     } else {
//       final presenter = EntityPresenter().initialize(entity, context);
//       title = presenter.title(isNarrow: isMobile(context)) ?? '';
//     }

//     Widget? leading;

//     return WillPopScope(
//       onWillPop: () async {
//         return true;
//       },
//       child: FocusTraversalGroup(
//         child: Scaffold(
//           backgroundColor: Theme.of(context).cardColor,
//           appBar: AppBar(
//             centerTitle: false,
//             leading: leading,
//             automaticallyImplyLeading: isMobile(context),
//             title: CopyToClipboard(
//               value: title,
//               child: Text(title),
//             ),
//             // NMCP
//             // bottom: appBarBottom,
//             bottom: appBarBottom != null
//                 ? PreferredSize(
//                     preferredSize: const Size.fromHeight(100),
//                     child: appBarBottom!,
//                   )
//                 : null,
//             actions: eventMode == EventMode.NEW
//                 ? []
//                 : [
//                     if (user.canEditEntity(entity))
//                       Builder(builder: (context) {
//                         final isDisabled = appState.uiState.isEditing &&
//                             appState.uiState.mainRoute ==
//                                 appState.uiState.filterEntityType.toString();

//                         return AppTextButton(
//                           label: localization.edit,
//                           isInHeader: true,
//                           onPressed: isDisabled
//                               ? null
//                               : () {
//                                   editEntity(entity: entity);
//                                 },
//                         );
//                       }),
//                     ViewActionMenuButton(
//                       isSaving: appState.isSaving && !isFilter,
//                       entity: entity,
//                       onSelected: (context, action) {
//                         handleEntityAction(entity, action, autoPop: true);
//                       },
//                       entityActions: entity.getActions(user: user),
//                     ),
//                   ],
//           ),
//           body: SafeArea(
//             child: eventMode == EventMode.NEW
//                 ? BlankScreen(localization.noRecordSelected)
//                 : body,
//           ),
//         ),
//       ),
//     );
//   }
// }
