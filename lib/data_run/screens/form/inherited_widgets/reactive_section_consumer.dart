// import 'package:flutter/material.dart';
// import 'package:mass_pro/data_run/screens/form/element/exceptions/form_element_exception.dart';
// import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
// import 'package:mass_pro/data_run/screens/form/inherited_widgets/section_inherited_streamer.dart';
//
// class ReactiveSectionConsumer extends StatelessWidget {
//   const ReactiveSectionConsumer({
//     super.key,
//     required this.builder,
//     this.child,
//   });
//
//   final Widget? child;
//
//   final Widget Function(BuildContext context,
//       SectionElement<dynamic> sectionElement, Widget? child) builder;
//
//   @override
//   Widget build(BuildContext context) {
//     final formModel = ReactiveSection.of(context);
//
//     if (formModel is! SectionElement) {
//       throw FormElementParentNotFoundException(this);
//     }
//     return builder(context, formModel, child);
//   }
// }
