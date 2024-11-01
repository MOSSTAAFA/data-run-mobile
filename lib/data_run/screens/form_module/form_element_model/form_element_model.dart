import 'package:mass_pro/data_run/screens/form/element/exceptions/form_element_exception.dart';
import 'package:mass_pro/data_run/screens/form/element/members/form_element_state.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'field_element_model.dart';

part 'form_collection_element.dart';

part 'section_element_model.dart';

part 'repeat_element_model.dart';

part 'repeat_item_element_model.dart';

sealed class FormElementModel<T> {
  FormElementModel(
      {required this.name,
      String? path,
      bool hidden = false,
      bool mandatory = false,
      Map<String, FormElementState>? formElementsState})
      : _hidden = hidden,
        _mandatory = mandatory,
        _path = path,
        _formElementsState = formElementsState ?? {};

  FormElementModel<Object>? _parentSection;

  T? get value => reduceValue();
  bool _hidden;
  bool _mandatory;
  final String name;
  String? _path;

  // <path, elementState>
  final Map<String, FormElementState> _formElementsState;

  Map<String, FormElementState> get formElementsState =>
      Map.unmodifiable(_formElementsState);

  String? get path => _path;

  FormElementModel<Object>? get parentSection => _parentSection;

  bool get mandatory => _mandatory;

  bool get hidden => _hidden;

  bool get visible => !hidden;

  set parentSection(FormElementModel<Object>? parent) {
    if (this is RepeatItemElementModel && !(parent is RepeatElementModel?)) {
      throw StateError(
          'A RepeatItemInstance\'s Parent can only be a RepeatInstance, parent: ${parent.runtimeType}');
    }

    _parentSection = parent;
  }

  String get elementPath => pathBuilder(name);

  String pathBuilder(String? pathItem) => [
        parentSection != null ? parentSection!.elementPath : null,
        pathItem
      ].whereType<String>().join('.');

  @protected
  bool allElementsHidden() => _hidden;

  T? reduceValue();

  void updateValue(T? value);

  void markAsHidden() {
    if (_hidden) {
      return;
    }
    _hidden = true;
  }

  void markAsVisible() {
    if (visible) {
      return;
    }
    _hidden = false;
  }

  @protected
  void forEachChild(void Function(FormElementModel<dynamic> element) callback);

  @protected
  FormElementModel<dynamic>? findElement(String path);

  Map<String, dynamic> flattenElements(
      Map<String, dynamic> formMap, String prefix) {
    final flatMap = <String, dynamic>{};
    formMap.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        flatMap.addAll(flattenElements(value, '$prefix.$key'));
      } else {
        flatMap['$key'] = value;
      }
    });
    return flatMap;
  }

  static AbstractControl<T> formElements<T>(FormElementModel<T>? element) {
    throw UnimplementedError();
  }
}
