// import 'package:equatable/equatable.dart';
// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
//
// class FormElementState with EquatableMixin {
//   final bool mandatory;
//   final bool hidden;
//   final IMap<String, dynamic> errors;
//
//   final dynamic value;
//
//   bool get visible => !hidden;
//
//   FormElementState({
//     this.mandatory = false,
//     this.hidden = false,
//     this.value,
//     IMap<String, dynamic>? errors,
//   }) : this.errors = errors ?? IMap();
//
//   FormElementState copyWith({
//     bool? mandatory,
//     bool? hidden,
//     dynamic value,
//     IMap<String, dynamic>? errors,
//   }) {
//     return FormElementState(
//         mandatory: mandatory ?? this.mandatory,
//         hidden: hidden ?? this.hidden,
//         value: value ?? this.value,
//         errors: errors ?? this.errors);
//   }
//
//   FormElementState markAsHidden() => visible ? copyWith(hidden: true) : this;
//
//   FormElementState markAsVisible() => hidden ? copyWith(hidden: false) : this;
//
//   FormElementState toggleMandatory() => copyWith(mandatory: !mandatory);
//
//   FormElementState setErrors(Map<String, dynamic>? errors) =>
//       (errors ?? {}).isNotEmpty ? copyWith(errors: IMap(errors)) : this;
//
//   FormElementState clearErrors() => copyWith(errors: IMap());
//
//   @override
//   List<Object?> get props => [
//         mandatory,
//         hidden,
//         errors /*, value*/
//       ];
// }
