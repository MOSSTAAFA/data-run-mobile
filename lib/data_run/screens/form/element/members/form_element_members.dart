// import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
// import 'package:flutter/foundation.dart';
//
// import 'package:freezed_annotation/freezed_annotation.dart';
//
// part 'form_element_members.freezed.dart';
//
// @freezed
// class FormElementState with _$ElementProperties {
//   const factory FormElementState.formElementProperties({
//     @Default(false) bool hidden,
//     @Default(false) bool mandatory,
//     @Default(const {}) Map<String, dynamic> errors,
//   }) = FormElementProperties;
//
//   factory FormElementState.fieldElementProperties({
//     @Default(false) bool hidden,
//     @Default(false) bool mandatory,
//     @Default(const {}) Map<String, dynamic> errors,
//     dynamic value,
//   }) = FieldElementProperties;
//
//   factory FormElementState.fieldWithOptionsProperties({
//     @Default(false) bool hidden,
//     @Default(false) bool mandatory,
//     @Default(const {}) Map<String, dynamic> errors,
//     @Default(const []) List<FormOption> visibleChoices,
//     dynamic value,
//   }) = FieldWithOptionsProperties;
// }
//
// abstract class FormElementState {
//   final bool hidden;
//   final bool mandatory;
//   final Map<String, dynamic> errors;
//
// //<editor-fold desc="Data Methods">
//   const FormElementState({
//     this.hidden = false,
//     this.mandatory = false,
//     this.errors = const {},
//   });
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       (other is FormElementState &&
//           runtimeType == other.runtimeType &&
//           hidden == other.hidden &&
//           mandatory == other.mandatory &&
//           errors == other.errors);
//
//   @override
//   int get hashCode => hidden.hashCode ^ mandatory.hashCode ^ errors.hashCode;
//
//   @override
//   String toString() {
//     return 'FormElementState{' +
//         ' hidden: $hidden,' +
//         ' mandatory: $mandatory,' +
//         ' errors: $errors,' +
//         '}';
//   }
//
//   FormElementState copyWith({
//     bool? hidden,
//     bool? mandatory,
//     Map<String, dynamic>? errors,
//   }) {
//     return FormElementState(
//       hidden: hidden ?? this.hidden,
//       mandatory: mandatory ?? this.mandatory,
//       errors: errors ?? this.errors,
//     );
//   }
//
//   Map<String, dynamic> toMap() {
//     return {
//       'hidden': this.hidden,
//       'mandatory': this.mandatory,
//       'errors': this.errors,
//     };
//   }
//
//   factory FormElementState.fromMap(Map<String, dynamic> map) {
//     return FormElementState(
//       hidden: map['hidden'] as bool,
//       mandatory: map['mandatory'] as bool,
//       errors: map['errors'] as Map<String, dynamic>,
//     );
//   }
//
// //</editor-fold>
// }
