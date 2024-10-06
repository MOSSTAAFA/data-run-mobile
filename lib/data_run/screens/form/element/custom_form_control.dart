// import 'dart:async';
//
// import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
// import 'package:mass_pro/data_run/screens/form/element/members/form_element_members.dart';
// import 'package:reactive_forms/reactive_forms.dart';
//
// class CustomFormControl<T> extends FormControl<T> {
//   final _visibilityController = StreamController<bool>.broadcast();
//   final FieldTemplate template;
//
//   CustomFormControl({
//     super.value,
//     super.validators,
//     super.asyncValidators,
//     super.asyncValidatorsDebounceTime,
//     super.disabled,
//     super.touched,
//     bool hidden = false,
//     bool mandatory = false,
//     String? label,
//     FieldTemplate teamplate,
//   }) {
//     if (value != null) {
//       this.value = value;
//     } else {
//       updateValueAndValidity();
//     }
//     // Initial visibility state
//     // reEvaluate();
//   }
//
//   // Visibility stream for reactive updates
//   Stream<bool> get visibilityStream => _visibilityController.stream;
//
//   // Method to update visibility based on some condition
//   void updateVisibility(bool visible) {
//     _visibilityController.add(visible);
//   }
//
//   @override
//   void dispose() {
//     _visibilityController.close();
//     super.dispose();
//   }
// }
