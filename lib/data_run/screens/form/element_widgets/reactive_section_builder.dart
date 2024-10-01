// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
// import 'package:mass_pro/data_run/screens/form/element/factories/form_element_control_factory.dart';
// import 'package:mass_pro/data_run/screens/form/section.widget.dart';
// import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
//
// class ReactiveFormInstanceBuilder extends StatefulHookConsumerWidget {
//   const ReactiveFormInstanceBuilder({
//     super.key,
//     this.model,
//     this.child,
//     this.canPop,
//     this.onPopInvoked,
//     required this.builder,
//     this.initState,
//   });
//
//   // final StockDistribution? model;
//
//   final IMap<String, Object?>? model;
//
//   final Widget? child;
//
//   final bool Function(FormGroup formGroup)? canPop;
//
//   final void Function(FormGroup formGroup, bool didPop)? onPopInvoked;
//
//   final Widget Function(
//       BuildContext context,
//       SectionInstance /*StockDistributionForm*/ formModel,
//       Widget? child) builder;
//
//   final void Function(BuildContext context,
//       SectionInstance /*StockDistributionForm*/ formModel)? initState;
//
//
//   @override
//   ReactiveFormInstanceBuilderState createState() => ReactiveFormInstanceBuilderState();
// }
//
// class ReactiveFormInstanceBuilderState extends ConsumerState<ReactiveFormInstanceBuilder> {
//   late SectionInstance _formModel;
//
//   @override
//   void initState() {
//     SectionInstance(template: template, form: form);
//
//     _formModel = SectionInstance(form:
//     FromTemplateControlFactory.createSectionTemplateFormGroup(widget.model), null);
//
//     if (_formModel.form.disabled) {
//       _formModel.form.markAsDisabled();
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
//   @override
//   void dispose() {
//     _formModel.elementControl.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SectionWidget(
//       key: ObjectKey(_formModel),
//       element: _formModel,
//       // canPop: widget.canPop,
//       // onPopInvoked: widget.onPopInvoked,
//       child: ReactiveFormBuilder(
//         form: () => _formModel.elementControl,
//         canPop: widget.canPop,
//         onPopInvoked: widget.onPopInvoked,
//         builder: (context, formGroup, child) =>
//             widget.builder(context, _formModel, widget.child),
//         child: widget.child,
//       ),
//     );
//   }
// }
//
