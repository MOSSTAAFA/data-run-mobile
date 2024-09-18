// import 'package:flutter/material.dart';
//
// // class QFieldModel {
// //   QFieldModel({
// //     required this.name,
// //     required this.type,
// //     required this.path,
// //     this.mandatory = false,
// //     this.section,
// //     this.rules = const [],
// //     this.defaultValue,
// //   });
// //
// //   String name;
// //   String type;
// //   bool mandatory;
// //   String path;
// //   String? section;
// //   List<dynamic> rules;
// //   dynamic defaultValue;
// // }
// //
// // class QSectionFieldModel extends QFieldModel {
// //   QSectionFieldModel(
// //       {required String name,
// //       required String path,
// //       required this.fields,
// //       this.isOpen = false})
// //       : super(name: name, type: 'Section', path: path);
// //   List<QFieldModel> fields;
// //   bool isOpen;
// // }
// //
// // class QRepeatableSectionFieldModel extends QSectionFieldModel {
// //   QRepeatableSectionFieldModel({
// //     required String name,
// //     required String path,
// //     bool isOpen = false,
// //     required List<QFieldModel> fields,
// //   }) : super(name: name, path: path, fields: fields, isOpen: isOpen);
// //   List<List<QFieldModel>> instances = [];
// //
// //   void addInstance() {
// //     // Clone the structure of the original fields to create a new instance
// //     var newInstance = fields.map((field) {
// //       return QFieldModel(
// //         name: field.name,
// //         type: field.type,
// //         path: '$path.${instances.length}.${field.name}',
// //         section: field.section,
// //         mandatory: field.mandatory,
// //         rules: field.rules,
// //         defaultValue: field.defaultValue,
// //       );
// //     }).toList();
// //
// //     instances.add(newInstance);
// //   }
// // }
//
// class QRepeatableSectionWidget extends StatefulWidget {
//   QRepeatableSectionWidget({required this.model});
//
//   final QRepeatableSectionFieldModel model;
//
//   @override
//   _QRepeatableSectionWidgetState createState() =>
//       _QRepeatableSectionWidgetState();
// }
//
// class _QRepeatableSectionWidgetState extends State<QRepeatableSectionWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           ExpansionPanelList(
//             expansionCallback: (int index, bool isExpanded) {
//               setState(() {
//                 widget.model.isOpen = isExpanded;
//               });
//             },
//             children: [
//               for (int i = 0; i < widget.model.instances.length; i++)
//                 buildInstance(widget.model.instances[i], i,
//                     isOpen: widget.model.isOpen),
//             ],
//           ),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 widget.model.addInstance();
//               });
//             },
//             child: Text('Add Stock Item'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   ExpansionPanel buildInstance(List<QFieldModel> instance, int index,
//       {required bool isOpen}) {
//     return ExpansionPanel(
//       isExpanded: isOpen,
//       headerBuilder: (BuildContext context, bool isExpanded) {
//         return ListTile(
//           title: Text('stockItems[0]' ?? ''),
//         );
//       },
//       // margin: EdgeInsets.symmetric(vertical: 10),
//       body: Padding(
//         padding: EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: instance.map((field) => buildFieldWidget(field)).toList(),
//         ),
//       ),
//     );
//   }
//
//   Widget buildFieldWidget(QFieldModel field) {
//     if (field.type == 'SelectOne') {
//       return DropdownButtonFormField(
//         decoration: InputDecoration(labelText: field.name),
//         items: [
//           DropdownMenuItem(value: 'ACT60MG', child: Text('ACT60MG')),
//           DropdownMenuItem(value: 'PMQ7.5MG', child: Text('PMQ7.5MG')),
//         ],
//         onChanged: (value) {
//           // Handle value change
//         },
//       );
//     } else if (field.type == 'IntegerPositive') {
//       return TextFormField(
//         decoration: InputDecoration(labelText: field.name),
//         keyboardType: TextInputType.number,
//         onChanged: (value) {
//           // Handle value change
//         },
//       );
//     }
//     return SizedBox.shrink(); // Placeholder for other field types
//   }
// }
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Repeatable Section Example')),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               QRepeatableSectionWidget(
//                 model: QRepeatableSectionFieldModel(
//                   name: 'stockItems',
//                   path: 'stockItems',
//                   fields: [
//                     QFieldModel(
//                       name: 'stockItem',
//                       type: 'SelectOne',
//                       path: 'stockItems.stockItem',
//                       mandatory: true,
//                     ),
//                     QFieldModel(
//                       name: 'recievedQuantity',
//                       type: 'IntegerPositive',
//                       path: 'stockItems.recievedQuantity',
//                       mandatory: true,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
