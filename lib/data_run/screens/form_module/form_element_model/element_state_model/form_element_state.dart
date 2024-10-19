import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

class FormElementState with EquatableMixin {
  final bool mandatory;
  final bool hidden;
  final bool disabled;
  final IMap<String, dynamic> errors;
  final bool readOnly;

  dynamic value; // Holds the current value of the field
  IList<String> dependencies; // Paths to dependent fields for rules

  FormElementState({
    this.mandatory = false,
    this.hidden = false,
    this.readOnly = false,
    this.disabled = false,
    this.value,
    Iterable<String>? dependencies,
    IMap<String, dynamic>? errors,
  })  : this.errors = errors ?? IMap(),
        this.dependencies = IList.orNull(dependencies) ?? IList();

  FormElementState copyWith({
    String? path,
    bool? mandatory,
    bool? hidden,
    bool? readOnly,
    bool? disabled,
    IMap<String, dynamic>? errors,
    Iterable<String>? dependencies,
    dynamic value,
  }) {
    return FormElementState(
        mandatory: mandatory ?? this.mandatory,
        hidden: hidden ?? this.hidden,
        readOnly: readOnly ?? this.readOnly,
        disabled: disabled ?? this.disabled,
        errors: errors ?? this.errors,
        dependencies: IList.orNull(dependencies) ?? this.dependencies,
        value: value ?? this.value);
  }

  @override
  List<Object?> get props =>
      [mandatory, hidden, readOnly, disabled, errors, value, dependencies];
}

// class SectionElementState extends FieldElementState {
//   final IList<FieldElementState> children;
//
//   SectionElementState({
//     super.mandatory,
//     super.hidden,
//     super.readOnly,
//     Iterable<FieldElementState>? children,
//   }) : this.children = IList.orNull(children) ?? IList();
//
//   @override
//   List<Object?> get props => super.props..add(children);
//
//   @override
//   SectionElementState copyWith({
//     String? path,
//     bool? mandatory,
//     bool? hidden,
//     bool? readOnly,
//     Iterable<FieldElementState>? children,
//   }) {
//     return SectionElementState(
//         mandatory: mandatory ?? this.mandatory,
//         hidden: hidden ?? this.hidden,
//         readOnly: readOnly ?? this.readOnly,
//         children: IList.orNull(children) ?? this.children);
//   }
// }
