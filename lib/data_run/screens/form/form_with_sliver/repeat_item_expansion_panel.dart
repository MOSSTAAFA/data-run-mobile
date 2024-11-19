// import 'package:datarun/data_run/screens/form/element/form_element.dart';
// import 'package:datarun/data_run/screens/form/element_widgets/form_widget_factory.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
//
// class RepeatItemExpansionPanel extends HookWidget {
//   final RepeatItemInstance item;
//
//   RepeatItemExpansionPanel({required this.item});
//
//   final _isExpanded = useState(true);
//
//   @override
//   Widget build(BuildContext context) {
//     return ExpansionPanelList(
//       expansionCallback: (int index, bool isExpanded) {
//         _isExpanded.value = !isExpanded;
//       },
//       children: [
//         ExpansionPanel(
//           headerBuilder: (BuildContext context, bool isExpanded) {
//             return ListTile(
//               title: Text(item.label),
//             );
//           },
//           body: Column(
//             children: item.elements.values.map((childElement) {
//               return FormElementWidgetFactory.createWidget(childElement);
//             }).toList(),
//           ),
//           isExpanded: _isExpanded.value,
//         ),
//       ],
//     );
//   }
// }
