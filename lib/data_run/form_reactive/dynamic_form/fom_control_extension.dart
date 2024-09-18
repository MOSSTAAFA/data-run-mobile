import 'package:reactive_forms/reactive_forms.dart';

extension ControlPathExtension<T> on AbstractControl<dynamic> {
  String? get path {
    if (parent == null) return null; // Root control has no path
    final segments = <String>[];

    AbstractControl<dynamic>? current = this;
    while (current?.parent != null) {
      if (current!.parent is FormArray) {
        final parentArray = current.parent as FormArray;
        final index = parentArray.controls.indexOf(current);
        segments.add(index.toString());
      } else if (current.parent is FormGroup) {
        final parentGroup = current.parent as FormGroup;
        final entry = parentGroup.controls.entries
            .firstWhere((entry) => entry.value == current);
        segments.add(entry.key);
      }
      current = current.parent;
    }

    return segments.reversed.join('.');
  }
}
