import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element/form_metadata.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'element_providers.g.dart';

@immutable
class FormElementState<T> /*extends ControlState<T> */ with EquatableMixin {
  FormElementState({
    this.hidden = false,
    this.mandatory = false,
    this.readOnly = false,
    this.status = ControlStatus.valid,
  });

  final bool hidden;

  final bool mandatory;
  final bool readOnly;
  final ControlStatus status;

  FormElementState<T> copyWith({
    bool? hidden,
    bool? mandatory,
    bool? readOnly,
    ControlStatus? status,
    // T? value,
    // bool? disabled,
  }) {
    return FormElementState(
      hidden: hidden ?? this.hidden,
      mandatory: mandatory ?? this.mandatory,
      readOnly: readOnly ?? this.readOnly,
      status: status ?? this.status,
    );
  }

  FormElementState<T> mergeControlStatus(ControlStatus status) =>
      copyWith(status: status);

  FormElementState<T> toggleHidden() => copyWith(hidden: !hidden);

  FormElementState<T> toggleReadOnly() => copyWith(readOnly: !readOnly);

  @override
  List<Object> get props => [hidden, readOnly, status];
}

@immutable
class FieldInstanceState<T> extends FormElementState<T> {
  FieldInstanceState(
      {required super.hidden,
      required super.mandatory,
      super.status,
      super.readOnly,
      List<FormOption>? options})
      : filteredOptions = IList.orNull(options) ?? IList();

  @override
  FieldInstanceState<T> copyWith(
      {bool? hidden,
      bool? mandatory,
      bool? readOnly,
      ControlStatus? status,
      // T? value,
      List<FormOption>? filteredOptions}) {
    return FieldInstanceState(
        hidden: hidden ?? this.hidden,
        mandatory: mandatory ?? this.mandatory,
        readOnly: readOnly ?? this.readOnly,
        status: status ?? this.status,
        options: filteredOptions ?? this.filteredOptions.unlock);
  }

  final IList<FormOption> filteredOptions;

  // List<FormOption> get options => List.unmodifiable(_filteredOptions);

  @override
  List<Object> get props => super.props..addAll([filteredOptions]);
}

@immutable
class OptionConfig with EquatableMixin {
  factory OptionConfig.fromOptionTemplate(FormOption optionTemplate) {
    return OptionConfig(
        listName: optionTemplate.listName,
        name: optionTemplate.name,
        label: optionTemplate.label,
        choiceFilters: optionTemplate.properties ?? {});
  }

  OptionConfig(
      {required this.listName,
      required this.name,
      Map<String, dynamic> label = const {},
      this.order = 0,
      Map<String, dynamic> choiceFilters = const {}}) {
    this._choiceFilters.addAll(choiceFilters);
    this._label.addAll(label);
  }

  final String listName;
  final String name;
  final int order;

  final Map<String, dynamic> _label = {};

  Map<String, dynamic> get label => Map.unmodifiable(_label);

  /// {nameOfFilter:valueOfFilter}
  final Map<String, dynamic> _choiceFilters = {};

  Map<String, dynamic> get choiceFilters => Map.unmodifiable(_choiceFilters);

  Map<String, dynamic> toContext() {
    return {
      'label': label,
      'name': name,
      'listName': listName,
      ...choiceFilters,
      'order': order,
    };
  }

  @override
  List<Object?> get props => [listName, name, order, _label, _choiceFilters];
}

@riverpod
FormElementInstance<dynamic> elementDependency(
    ElementDependencyRef ref, String path,
    {required FormMetadata formMetaData}) {
  throw UnimplementedError();
}
