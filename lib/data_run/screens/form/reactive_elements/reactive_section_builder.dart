// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
// import 'package:mass_pro/data_run/screens/form/element_widgets/element_section_instance.widget.dart';
// import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
//
// class ReactiveFormInstanceBuilder extends StatefulHookConsumerWidget {
//   const ReactiveFormInstanceBuilder({
//     super.key,
//     this.model,
//     this.child,
//     required this.builder,
//     this.initState,
//   });
//
//   final SectionElement<dynamic>? model;
//
//   // final IMap<String, Object?>? model;
//
//   final Widget? child;
//
//   final Widget Function(BuildContext context,
//       FormElementInstance<dynamic> formElement, Widget? child) builder;
//
//   final void Function(
//           BuildContext context, FormElementInstance<dynamic> formElement)?
//       initState;
//
//   @override
//   ReactiveFormInstanceBuilderState createState() =>
//       ReactiveFormInstanceBuilderState();
// }
//
// class ReactiveFormInstanceBuilderState
//     extends ConsumerState<ReactiveFormInstanceBuilder> {
//   late FormElementInstance<dynamic> _formModel;
//
//   @override
//   void initState() {
//
//
//     if (_formModel.disabled) {
//       _formModel.form.markAsDisabled();
//     }
//
//     if (_formModel.hidden) {
//       if (!_formModel.disabled) {
//         _formModel.form.markAsDisabled();
//       }
//       _formModel.markAsHidden();
//     }
//
//     widget.initState?.call(context, _formModel);
//
//     super.initState();
//   }
//
//   @override
//   void didUpdateWidget(covariant ReactiveFormInstanceBuilder oldWidget) {
//     if (widget.model != oldWidget.model) {
//       _formModel.updateValue(widget.model?.unlock);
//     }
//
//     super.didUpdateWidget(oldWidget);
//   }
//
//   // @override
//   // void dispose() {
//   //   _formModel.elementControl.dispose();
//   //   super.dispose();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return SectionWidget(
//       key: ObjectKey(_formModel.elementState),
//       element: _formModel,
//       // canPop: widget.canPop,
//       // onPopInvoked: widget.onPopInvoked,
//       child: ReactiveFormBuilder(
//         form: () => _formModel.elementControl,
//         builder: (context, formGroup, child) =>
//             widget.builder(context, _formModel, widget.child),
//         child: widget.child,
//       ),
//     );
//   }
// }
