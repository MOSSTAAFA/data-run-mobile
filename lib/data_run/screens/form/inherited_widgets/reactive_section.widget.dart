// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
// import 'package:mass_pro/data_run/screens/form/reactive_elements/reactive_form_element.dart';
// import 'package:mass_pro/data_run/screens/form/element_widgets/form_widget_factory.dart';
// import 'package:mass_pro/data_run/screens/form/hooks/register_dependencies.dart';
// import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
//
// class ReactiveSectionElement extends HookConsumerWidget {
//   ReactiveSectionElement(
//       {super.key,
//       required this.element,
//       required this.child,
//       this.canPop,
//       this.onPopInvoked,
//       String path = ''});
//
//   final SectionInstance element;
//
//   /// The widget below this widget in the tree.
//   final Widget child;
//
//   /// Determine whether a route can popped. See [PopScope] for more details.
//   final ReactiveFormCanPopCallback? canPop;
//
//   /// A callback invoked when a route is popped. See [PopScope] for more details.
//   final ReactiveFormPopInvokedCallback? onPopInvoked;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // useRegisterDependencies(element);
//
//     if (canPop == null && onPopInvoked == null) {
//       return child;
//     }
//
//     return ReactiveFormConsumer(
//       builder: (BuildContext context, FormGroup formGroup, Widget? child) => child,
//       child: Column(
//         children: element.elements.values.map((childElement) {
//           return FormElementWidgetFactory.createWidget(childElement);
//           // return FormElementWidget(element: childElement);
//         }).toList(),
//       ),
//     );
//   }
// }
