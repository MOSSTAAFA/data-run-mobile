import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../main/l10n/app_localizations.dart';
import '../../../utils/mass_utils/platforms.dart';
import '../../extensions/standard_extensions.dart';
import '../../state/app_state.dart';
import '../../state/app_state_notifier.dart';
import '../../state/pref_state.dart';
import '../../utils/view_actions.dart';
import 'navigation_page.dart';
import 'navigation_page_configurator.dart';

typedef ViewActionWidgetBuilder = Widget Function(
    BuildContext context, ViewAction viewAction);

typedef FloatingActionButtonBuilder = FloatingActionButton? Function(
    BuildContext context, ViewAction viewAction);

class NavigationTabBarView extends ConsumerStatefulWidget {
  const NavigationTabBarView(
      {super.key,
      required this.pageConfigurator,
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
      this.appBarTitle,
      this.drawer});

  // final IndexedWidgetBuilder tabBuilder;
  // final IndexedWidgetBuilder pageBuilder;
  // final NavigationItemBuilder tabBuilder;
  final NavigationPageConfigurator pageConfigurator;
  final ViewActionWidgetBuilder? tabBuilder;
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
  final Widget? drawer;

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
  Widget build(BuildContext context) {
    if (_visibleTabs.isEmpty) {
      return widget.stub ?? const SizedBox();
    }

    final localization = AppLocalization.of(context)!.localized!;
    // final prefState = context.select((AppBloc bloc) => bloc.state.prefState);
    final PrefState prefState =
        ref.watch(appStateNotifierProvider.select((value) => value.prefState));

    final AppState appState = ref.read(appStateNotifierProvider);

    Widget? leadingActions;
    Widget? drawerHamburger;
    if (widget.drawer != null) {
      drawerHamburger = Builder(
        builder: (context) => InkWell(
          onLongPress: widget.onHamburgerLongPress,
          child: IconButton(
            tooltip: localization.menuSidebar,
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      );
    }

    if (widget.appBarLeadingActions != null) {
      leadingActions = Row(
        children: [
          if (drawerHamburger != null) Expanded(child: drawerHamburger),
          ...?widget.appBarLeadingActions,
        ],
      );
    }

    return WillPopScope(
        onWillPop: () async {
          // ref.read(appStateNotifierProvider.notifier).viewDashboard();
          return true;
        },
        child: FocusTraversalGroup(
          child: Scaffold(
            drawer: widget.drawer,
            appBar: AppBar(
              centerTitle: false,
              automaticallyImplyLeading: false,
              leading:
                  leadingActions /*??
                  IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.arrow_back),
                    iconSize: 20.0,
                    onPressed: () {
                      ref
                          .read(appStateNotifierProvider.notifier)
                          .navigateBack();
                    },
                  )*/
              ,
              leadingWidth: kMinInteractiveDimension *
                  (widget.appBarLeadingActions?.length ??
                      0 + (isMobile(context) ? 1 : 2)),
              title: widget.appBarTitle?.let((it) => Row(
                    children: [
                      Expanded(child: it),
                    ],
                  )),
              actions: widget.appBarActions,
            ),
            body: _visibleTabs.length > 1
                ? ClipRect(
                    child: TabBarView(
                      controller: controller,
                      children: List.generate(
                        _visibleTabs.length,
                        (index) => widget.pageBuilder(
                            context, _visibleTabs[index].viewAction),
                      ),
                    ),
                  )
                : widget.pageBuilder(context, _visibleTabs.first.viewAction),
            bottomNavigationBar:
                widget.tabBuilder != null && _visibleTabs.length > 1
                    ? TabBar(
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
                          (index) => widget.tabBuilder!
                              .call(context, _visibleTabs[index].viewAction),
                        ),
                      )
                    : null,
            floatingActionButton: _isActionButtonVisible
                ? widget.actionButtonBuilder?.call(context, _currentAction)
                : null,
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          ),
        ));
  }

  /// LifeCycle methods
  @override
  void initState() {
    _visibleTabs = getVisibleTabs();

    _currentPosition = widget.initPosition;
    _currentAction = _visibleTabs[_currentPosition].viewAction;
    _isActionButtonVisible = widget.pageConfigurator
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
        _isActionButtonVisible = widget.pageConfigurator
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

  /// Custom Widget methods
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
      if (widget.pageConfigurator.pageVisibility(menuItme)) {
        NavigationPage.getMenu(menuItme)?.let((it) => visibleMenuItems.add(it));
      }
    }
    return visibleMenuItems;
  }
}
