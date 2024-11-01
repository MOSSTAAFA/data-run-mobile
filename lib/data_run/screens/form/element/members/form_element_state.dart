import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mass_pro/commons/extensions/list_extensions.dart';

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
  }) {
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
  List<FormOption> visibleOptions;

  FieldElementState({
    super.hidden,
    super.mandatory,
    super.errors,
    this.visibleOptions = const [],
    this.value,
  });

  @override
  FieldElementState<T> copyWith(
      {bool? hidden,
      bool? mandatory,
      Map<String, dynamic>? errors,
      T? value,
      List<FormOption>? visibleOptions}) {
    return FieldElementState<T>(
      hidden: hidden ?? this.hidden,
      mandatory: mandatory ?? this.mandatory,
      errors: errors ?? this.errors,
      value: value ?? this.value,
      visibleOptions: visibleOptions ?? this.visibleOptions,
    );
  }

  FieldElementState<T> reset({T? value}) {
    return FieldElementState<T>(
      hidden: this.hidden,
      mandatory: this.mandatory,
      errors: this.errors,
      value: value,
      visibleOptions: this.visibleOptions,
    );
  }

  FieldElementState<T> resetValueFromVisibleOptions(
      {required List<FormOption> visibleOptions}) {
    if (!DeepCollectionEquality.unordered()
        .equals(this.visibleOptions, visibleOptions)) {
      if (T is List<String>) {
        final selectedValues = (value as List<String>)
            .where((selectedValue) => visibleOptions.contains(selectedValue))
            .toList();
        visibleOptions.where((option) => option.name == this.value).toList();
        return copyWith(visibleOptions: visibleOptions)
            .reset(value: selectedValues as T);
      } else {
        final String? newValue = visibleOptions
            .firstOrNullWhere((option) => option.name == this.value)
            ?.name;

        return copyWith(visibleOptions: visibleOptions)
            .reset(value: newValue as T?);
      }
    }
    return this;
  }

  @override
  List<Object?> get props => super.props..addAll([visibleOptions, value]);
}
