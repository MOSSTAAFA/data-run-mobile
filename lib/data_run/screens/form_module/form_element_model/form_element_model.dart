import 'package:d2_remote/modules/datarun/form/shared/rule/choice_filter.dart';
import 'package:datarun/data_run/screens/form/element/exceptions/form_element_exception.dart';
import 'package:datarun/data_run/screens/form_module/form/code_generator.dart';
import 'package:datarun/data_run/screens/form_module/form/form_element_visitor.dart';
import 'package:datarun/data_run/screens/form_module/tree_node/tree_node_mixin/tree_node_mixin.dart';
import 'package:equatable/equatable.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'field_element_model.dart';

part 'form_collection_element.dart';

part 'section_element_model.dart';

part 'repeat_element_model.dart';

part 'repeat_item_element_model.dart';

sealed class FormElementModel<T> extends AbstractTreeNode with EquatableMixin {
  FormElementModel({
    this.templatePath,
  });

  @override
  List<Object?> get props => [path];

  String? get name => templatePath?.split('.').last;

  final String? templatePath;

  CollectionElementModel<dynamic>? _parent;

  final List<String> _dependencies = [];

  CollectionElementModel<dynamic>? get parent => _parent;

  List<String> get dependencies => List.unmodifiable(_dependencies);

  void accept(FormElementVisitor visitor);

  void setDependencies(List<String> dependents) {
    _dependencies.clear();
    _dependencies.addAll(dependents);
  }

  set parent(CollectionElementModel<dynamic>? parent) {
    _parent = parent;
  }

  String? get path => pathBuilder(name);

  String pathBuilder(String? pathItem) =>
      [parent?.path, pathItem].whereType<String>().join('.');

  /// Sometimes, we might need to consider only certain elements or sections based
  /// on context, such as when gathering data for form submission (only values
  /// of fields without sections) vs. dependency resolution (where sections
  /// are relevant).
  ///
  /// **Example:**
  ///
  /// - When exporting data, use:
  ///
  /// ```dart
  /// // to collect only field values.
  /// traverse(filter: (element) => element is FieldElementModel)
  /// ```
  /// - When resolving dependencies, use:
  ///
  /// ```dart
  /// // to include relevant scopes.
  /// traverse(filter: (element) => element is SectionElementModel || element is RepeatElementModel)
  /// ```
  Iterable<E> traverse<E extends FormElementModel<dynamic>>(
      {bool Function(FormElementModel<dynamic> element)? filter}) sync* {
    if (filter == null || filter(this)) yield this as E;
    if (this is SectionElementModel) {
      for (final child in (this as SectionElementModel).elements.values) {
        yield* child.traverse(filter: filter);
      }
    }

    if (this is RepeatElementModel) {
      for (final child in (this as RepeatElementModel).elements) {
        yield* child.traverse(filter: filter);
      }
    }
  }

  TFormElement? getFirstParentOfType<
      TFormElement extends CollectionElementModel<dynamic>>() {
    var currentParent = parent;
    while (currentParent != null) {
      if (currentParent is TFormElement) {
        return currentParent;
      }
      currentParent = currentParent.parent;
    }
    return null;
  }

  @protected
  FormElementModel<dynamic>? findElement(String path);

  FormElementModel<dynamic> getInstance();

  FormElementModel<dynamic> clone(CollectionElementModel<dynamic>? parent);
}
