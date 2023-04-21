// import 'package:flutter/material.dart';

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
//     return CustomTabView(
//       initPosition: initPosition,
//       itemCount: data.length,
//       tabBuilder: (context, index) => Tab(text: data[index]),
//       pageBuilder: (context, index) => Center(child: Text(data[index])),
//       onPositionChange: (index) {
//         print('current position: $index');
//         initPosition = index;
//       },
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             data.add('Page ${data.length}');
//           });
//         },
//         child: const Icon(Icons.add),
//       ),
//       // onScroll: (position) => print('$position'),
//     );
//   }
// }

// class CustomTabView extends StatefulWidget {
//   const CustomTabView(
//       {super.key,
//       required this.itemCount,
//       required this.tabBuilder,
//       required this.pageBuilder,
//       this.stub,
//       this.onPositionChange,
//       this.onScroll,
//       this.initPosition,
//       this.floatingActionButton,
//       this.isBottom = false});

//   final int itemCount;
//   final IndexedWidgetBuilder tabBuilder;
//   final IndexedWidgetBuilder pageBuilder;
//   final Widget? stub;
//   final ValueChanged<int>? onPositionChange;
//   final ValueChanged<double>? onScroll;
//   final int? initPosition;
//   final bool isBottom;
//   final FloatingActionButton? floatingActionButton;

//   @override
//   CustomTabsState createState() => CustomTabsState();
// }

// class CustomTabsState extends State<CustomTabView>
//     with TickerProviderStateMixin {
//   late TabController controller;
//   late int _currentCount;
//   late int _currentPosition;

//   @override
//   void initState() {
//     _currentPosition = widget.initPosition ?? 0;
//     controller = TabController(
//       length: widget.itemCount,
//       vsync: this,
//       initialIndex: _currentPosition,
//     );
//     controller.addListener(onPositionChange);
//     controller.animation!.addListener(onScroll);
//     _currentCount = widget.itemCount;
//     super.initState();
//   }

//   @override
//   void didUpdateWidget(CustomTabView oldWidget) {
//     if (_currentCount != widget.itemCount) {
//       controller.animation!.removeListener(onScroll);
//       controller.removeListener(onPositionChange);
//       controller.dispose();

//       if (widget.initPosition != null) {
//         _currentPosition = widget.initPosition!;
//       }

//       if (_currentPosition > widget.itemCount - 1) {
//         _currentPosition = widget.itemCount - 1;
//         _currentPosition = _currentPosition < 0 ? 0 : _currentPosition;
//         if (widget.onPositionChange is ValueChanged<int>) {
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             if (mounted && widget.onPositionChange != null) {
//               widget.onPositionChange!(_currentPosition);
//             }
//           });
//         }
//       }

//       _currentCount = widget.itemCount;
//       setState(() {
//         controller = TabController(
//           length: widget.itemCount,
//           vsync: this,
//           initialIndex: _currentPosition,
//         );
//         controller.addListener(onPositionChange);
//         controller.animation!.addListener(onScroll);
//       });
//     } else if (widget.initPosition != null) {
//       controller.animateTo(widget.initPosition!);
//     }

//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   void dispose() {
//     controller.animation!.removeListener(onScroll);
//     controller.removeListener(onPositionChange);
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (widget.itemCount < 1) return widget.stub ?? Container();
//     List<Widget> children = <Widget>[
//       Expanded(
//         child: TabBarView(
//           controller: controller,
//           children: List.generate(
//             widget.itemCount,
//             (index) => widget.pageBuilder(context, index),
//           ),
//         ),
//       ),
//       Container(
//         alignment: Alignment.center,
//         child: TabBar(
//           isScrollable: true,
//           controller: controller,
//           labelColor: Theme.of(context).primaryColor,
//           unselectedLabelColor: Theme.of(context).hintColor,
//           indicator: BoxDecoration(
//             border: Border(
//               bottom: BorderSide(
//                 color: Theme.of(context).primaryColor,
//                 width: 2,
//               ),
//             ),
//           ),
//           tabs: List.generate(
//             widget.itemCount,
//             (index) => widget.tabBuilder(context, index),
//           ),
//         ),
//       ),
//     ];

//     return WillPopScope(
//         onWillPop: () async {
//           // ref.read(appStateNotifierProvider.notifier).viewDashboard();
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
//               // leading: leading,
//               // leadingWidth: kMinInteractiveDimension *
//               //     (appBarLeadingActions.length +
//               //         (onCheckboxPressed == null || isMobile(context) ? 1 : 2)),
//               // title: Row(
//               //   children: [
//               //     Expanded(child: appBarTitle),
//               //   ],
//               // ),
//               // actions: [
//               //   ...appBarActions ?? <Widget>[],
//               // ],
//             ),
//             body: ClipRect(
//               child: TabBarView(
//                 controller: controller,
//                 children: List.generate(
//                   widget.itemCount,
//                   (index) => widget.pageBuilder(context, index),
//                 ),
//               ),
//             ),
//             bottomNavigationBar: TabBar(
//               isScrollable: true,
//               controller: controller,
//               labelColor: Theme.of(context).primaryColor,
//               unselectedLabelColor: Theme.of(context).hintColor,
//               indicator: BoxDecoration(
//                 border: Border(
//                   bottom: BorderSide(
//                     color: Theme.of(context).primaryColor,
//                     width: 2,
//                   ),
//                 ),
//               ),
//               tabs: List.generate(
//                 widget.itemCount,
//                 (index) => widget.tabBuilder(context, index),
//               ),
//             ),
//             floatingActionButton: widget.floatingActionButton,
//             floatingActionButtonLocation:
//                 FloatingActionButtonLocation.endDocked,
//           ),
//         ));
//   }

//   void onPositionChange() {
//     if (!controller.indexIsChanging) {
//       _currentPosition = controller.index;
//       if (widget.onPositionChange is ValueChanged<int>) {
//         widget.onPositionChange!(_currentPosition);
//       }
//     }
//   }

//   void onScroll() {
//     if (widget.onScroll is ValueChanged<double>) {
//       widget.onScroll!(controller.animation!.value);
//     }
//   }
// }
