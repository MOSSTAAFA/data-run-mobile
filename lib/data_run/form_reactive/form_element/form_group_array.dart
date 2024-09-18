import 'package:reactive_forms/reactive_forms.dart';

class FormGroupArray extends FormArray<Map<String, dynamic>> {
  FormGroupArray(super.controls, {required this.itemBuilder});

  final FormGroup Function() itemBuilder;

  @override
  void updateValue(
    List<dynamic>? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    for (var i = 0; i < controls.length; i++) {
      if (value == null || i < value.length) {
        controls[i].updateValue(
          value?.elementAt(i),
          updateParent: false,
          emitEvent: emitEvent,
        );
      }
    }

    if (value != null && value.length > controls.length) {
      final newControls = value
          .toList()
          .asMap()
          .entries
          .where((entry) => entry.key >= controls.length)
          .map((entry) => itemBuilder()..value = entry.value)
          .toList();

      addAll(
        newControls,
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      updateValueAndValidity(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }
}
//
// @freezed
// class ElementStatus with _$ElementStatus {
//   const factory ElementStatus(
//       {@Default(0) int order,
//       String? label,
//       String? placeholder,
//       @Default(false) bool hidden,
//       @Default(false) bool mandatory,
//       @Default(false) bool readonly}) = _ElementStatus;
// }
//
// class QFormGroup extends FormGroup {
//   QFormGroup(
//     super.controls, {
//     required this.type,
//     bool hidden = false,
//     bool readonly = false,
//     bool mandatory = false,
//     super.validators,
//     super.asyncValidators,
//     super.asyncValidatorsDebounceTime,
//   })  : _elementStatus = ElementStatus(
//             hidden: hidden, readonly: readonly, mandatory: mandatory),
//         super(disabled: hidden);
//   final _elementStatusChanges = StreamController<ElementStatus>.broadcast();
//
//   final ValueType type;
//   final ElementStatus _elementStatus;
//
//   ElementStatus get elementStatus => _elementStatus;
//
//   Stream<ElementStatus> get elementStatusChanged =>
//       _elementStatusChanges.stream;
//
//   bool get readOnly => elementStatus.readOnly;
//
//   bool get mandatory => elementStatus.mandatory;
//
//   bool get hidden => elementStatus.hidden;
//
//   bool get visible => !hidden;
//
//   @override
//   void updateValue(
//     Map<String, Object?>? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     value ??= {};
//
//     for (final key in controls.keys) {
//       controls[key]!.updateValue(
//         value[key],
//         updateParent: false,
//         emitEvent: emitEvent,
//       );
//     }
//
//     updateValueAndValidity(
//       updateParent: updateParent,
//       emitEvent: emitEvent,
//     );
//   }
// }
