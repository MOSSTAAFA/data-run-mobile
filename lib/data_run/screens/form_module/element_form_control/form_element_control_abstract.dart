import 'package:mass_pro/data_run/screens/form/element/factories/form_element_control_factory.dart';
import 'package:mass_pro/data_run/screens/form_module/element_form_control/form_element_control_exceptions.dart';
import 'package:mass_pro/data_run/screens/form_module/form_element_model/form_element.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'form_field_control.dart';

part 'form_repeat_control.dart';

part 'form_section_control.dart';

part 'form_repeat_item_control.dart';

/// extended [FormControl]
abstract class FormElementControl<TModel, V> {
  FormElementControl({required this.value});

  AbstractControl<TModel> get elementControl;

  // TModel get model;

  String? get path;

  final V? Function() value;

  void updateValue(
    V? value, {
    bool updateParent = true,
    bool emitEvent = true,
  });

  reset({
    V? value,
    bool updateParent = true,
    bool emitEvent = true,
  });

  void toggleDisabled({
    bool updateParent = true,
    bool emitEvent = true,
  });
}

/// extended [FormControlCollection] control
abstract class FormCollectionElementControl<TModel,
        V>
    extends FormElementControl<TModel, V> {
  FormCollectionElementControl({
    required super.value,
  });

  @override
  FormControlCollection<TModel> get elementControl;

  TModel get model;

  void submit({
    required void Function(TModel model) onValid,
    void Function()? onNotValid,
  });

  void updateValue(
    V? value, {
    bool updateParent = true,
    bool emitEvent = true,
  });

  reset({
    V? value,
    bool updateParent = true,
    bool emitEvent = true,
  });

  void toggleDisabled({
    bool updateParent = true,
    bool emitEvent = true,
  });

  /// NMC Walk the path
  AbstractControl<dynamic> childControl(String name);

  /// Checks if [FormCollectionElementControl] contains an element by a given [name].
  ///
  /// Returns true if collection contains the element control, otherwise returns false.
  bool contains(String name);

  // TModel get rawValue;

  /// Walks the [path] to find the matching element control.
  ///
  /// Returns null if no match is found.
  AbstractControl<dynamic>? findControlInCollection(List<String> path) {
    if (path.isEmpty) {
      return null;
    }

    final result =
        path.fold<AbstractControl<dynamic>?>(elementControl, (control, name) {
      if (control != null && control is FormControlCollection<dynamic>) {
        return control.contains(name) ? control.control(name) : null;
      } else {
        return null;
      }
    });

    return result;
  }
}
