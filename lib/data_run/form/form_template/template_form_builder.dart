// import 'package:d2_remote/modules/datarun/form/shared/field_template/field_template.entity.dart';
// import 'package:datarun/data_run/form/form_template/template_form_control_builder.dart';
// import 'package:datarun/data_run/screens/form/element/form_element.dart';
// import 'package:datarun/data_run/screens/form_module/form_template/form_element_template.dart';
// import 'package:flutter/material.dart';
// import 'package:reactive_forms/reactive_forms.dart';
//
// class SectionTemplateFormBuilder extends StatefulWidget {
//   const SectionTemplateFormBuilder({
//     Key? key,
//     this.model,
//     required this.template,
//     this.child,
//     this.canPop,
//     this.onPopInvoked,
//     required this.builder,
//     this.initState,
//   }) : super(key: key);
//
//   final Map<String, dynamic>? initialValue;
//
//   final FieldTemplate template;
//
//   final Widget? child;
//
//   final bool Function(FormGroup formGroup)? canPop;
//
//   final void Function(FormGroup formGroup, bool didPop)? onPopInvoked;
//
//   final Widget Function(
//       BuildContext context, SectionInstance formModel, Widget? child) builder;
//
//   final void Function(BuildContext context, SectionInstance formModel)?
//       initState;
//
//   @override
//   _SectionElementTemplateFormBuilderState createState() =>
//       _SectionElementTemplateFormBuilderState();
// }
//
// class _SectionElementTemplateFormBuilderState
//     extends State<SectionTemplateFormBuilder> {
//   late SectionInstance _formModel;
//
//   @override
//   void initState() {
//     _formModel = SectionInstance(template: widget.template, form: TemplateFormControlBuilder.createSectionFormGroup(widget.template,
//         initialValue: widget.initialValue));
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
