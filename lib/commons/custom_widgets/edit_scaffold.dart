// import 'package:flutter/material.dart';
// import 'package:mass_pro/main/l10n/app_localizations.dart';

// import '../../utils/mass_utils/icons.dart';
// import '../../utils/mass_utils/platforms.dart';
// import '../state/app_state.dart';
// import '../utils/view_actions.dart';
// import 'icon_text.dart';

// class EditScaffold extends StatelessWidget {
//   const EditScaffold({
//     Key? key,
//     required this.title,
//     required this.onSavePressed,
//     required this.body,
//     // this.entity,
//     this.onCancelPressed,
//     this.bottomNavigationBar,
//     this.floatingActionButton,
//     this.appBarBottom,
//     this.saveLabel,
//     this.isFullscreen = false,
//     this.onActionPressed,
//     required this.actions,
//   }) : super(key: key);

//   // final Identifiable? entity;
//   final String title;
//   final Function(BuildContext)? onSavePressed;
//   final Function(BuildContext)? onCancelPressed;
//   final Function(BuildContext, ViewAction?)? onActionPressed;
//   final List<ViewAction?>? actions;
//   final Widget? appBarBottom;
//   final Widget? floatingActionButton;
//   final Widget body;
//   final Widget? bottomNavigationBar;
//   final String? saveLabel;
//   final bool isFullscreen;

//   @override
//   Widget build(BuildContext context) {
//     // final AppBloc appBloc = context.watch<AppBloc>();
//     final AppState state = appBloc.state;

//     // final entityBloc = context.watch<B>();
//     // final entityState = entityBloc.state;

//     // final account = state.account;
//     final localization = AppLocalization.of(context)!.localized!;
//     final AppLocalization localizationLookup = AppLocalization.of(context)!;

//     // bool showUpgradeBanner = false;
//     bool isEnabled = (isMobile(context) ||
//                 !state.uiState.isInSettings ||
//                 state.uiState.isEditing //||
//             // TODO NMCP when adding settings
//             // state.settingsUIState.isChanged
//             ) &&
//             !entityState.isSaving /*&&
//         (entity?.isEditable ?? true)*/
//         ;
//     bool isCancelEnabled = false;

//     final entityActions = <ViewAction?>[
//       if (isDesktop(context) &&
//           ((isEnabled && onSavePressed != null) || isCancelEnabled))
//         ViewAction.cancel,
//       ViewAction.save,
//       ...(actions ?? []).where((action) => action != null),
//     ];

//     final List<PopupMenuEntry<ViewAction>> actionList = [];
//     if (actions != null && onActionPressed != null) {
//       actions!.forEach((action) {
//         if (action == null) {
//           actionList.add(const PopupMenuDivider());
//         } else {
//           actionList.add(PopupMenuItem<ViewAction>(
//             value: action,
//             child: Row(
//               children: <Widget>[
//                 Icon(
//                   getViewActionIcon(action),
//                   color: Theme.of(context).colorScheme.secondary,
//                 ),
//                 const SizedBox(width: 16.0),
//                 Text(AppLocalization.of(context)!.lookup(action.toString())),
//               ],
//             ),
//           ));
//         }
//       });
//     }

//     return WillPopScope(
//       onWillPop: () async {
//         return true;
//       },
//       child: FocusTraversalGroup(
//         child: Scaffold(
//           body: body,
//           // drawer: isDesktop(context) ? const MenuDrawerBuilder() : null,
//           appBar: AppBar(
//             centerTitle: false,
//             automaticallyImplyLeading: isMobile(context),
//             title: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Flexible(child: Text(title)),
//                 const SizedBox(width: 8),
//               ],
//             ),
//             actions: [
//               if (entityState.isSaving)
//                 const Padding(
//                   padding: EdgeInsets.only(right: 20),
//                   child: Center(
//                       child: SizedBox(
//                     width: 26,
//                     height: 26,
//                     child: CircularProgressIndicator(color: Colors.grey),
//                   )),
//                 )
//               else
//                 SaveCancelButtons(
//                   isEnabled: isEnabled && onSavePressed != null,
//                   isHeader: true,
//                   isCancelEnabled: isCancelEnabled,
//                   saveLabel: saveLabel,
//                   cancelLabel: localization.cancel,
//                   onSavePressed: (context) {
//                     // Clear focus now to prevent un-focus after save from
//                     // marking the form as changed and to hide the keyboard
//                     FocusScope.of(context).unfocus(
//                         disposition: UnfocusDisposition.previouslyFocusedChild);

//                     onSavePressed != null ? onSavePressed!(context) : null;
//                   },
//                   onCancelPressed: isMobile(context)
//                       ? null
//                       : (context) {
//                           if (onCancelPressed != null) {
//                             onCancelPressed!(context);
//                           } else {
//                             //TODO NMCP setting event
//                             // appBloc.dispatch(ResetSettings());
//                           }
//                         },
//                 ),
//               if (actions != null && onActionPressed != null)
//                 PopupMenuButton<ViewAction>(
//                   icon: const Icon(
//                     Icons.more_vert,
//                     //size: iconSize,
//                     //color: color,
//                   ),
//                   itemBuilder: (BuildContext context) => actionList,
//                   onSelected: (action) => onActionPressed != null
//                       ? onActionPressed!(context, action)
//                       : null,
//                   enabled: isEnabled,
//                 )
//             ],
//             bottom: isFullscreen && isDesktop(context)
//                 ? null
//                 : appBarBottom != null
//                     ? PreferredSize(
//                         preferredSize: const Size.fromHeight(100),
//                         child: appBarBottom!,
//                       )
//                     : null,
//           ),
//           bottomNavigationBar: bottomNavigationBar,
//           floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//           floatingActionButton: floatingActionButton,
//         ),
//       ),
//     );
//   }
// }
