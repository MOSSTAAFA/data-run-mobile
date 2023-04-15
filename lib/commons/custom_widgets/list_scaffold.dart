// import 'package:flutter/material.dart';
// import '../../main/l10n/app_localizations.dart';
// import '../../utils/mass_utils/platforms.dart';
// import '../state/app_state.dart';
// import '../state/pref_state.dart';

// class ListScaffold extends StatelessWidget {
//   const ListScaffold({
//     super.key,
//     required this.appBarTitle,
//     required this.body,
//     required this.entityType,
//     this.onCheckboxPressed,
//     this.appBarActions,
//     this.appBarLeadingActions = const [],
//     this.bottomNavigationBar,
//     this.floatingActionButton,
//     this.onHamburgerLongPress,
//     this.onCancelSettingsSection,
//     this.onCancelSettingsIndex = 0,
//   });

//   final EntityType? entityType;
//   final Widget body;
//   final AppBottomBar? bottomNavigationBar;
//   final FloatingActionButton? floatingActionButton;
//   final Widget appBarTitle;
//   final List<Widget>? appBarActions;
//   final List<Widget> appBarLeadingActions;
//   final Function()? onHamburgerLongPress;
//   final String? onCancelSettingsSection;
//   final int onCancelSettingsIndex;
//   final Function? onCheckboxPressed;

//   @override
//   Widget build(BuildContext context) {
//     final localization = AppLocalization.of(context)!.localized!;
//     // final prefState = context.select((AppBloc bloc) => bloc.state.prefState);
//     final PrefState prefState =
//         BlocProvider.of<AppBloc>(context).state.prefState;
//     final AppState appState = context.read<AppBloc>().state;

//     Widget leading = const SizedBox();
//     if (isMobile(context) || prefState.isMenuFloated) {
//       leading = Builder(
//         builder: (context) => InkWell(
//           onLongPress: onHamburgerLongPress,
//           child: IconButton(
//             tooltip: localization.menuSidebar,
//             icon: const Icon(Icons.menu),
//             onPressed: () {
//               Scaffold.of(context).openDrawer();
//             },
//           ),
//         ),
//       );
//     } else if (entityType != null && entityType != EntityType.settings) {
//       leading = IconButton(
//         icon: const Icon(Icons.add),
//         tooltip: prefState.enableTooltips ? localization.createNew : null,
//         onPressed: () {
//           createEntityByType(entityType: entityType, context: context);
//         },
//       );
//     }
//     // leading = IconButton(
//     //   icon: const Icon(Icons.add),
//     //   // tooltip: prefState.enableTooltips ? localization.createNew : null,
//     //   onPressed: () {
//     //     // createEntityByType(entityType: entityType, context: context);
//     //   },
//     // );

//     leading = Row(
//       children: [
//         Expanded(child: leading),
//         if (isDesktop(context) && onCheckboxPressed != null)
//           Expanded(
//               child: IconButton(
//             icon: const Icon(Icons.check_box),
//             tooltip: prefState.enableTooltips ? localization.multiselect : null,
//             onPressed: () => onCheckboxPressed!(),
//           )),
//         ...appBarLeadingActions,
//       ],
//     );

//     return WillPopScope(
//         onWillPop: () async {
//           context.read<AppBloc>().add(const ViewDashboard());
//           return false;
//         },
//         child: FocusTraversalGroup(
//           child: Scaffold(
//             drawer: isMobile(context) || prefState.isMenuFloated
//                 ? const MenuDrawerBuilder()
//                 : null,
//             // endDrawer: isMobile(context) ||
//             //         (state.prefState.isHistoryFloated && !isSettings)
//             //     ? HistoryDrawerBuilder()
//             //     : null,
//             appBar: AppBar(
//               centerTitle: false,
//               automaticallyImplyLeading: false,
//               leading: leading,
//               leadingWidth: kMinInteractiveDimension *
//                   (appBarLeadingActions.length +
//                       (onCheckboxPressed == null || isMobile(context) ? 1 : 2)),
//               title: Row(
//                 children: [
//                   Expanded(child: appBarTitle),
//                   if (isDesktop(context) && onCancelSettingsSection != null)
//                     TextButton(
//                         onPressed: () {
//                           context.read<AppBloc>().add(ViewSettings(
//                                 user: user,
//                                 section: onCancelSettingsSection,
//                                 tabIndex: onCancelSettingsIndex,
//                               ));
//                         },
//                         child: Text(
//                           localization.back,
//                           style: TextStyle(color: appState.headerTextColor),
//                         )),
//                 ],
//               ),
//               actions: [
//                 ...appBarActions ?? <Widget>[],
//                 // if (!isSettings &&
//                 //     (isMobile(context) || !state.prefState.isHistoryVisible))
//                 //   Builder(builder: (context) {
//                 //     return InkWell(
//                 //       onTap: () {
//                 //         if (isMobile(context) ||
//                 //             state.prefState.isHistoryFloated) {
//                 //           Scaffold.of(context).openEndDrawer();
//                 //         } else {
//                 //           store.dispatch(UpdateUserPreferences(
//                 //               sidebar: AppSidebar.history));
//                 //         }
//                 //       },
//                 //       child: Padding(
//                 //         padding: const EdgeInsets.symmetric(horizontal: 12),
//                 //         child: Icon(
//                 //           Icons.history,
//                 //           color: state.headerTextColor,
//                 //         ),
//                 //       ),
//                 //     );
//                 //   })
//                 /*
//                   Builder(
//                     builder: (context) => IconButton(
//                       padding: const EdgeInsets.only(left: 4, right: 20),
//                       tooltip: prefState.enableTooltips
//                           ? localization.history
//                           : null,
//                       icon: Icon(Icons.history),
//                       onPressed: () {
//                         if (isMobile(context) ||
//                             state.prefState.isHistoryFloated) {
//                           Scaffold.of(context).openEndDrawer();
//                         } else {
//                           store.dispatch(UpdateUserPreferences(
//                               sidebar: AppSidebar.history));
//                         }
//                       },
//                     ),
//                   ),
//                   */
//               ],
//             ),
//             body: ClipRect(
//               child: body,
//             ),
//             bottomNavigationBar: bottomNavigationBar,
//             floatingActionButton: floatingActionButton,
//             floatingActionButtonLocation:
//                 FloatingActionButtonLocation.endDocked,
//           ),
//         ));
//   }
// }
