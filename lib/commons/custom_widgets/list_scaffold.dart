// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../main/l10n/app_localizations.dart';
// import '../../utils/mass_utils/platforms.dart';
// import '../state/app_state.dart';
// import '../state/app_state_notifier.dart';
// import '../state/pref_state.dart';

// class ListScaffold extends ConsumerWidget {
//   const ListScaffold({
//     super.key,
//     required this.appBarTitle,
//     required this.body,
//     this.onCheckboxPressed,
//     this.appBarActions,
//     this.appBarLeadingActions = const [],
//     this.bottomNavigationBar,
//     this.floatingActionButton,
//     this.onHamburgerLongPress,
//     this.onCancelSettingsSection,
//     this.onCancelSettingsIndex = 0,
//   });

//   final Widget body;
//   // final AppBottomBar? bottomNavigationBar;
//   final Widget? bottomNavigationBar;
//   final FloatingActionButton? floatingActionButton;
//   final Widget appBarTitle;
//   final List<Widget>? appBarActions;
//   final List<Widget> appBarLeadingActions;
//   final Function()? onHamburgerLongPress;
//   final String? onCancelSettingsSection;
//   final int onCancelSettingsIndex;
//   final Function? onCheckboxPressed;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final localization = AppLocalization.of(context)!.localized!;
//     // final prefState = context.select((AppBloc bloc) => bloc.state.prefState);
//     final PrefState prefState =
//         ref.watch(appStateNotifierProvider.select((value) => value.prefState));

//     final AppState appState = ref.read(appStateNotifierProvider);

//     Widget leading = const SizedBox();
//     if (isMobile(context)) {
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
//     }

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
//           ref.read(appStateNotifierProvider.notifier).viewDashboard();
//           return false;
//         },
//         child: FocusTraversalGroup(
//           child: Scaffold(
//             // drawer: isMobile(context) ? const MenuDrawerBuilder() : null,
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
//                 ],
//               ),
//               actions: [
//                 ...appBarActions ?? <Widget>[],
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
