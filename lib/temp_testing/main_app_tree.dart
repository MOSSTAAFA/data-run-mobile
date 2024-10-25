// import 'package:flutter/material.dart';
// import 'package:mass_pro/tree_examples/nodes_data_update_sample.dart';
// import 'package:mass_pro/tree_examples/pre_populated_indexed_trees_sample.dart';
// import 'package:mass_pro/tree_examples/treeview_custom_object_sample.dart';
// import 'package:mass_pro/tree_examples/treeview_indexed_modification_sample.dart';
// import 'package:mass_pro/tree_examples/treeview_modification_sample.dart';
// import 'package:mass_pro/utils/navigator_key.dart';
// import '../tree_examples/tree1.dart';
// import '../tree_examples/tree2.dart';
//
// class MyNewApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Navigation Test',
//       initialRoute: '/',
//       routes: {
//         // '/': (context) => MyAppBody(),
//         '/2': (context) => Tree2(title: 'tree2'),
//         '/3': (context) => NodeDataUpdate(
//               title: 'NodeDataUpdate',
//             ),
//         '/4': (context) =>
//             PrePopulatedIndexedTree(title: 'PrePopulatedIndexedTree'),
//         '/5': (context) => TreeViewCustomObject(title: 'TreeViewCustomObject'),
//         '/6': (context) =>
//             TreeViewIndexedModification(title: 'TreeViewIndexedModification'),
//         '/7': (context) => TreeViewModification(title: 'TreeViewModification'),
//         '/9': (context) => TreeViwPage1(title: 'TreeViewModification'),
//         // '/10': (context) => OrgUnitTreeViewPicker()
//       },
//       home: MyAppBody(),
//     );
//   }
// }
//
// class MyAppBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('title'),
//         ),
//         body: Column(
//           children: [
//             OutlinedButton(
//                 child: Text('1'),
//                 onPressed: () async => await navigate(context, '/')),
//             OutlinedButton(
//                 child: Text('2'),
//                 onPressed: () async => await navigate(context, '/2')),
//             OutlinedButton(
//                 child: Text('3'),
//                 onPressed: () async => await navigate(context, '/3')),
//             OutlinedButton(
//                 child: Text('4'),
//                 onPressed: () async => await navigate(context, '/5')),
//             OutlinedButton(
//                 child: Text('6'),
//                 onPressed: () async => await navigate(context, '/6')),
//             OutlinedButton(
//                 child: Text('7'),
//                 onPressed: () async => await navigate(context, '/7')),
//             OutlinedButton(
//                 child: Text('8'),
//                 onPressed: () async => await navigate(context, '/9')),
//             OutlinedButton(
//                 child: Text('1-0'),
//                 onPressed: () async => await navigate(context, '/10')),
//           ],
//         ));
//   }
// }
//
// Future<void> navigate(BuildContext? context, String route,
//         {bool isDialog = false,
//         bool isRootNavigator = true,
//         Map<String, dynamic>? arguments}) =>
//     Navigator.of(context ?? navigatorKey.currentContext!,
//             rootNavigator: isRootNavigator)
//         .pushNamed(route, arguments: arguments);
