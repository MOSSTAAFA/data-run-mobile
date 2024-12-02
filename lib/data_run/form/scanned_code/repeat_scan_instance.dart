// part of '../../screens/form/element/form_element.dart';
//
// class RepeatScanInstance
//     extends FormElementInstance<List<Map<String, Object?>>> {
//   RepeatScanInstance({
//     required FieldElementState<List<Map<String, Object?>>> elementProperties,
//     required super.form,
//     required FieldTemplate template,
//   }) : super(template: template, elementState: elementProperties);
//
//   IList<String> get expectedAIs =>
//       template.scannedCodeProperties?.allowedItemTypes ?? const IList.empty();
//
//   //
//   bool get gs1Enabled => template.gs1Enabled;
//
//   FieldTemplate get template => (super.template as FieldTemplate);
//
//   FieldElementState<List<Map<String, Object?>>> get elementState =>
//       _elementState as FieldElementState<List<Map<String, Object?>>>;
//
//   @override
//   List<Map<String, Object?>>? reduceValue() => elementState.value;
//
//   @override
//   FormControl<List<Map<String, Object?>>> get elementControl =>
//       form.control(elementPath!) as FormControl<List<Map<String, Object?>>>;
//
//   @override
//   void updateValue(List<Map<String, Object?>>? value,
//       {bool updateParent = true, bool emitEvent = true}) {
//     if (value == this.value) {
//       return;
//     }
//     updateStatus(elementState.reset(value: value));
//     elementControl.updateValue(
//       value,
//       updateParent: updateParent,
//       emitEvent: emitEvent,
//     );
//   }
//
//   @override
//   FormElementInstance<dynamic>? findElement(String path) => this;
//
//   @override
//   void forEachChild(
//           void Function(FormElementInstance<dynamic> element) callback) =>
//       <FormElementInstance<dynamic>>[];
//
//   @override
//   void reset({List<Map<String, Object?>>? value}) {
//     updateStatus(elementState.reset(value: value));
//     elementControl.reset(value: template.defaultValue);
//   }
//
//   List<FormOption> get visibleOption => elementState.visibleOptions;
// }
