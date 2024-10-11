// import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
// import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
//
// class SectionInheritedStreamer extends InheritedStreamer<dynamic> {
//   const SectionInheritedStreamer({
//     Key? key,
//     required this.form,
//     required Stream<dynamic> stream,
//     required Widget child,
//   }) : super(
//           stream,
//           child,
//           key: key,
//         );
//
//   final SectionElement<dynamic> form;
// }
//
// class ReactiveSection extends StatelessWidget {
//   const ReactiveSection({
//     Key? key,
//     required this.form,
//     required this.child,
//   }) : super(key: key);
//
//   final Widget child;
//
//   final SectionElement<dynamic> form;
//
//   static SectionElement<dynamic>? of(
//     BuildContext context, {
//     bool listen = true,
//   }) {
//     if (listen) {
//       return context
//           .dependOnInheritedWidgetOfExactType<SectionInheritedStreamer>()
//           ?.form;
//     }
//
//     final element = context.getElementForInheritedWidgetOfExactType<
//         SectionInheritedStreamer>();
//     return element == null
//         ? null
//         : (element.widget as SectionInheritedStreamer).form;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SectionInheritedStreamer(
//       form: form,
//       stream: form.elementChanged,
//       child: ReactiveFormPopScope(
//         // element: null,
//         // builder: (BuildContext context,
//         //     SectionElement<dynamic> formElement, Widget? child) {},
//         child: child,
//       ),
//     );
//   }
// }
