// import 'package:flutter/material.dart';
// import 'package:mass_pro/temp_testing/reactive_forms/flutter_form_example.dart';
// import 'package:mass_pro/temp_testing/reactive_forms/reactive_form.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ReactiveHome(),
//     );
//   }
// }
//
// class ReactiveHome extends StatelessWidget {
//   const ReactiveHome({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Repeatable Section Example')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//               key: const Key('flutter_example'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute<void>(
//                     builder: (_) => const FlutterFormExample(),
//                   ),
//                 );
//               },
//               child: const Text('Flutter Form example'),
//             ),
//             ElevatedButton(
//               key: const Key('reactive_example'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute<void>(
//                     builder: (_) => const ReactiveFormExample(),
//                   ),
//                 );
//               },
//               child: const Text('Reactive Form example'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }