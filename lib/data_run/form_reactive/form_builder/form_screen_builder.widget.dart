// import 'package:flutter/material.dart';
// import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
//
// class ReactiveStockDistributionFormConsumer extends StatelessWidget {
//   const ReactiveStockDistributionFormConsumer({
//     Key? key,
//     required this.builder,
//     this.child,
//   }) : super(key: key);
//
//   final Widget? child;
//
//   final Widget Function(
//       BuildContext context, StockDistributionForm formModel, Widget? child)
//   builder;
//
//   @override
//   Widget build(BuildContext context) {
//     final formModel = ReactiveStockDistributionForm.of(context);
//
//     if (formModel is! StockDistributionForm) {
//       throw FormControlParentNotFoundException(this);
//     }
//     return builder(context, formModel, child);
//   }
// }
//
// class StockDistributionFormInheritedStreamer
//     extends InheritedStreamer<dynamic> {
//   const StockDistributionFormInheritedStreamer({
//     Key? key,
//     required this.form,
//     required Stream<dynamic> stream,
//     required Widget child,
//   }) : super(
//     stream,
//     child,
//     key: key,
//   );
//
//   final StockDistributionForm form;
// }
//
// class ReactiveStockDistributionForm extends StatelessWidget {
//   const ReactiveStockDistributionForm({
//     Key? key,
//     required this.form,
//     required this.child,
//     this.canPop,
//     this.onPopInvoked,
//   }) : super(key: key);
//
//   final Widget child;
//
//   final StockDistributionForm form;
//
//   final bool Function(FormGroup formGroup)? canPop;
//
//   final void Function(FormGroup formGroup, bool didPop)? onPopInvoked;
//
//   static StockDistributionForm? of(
//       BuildContext context, {
//         bool listen = true,
//       }) {
//     if (listen) {
//       return context
//           .dependOnInheritedWidgetOfExactType<
//           StockDistributionFormInheritedStreamer>()
//           ?.form;
//     }
//
//     final element = context.getElementForInheritedWidgetOfExactType<
//         StockDistributionFormInheritedStreamer>();
//     return element == null
//         ? null
//         : (element.widget as StockDistributionFormInheritedStreamer).form;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return StockDistributionFormInheritedStreamer(
//       form: form,
//       stream: form.form.statusChanged,
//       child: ReactiveFormPopScope(
//         canPop: canPop,
//         onPopInvoked: onPopInvoked,
//         child: child,
//       ),
//     );
//   }
// }
//
// extension ReactiveReactiveStockDistributionFormExt on BuildContext {
//   StockDistributionForm? stockDistributionFormWatch() =>
//       ReactiveStockDistributionForm.of(this);
//
//   StockDistributionForm? stockDistributionFormRead() =>
//       ReactiveStockDistributionForm.of(this, listen: false);
// }
//
// class StockDistributionFormBuilder extends StatefulWidget {
//   const StockDistributionFormBuilder({
//     Key? key,
//     this.model,
//     this.child,
//     this.canPop,
//     this.onPopInvoked,
//     required this.builder,
//     this.initState,
//   }) : super(key: key);
//
//   final StockDistribution? model;
//
//   final Widget? child;
//
//   final bool Function(FormGroup formGroup)? canPop;
//
//   final void Function(FormGroup formGroup, bool didPop)? onPopInvoked;
//
//   final Widget Function(
//       BuildContext context, StockDistributionForm formModel, Widget? child)
//   builder;
//
//   final void Function(BuildContext context, StockDistributionForm formModel)?
//   initState;
//
//   @override
//   _StockDistributionFormBuilderState createState() =>
//       _StockDistributionFormBuilderState();
// }
//
// class _StockDistributionFormBuilderState
//     extends State<StockDistributionFormBuilder> {
//   late StockDistributionForm _formModel;
//
//   @override
//   void initState() {
//     _formModel = StockDistributionForm(
//         StockDistributionForm.formElements(widget.model), null);
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
//   void didUpdateWidget(covariant StockDistributionFormBuilder oldWidget) {
//     if (widget.model != oldWidget.model) {
//       _formModel.updateValue(widget.model);
//     }
//
//     super.didUpdateWidget(oldWidget);
//   }
//
//   @override
//   void dispose() {
//     _formModel.form.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ReactiveStockDistributionForm(
//       key: ObjectKey(_formModel),
//       form: _formModel,
//       // canPop: widget.canPop,
//       // onPopInvoked: widget.onPopInvoked,
//       child: ReactiveFormBuilder(
//         form: () => _formModel.form,
//         canPop: widget.canPop,
//         onPopInvoked: widget.onPopInvoked,
//         builder: (context, formGroup, child) =>
//             widget.builder(context, _formModel, widget.child),
//         child: widget.child,
//       ),
//     );
//   }
// }