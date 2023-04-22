import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../main/l10n/app_localizations.dart';
import '../../../main/usescases/program_event_detail/di/program_event_detail_providers.dart';
import '../../../utils/mass_utils/platforms.dart';
import '../../extensions/standard_extensions.dart';
import '../../state/app_state.dart';
import '../../state/app_state_notifier.dart';
import '../../state/pref_state.dart';
import '../../utils/view_actions.dart';
import 'navigation_page.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Flutter Demo',
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   MyHomePageState createState() => MyHomePageState();
// }

// class MyHomePageState extends State<MyHomePage> {
//   List<String> data = ['Page 0', 'Page 1', 'Page 2'];
//   int initPosition = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: CustomTabBarView(
//           initPosition: initPosition,
//           itemCount: data.length,
//           tabBuilder: (context, index) => Tab(text: data[index]),
//           pageBuilder: (context, index) => Center(child: Text(data[index])),
//           onPositionChange: (index) {
//             print('current position: $index');
//             initPosition = index;
//           },
//           onScroll: (position) => print('$position'),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             data.add('Page ${data.length}');
//           });
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

typedef ViewActionWidgetBuilder = Widget Function(
    BuildContext context, ViewAction viewAction);

typedef FloatingActionButtonBuilder = FloatingActionButton? Function(
    BuildContext context, ViewAction viewAction);

class NavigationTabBarView extends ConsumerStatefulWidget {
  const NavigationTabBarView(
      {super.key,
      // required this.navigationPageConfigurator,
      required this.tabBuilder,
      required this.pageBuilder,
      // this.onPressedActionButton,
      this.stub,
      this.onPositionChange,
      this.onScroll,
      this.initPosition = 0,
      this.isBottom = false,
      // this.floatingActionButton,
      this.actionButtonBuilder,
      // this.actionButtonVisiblity,
      this.appBarActions,
      this.appBarLeadingActions,
      this.onHamburgerLongPress,
      this.appBarTitle});

  // final NavigationPageConfigurator navigationPageConfigurator;
  // final IndexedWidgetBuilder tabBuilder;
  // final IndexedWidgetBuilder pageBuilder;
  // final NavigationItemBuilder tabBuilder;
  final ViewActionWidgetBuilder tabBuilder;
  final ViewActionWidgetBuilder pageBuilder;
  // final void Function(ViewAction viewAction)? onPressedActionButton;
  final Widget? stub;
  final ValueChanged<ViewAction>? onPositionChange;
  final ValueChanged<double>? onScroll;
  final int initPosition;
  final bool isBottom;
  // final FloatingActionButton? floatingActionButton;
  final FloatingActionButtonBuilder? actionButtonBuilder;
  // final bool Function(ViewAction viewAction)? actionButtonVisiblity;
  final List<Widget>? appBarActions;
  final List<Widget>? appBarLeadingActions;
  final Function()? onHamburgerLongPress;
  final Widget? appBarTitle;

  @override
  NavigationTabBarViewState createState() => NavigationTabBarViewState();
}

class NavigationTabBarViewState extends ConsumerState<NavigationTabBarView>
    with TickerProviderStateMixin {
  late TabController controller;
  late int _currentCount;
  late int _currentPosition;
  late List<NavigationPage> _visibleTabs;
  late bool _isActionButtonVisible;
  late ViewAction _currentAction;

  @override
  void initState() {
    _visibleTabs = getVisibleTabs();

    _currentPosition = widget.initPosition;
    _currentAction = _visibleTabs[_currentPosition].viewAction;
    _isActionButtonVisible = ref
        .read(pageConfiguratorProvider)
        .actionButtonVisibility(_currentAction);

    controller = TabController(
      length: _visibleTabs.length,
      vsync: this,
      initialIndex: _currentPosition,
    );
    controller.addListener(onPositionChange);
    controller.animation!.addListener(onScroll);
    _currentCount = _visibleTabs.length;
    super.initState();
  }

  @override
  void didUpdateWidget(NavigationTabBarView oldWidget) {
    if (_currentCount != _visibleTabs.length) {
      controller.animation!.removeListener(onScroll);
      controller.removeListener(onPositionChange);
      controller.dispose();
      _currentPosition = widget.initPosition;

      if (_currentPosition > _visibleTabs.length - 1) {
        _currentPosition = _visibleTabs.length - 1;
        _currentPosition = _currentPosition < 0 ? 0 : _currentPosition;
        if (widget.onPositionChange is ValueChanged<ViewAction>) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted && widget.onPositionChange != null) {
              widget
                  .onPositionChange!(_visibleTabs[_currentPosition].viewAction);
            }
          });
        }
      }

      _currentCount = _visibleTabs.length;
      setState(() {
        controller = TabController(
          length: _visibleTabs.length,
          vsync: this,
          initialIndex: _currentPosition,
        );
        controller.addListener(onPositionChange);
        controller.animation!.addListener(onScroll);
        _isActionButtonVisible = ref
            .read(pageConfiguratorProvider)
            .actionButtonVisibility(_visibleTabs[_currentPosition].viewAction);
        _currentAction = _visibleTabs[_currentPosition].viewAction;
      });
    } else {
      controller.animateTo(widget.initPosition);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.animation!.removeListener(onScroll);
    controller.removeListener(onPositionChange);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_visibleTabs.isEmpty) {
      return widget.stub ?? const SizedBox();
    }

    final localization = AppLocalization.of(context)!.localized!;
    // final prefState = context.select((AppBloc bloc) => bloc.state.prefState);
    final PrefState prefState =
        ref.watch(appStateNotifierProvider.select((value) => value.prefState));

    final AppState appState = ref.read(appStateNotifierProvider);

    Widget? leading;
    // if (isMobile(context)) {
    //   leading = Builder(
    //     builder: (context) => InkWell(
    //       onLongPress: widget.onHamburgerLongPress,
    //       child: IconButton(
    //         tooltip: localization.menuSidebar,
    //         icon: const Icon(Icons.menu),
    //         onPressed: () {
    //           Scaffold.of(context).openDrawer();
    //         },
    //       ),
    //     ),
    //   );
    // }

    // leading = Row(
    //   children: [
    //     Expanded(child: leading),
    //     ...?widget.appBarLeadingActions,
    //   ],
    // );

    return WillPopScope(
        onWillPop: () async {
          ref.read(appStateNotifierProvider.notifier).viewDashboard();
          return false;
        },
        child: FocusTraversalGroup(
          child: Scaffold(
            // TODO(NMC): implement MenuDrawerBuilder
            // drawer: isMobile(context) ? const MenuDrawerBuilder() : null,
            appBar: AppBar(
              centerTitle: false,
              automaticallyImplyLeading: false,
              leading: leading,
              leadingWidth: kMinInteractiveDimension *
                  (widget.appBarLeadingActions?.length ??
                      0 + (isMobile(context) ? 1 : 2)),
              title: widget.appBarTitle?.let((it) => Row(
                    children: [
                      Expanded(child: it),
                    ],
                  )),
              actions: [
                ...widget.appBarActions ?? <Widget>[],
              ],
            ),
            body: ClipRect(
              child: TabBarView(
                controller: controller,
                children: List.generate(
                  _visibleTabs.length,
                  (index) => widget.pageBuilder(
                      context, _visibleTabs[index].viewAction),
                ),
              ),
            ),
            bottomNavigationBar: TabBar(
              isScrollable: true,
              controller: controller,
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Theme.of(context).hintColor,
              indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
              ),
              tabs: List.generate(
                _visibleTabs.length,
                (index) =>
                    widget.tabBuilder(context, _visibleTabs[index].viewAction),
              ),
            ),
            floatingActionButton: _isActionButtonVisible
                ? widget.actionButtonBuilder?.call(context, _currentAction)
                // FloatingActionButton(
                //     child: const Icon(Icons.add),
                //     onPressed: () =>
                //         widget.onPressedActionButton?.call(_currentAction),
                //   )
                : null,
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          ),
        ));
  }

  void onPositionChange() {
    if (!controller.indexIsChanging) {
      _currentPosition = controller.index;
      if (widget.onPositionChange is ValueChanged<ViewAction>) {
        widget.onPositionChange!(_visibleTabs[_currentPosition].viewAction);
      }
    }
  }

  void onScroll() {
    if (widget.onScroll is ValueChanged<double>) {
      widget.onScroll!(controller.animation!.value);
    }
  }

  List<NavigationPage> getVisibleTabs() {
    final List<NavigationPage> visibleMenuItems = <NavigationPage>[];
    for (final menuItme in ViewAction.values) {
      if (ref.read(pageConfiguratorProvider).pageVisibility(menuItme)) {
        NavigationPage.getMenu(menuItme)?.let((it) => visibleMenuItems.add(it));
      }
    }
    return visibleMenuItems;
  }
}
