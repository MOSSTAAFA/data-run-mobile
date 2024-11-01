// import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
// import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
//
// class SectionInheritedWidget extends InheritedWidget {
//   const SectionInheritedWidget({
//     Key? key,
//     required this.section,
//     required this.child,
//   }) : super(key: key, child: child);
//   final SectionElement<dynamic> section;
//   final Widget child;
//
//   static SectionElement<dynamic> of(BuildContext context) {
//     final SectionInheritedWidget? inheritedWidget =
//         context.dependOnInheritedWidgetOfExactType<SectionInheritedWidget>();
//     if (inheritedWidget == null) {
//       throw 'No FormElementInheritedWidget found in context.';
//     }
//     return inheritedWidget.section;
//   }
//
//   @override
//   bool updateShouldNotify(covariant SectionInheritedWidget oldWidget) {
//     return section != oldWidget.section;
//   }
// }
