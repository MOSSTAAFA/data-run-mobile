import 'package:datarun/data_run/screens/form_module/form/code_generator.dart';
import 'package:datarun/data_run/screens/form_module/form_template/form_element_template.dart';
import 'package:equatable/equatable.dart';

abstract class ElementStat with EquatableMixin {
  String? get id;

  @override
  List<Object?> get props => [id];
}

class FieldState extends ElementStat {
  final String id;
  final bool isVisible;
  final bool isEditable;

  //
  final bool hasError;
  final Map<String, dynamic>? errors;
  final dynamic value; // only for leaf fields with value

  FieldState({
    required this.id,
    this.value,
    this.isVisible = true,
    this.isEditable = true,
    this.hasError = false,
    this.errors,
  });

  @override
  List<Object?> get props => super.props + [value, hasError, errors, isVisible];

  factory FieldState.fromTemplate(FormElementTemplate template,
      [dynamic value]) {
    return FieldState(
      id: '${template.name!}_${CodeGenerator.generateUid()}',
      isEditable: template.readOnly,
      value: value,
    );
  }

  FieldState copyWith({
    String? id,
    dynamic value,
    bool? isVisible,
    bool? isEditable,
    bool? hasError,
    Map<String, dynamic>? errors,
  }) {
    return FieldState(
      id: id ?? this.id,
      value: value ?? this.value,
      isVisible: isVisible ?? this.isVisible,
      isEditable: isEditable ?? this.isEditable,
      hasError: hasError ?? this.hasError,
      errors: errors ?? this.errors,
    );
  }
}

class SectionState extends ElementStat {
  final String id;
  final bool isVisible;

  SectionState({
    required this.id,
    this.isVisible = true, // Defaults to visible
  });

  factory SectionState.fromTemplate(FormElementTemplate template,
      [dynamic value]) {
    return SectionState(id: '${template.name!}_${CodeGenerator.generateUid()}');
  }

  SectionState copyWith({
    String? id,
    bool? isVisible,
  }) {
    return SectionState(
      id: id ?? this.id,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}
