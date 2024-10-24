import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:equatable/equatable.dart';

class FormElementState with EquatableMixin {
  final bool hidden;
  final bool mandatory;
  final Map<String, dynamic> errors;

  const FormElementState({
    this.hidden = false,
    this.mandatory = false,
    this.errors = const {},
  });

  FormElementState copyWith({
    bool? hidden,
    bool? mandatory,
    Map<String, dynamic>? errors,
  }){
    return FormElementState(
      hidden: hidden ?? this.hidden,
      mandatory: mandatory ?? this.mandatory,
      errors: errors ?? this.errors,
    );
  }

  @override
  List<Object?> get props => [hidden, mandatory, ...errors.values];
}
//
// class SectionElementState extends FormElementState {
//   const SectionElementState({
//     super.hidden,
//     super.mandatory,
//     super.errors,
//   });
//
//   SectionElementState copyWith({
//     bool? hidden,
//     bool? mandatory,
//     Map<String, dynamic>? errors,
//   }) {
//     return SectionElementState(
//       hidden: hidden ?? this.hidden,
//       mandatory: mandatory ?? this.mandatory,
//       errors: errors ?? this.errors,
//     );
//   }
// }

class FieldElementState<T> extends FormElementState {
  final T? value;

  FieldElementState({
    super.hidden,
    super.mandatory,
    super.errors,
    this.value,
  });

  @override
  FormElementState copyWith({
    bool? hidden,
    bool? mandatory,
    Map<String, dynamic>? errors,
    T? value,
  }) {
    return FieldElementState(
        hidden: hidden ?? this.hidden,
        mandatory: mandatory ?? this.mandatory,
        errors: errors ?? this.errors,
        value: value ?? this.value);
  }

  @override
  List<Object?> get props => super.props..add(value);
}

class FieldElementWithOptionsState<T> extends FieldElementState<T> {
  List<FormOption> visibleOptions;

  FieldElementWithOptionsState({
    super.hidden,
    super.mandatory,
    super.errors,
    super.value,
    this.visibleOptions = const [],
  });

  @override
  FormElementState copyWith(
      {bool? hidden,
      bool? mandatory,
      Map<String, dynamic>? errors,
      T? value,
      List<FormOption>? visibleOptions}) {
    return FieldElementWithOptionsState(
      hidden: hidden ?? this.hidden,
      mandatory: mandatory ?? this.mandatory,
      errors: errors ?? this.errors,
      value: value ?? this.value,
      visibleOptions: visibleOptions ?? this.visibleOptions,
    );
  }

  @override
  List<Object?> get props => super.props..addAll([visibleOptions]);
}
