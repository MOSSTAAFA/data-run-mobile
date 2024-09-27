// import 'package:mass_pro/data_run/form_reactive/form_element/form_element.dart';
// import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
//
// class ReactiveStockDistributionFormConsumer extends StatelessWidget {
//   const ReactiveStockDistributionFormConsumer({
//     Key? key,
//     required this.builder,
//     this.child,
//   }) : super(key: key);
//
//   final Widget? child;
//
//   final Widget Function(
//           BuildContext context, FormTemplateModel formModel, Widget? child)
//       builder;
//
//   @override
//   Widget build(BuildContext context) {
//     final formModel = ReactiveStockDistributionForm.of(context);
//
//     if (formModel is! FormTemplateModel) {
//       throw FormControlParentNotFoundException(this);
//     }
//     return builder(context, formModel, child);
//   }
// }
//
// class StockDistributionFormInheritedStreamer
//     extends InheritedStreamer<dynamic> {
//   const StockDistributionFormInheritedStreamer({
//     Key? key,
//     required this.form,
//     required Stream<dynamic> stream,
//     required Widget child,
//   }) : super(
//           stream,
//           child,
//           key: key,
//         );
//
//   final FormTemplateModel form;
// }
//
// class ReactiveStockDistributionForm extends StatelessWidget {
//   const ReactiveStockDistributionForm({
//     Key? key,
//     required this.form,
//     required this.child,
//     this.canPop,
//     this.onPopInvoked,
//   }) : super(key: key);
//
//   final Widget child;
//
//   final FormTemplateModel form;
//
//   final bool Function(FormGroup formGroup)? canPop;
//
//   final void Function(FormGroup formGroup, bool didPop)? onPopInvoked;
//
//   static FormTemplateModel? of(
//     BuildContext context, {
//     bool listen = true,
//   }) {
//     if (listen) {
//       return context
//           .dependOnInheritedWidgetOfExactType<
//               StockDistributionFormInheritedStreamer>()
//           ?.form;
//     }
//
//     final element = context.getElementForInheritedWidgetOfExactType<
//         StockDistributionFormInheritedStreamer>();
//     return element == null
//         ? null
//         : (element.widget as StockDistributionFormInheritedStreamer).form;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return StockDistributionFormInheritedStreamer(
//       form: form,
//       stream: form.formModel.statusChanged,
//       child: ReactiveFormPopScope(
//         canPop: canPop,
//         onPopInvoked: onPopInvoked,
//         child: child,
//       ),
//     );
//   }
// }
//
// extension ReactiveReactiveStockDistributionFormExt on BuildContext {
//   FormTemplateModel? stockDistributionFormWatch() =>
//       ReactiveStockDistributionForm.of(this);
//
//   FormTemplateModel? stockDistributionFormRead() =>
//       ReactiveStockDistributionForm.of(this, listen: false);
// }
//
// class StockDistributionFormBuilder extends StatefulWidget {
//   const StockDistributionFormBuilder({
//     Key? key,
//     this.model,
//     this.child,
//     this.canPop,
//     this.onPopInvoked,
//     required this.builder,
//     this.initState,
//   }) : super(key: key);
//
//   final FormTemplateModel? model;
//
//   final Widget? child;
//
//   final bool Function(FormGroup formGroup)? canPop;
//
//   final void Function(FormGroup formGroup, bool didPop)? onPopInvoked;
//
//   final Widget Function(
//           BuildContext context, FormTemplateModel formModel, Widget? child)
//       builder;
//
//   final void Function(BuildContext context, FormTemplateModel formModel)?
//       initState;
//
//   @override
//   _StockDistributionFormBuilderState createState() =>
//       _StockDistributionFormBuilderState();
// }
//
// class _StockDistributionFormBuilderState
//     extends State<StockDistributionFormBuilder> {
//   late FormTemplateModel _formModel;
//
//   @override
//   void initState() {
//     _formModel = StockDistributionForm(
//         StockDistributionForm.formElements(widget.model), null);
//
//     if (_formModel.formModel.disabled) {
//       _formModel.formModel.markAsDisabled();
//     }
//
//     widget.initState?.call(context, _formModel);
//
//     super.initState();
//   }
//
//   @override
//   void didUpdateWidget(covariant StockDistributionFormBuilder oldWidget) {
//     if (widget.model != oldWidget.model) {
//       _formModel.updateValue(widget.model);
//     }
//
//     super.didUpdateWidget(oldWidget);
//   }
//
//   @override
//   void dispose() {
//     _formModel.formModel.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ReactiveStockDistributionForm(
//       key: ObjectKey(_formModel),
//       form: _formModel,
//       // canPop: widget.canPop,
//       // onPopInvoked: widget.onPopInvoked,
//       child: ReactiveFormBuilder(
//         form: () => _formModel.formModel,
//         canPop: widget.canPop,
//         onPopInvoked: widget.onPopInvoked,
//         builder: (context, formGroup, child) =>
//             widget.builder(context, _formModel, widget.child),
//         child: widget.child,
//       ),
//     );
//   }
// }
//
// class StockDistributionForm implements FormModel<StockDistribution> {
//   StockDistributionForm(
//     this.form,
//     this.path,
//   );
//
//   static const String fieldNameControlName = "fieldName";
//
//   static const String malariaUnitControlName = "malariaUnit";
//
//   static const String stockItemsControlName = "stockItems";
//
//   final FormGroup form;
//
//   final String? path;
//
//   final Map<String, bool> _disabled = {};
//
//   String fieldNameControlPath() => pathBuilder(fieldNameControlName);
//
//   String malariaUnitControlPath() => pathBuilder(malariaUnitControlName);
//
//   String stockItemsControlPath() => pathBuilder(stockItemsControlName);
//
//   String? get _fieldNameValue => fieldNameControl?.value;
//
//   MUnitSection? get _malariaUnitValue => malariaUnitForm.model;
//
//   List<RepeatedStockItem> get _stockItemsValue =>
//       stockItemsRepeatedStockItemForm.map((e) => e.model).toList();
//
//   bool get containsFieldName {
//     try {
//       form.control(fieldNameControlPath());
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   bool get containsMalariaUnit {
//     try {
//       form.control(malariaUnitControlPath());
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   bool get containsStockItems {
//     try {
//       form.control(stockItemsControlPath());
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   Map<String, Object>? get fieldNameErrors => fieldNameControl?.errors;
//
//   Map<String, Object>? get malariaUnitErrors => malariaUnitControl?.errors;
//
//   Map<String, Object> get stockItemsErrors => stockItemsControl.errors;
//
//   void get fieldNameFocus => form.focus(fieldNameControlPath());
//
//   void get malariaUnitFocus => form.focus(malariaUnitControlPath());
//
//   void get stockItemsFocus => form.focus(stockItemsControlPath());
//
//   void fieldNameRemove({
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     if (containsFieldName) {
//       final controlPath = path;
//       if (controlPath == null) {
//         form.removeControl(
//           fieldNameControlName,
//           updateParent: updateParent,
//           emitEvent: emitEvent,
//         );
//       } else {
//         final formGroup = form.control(controlPath);
//
//         if (formGroup is FormGroup) {
//           formGroup.removeControl(
//             fieldNameControlName,
//             updateParent: updateParent,
//             emitEvent: emitEvent,
//           );
//         }
//       }
//     }
//   }
//
//   void malariaUnitRemove({
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     if (containsMalariaUnit) {
//       final controlPath = path;
//       if (controlPath == null) {
//         form.removeControl(
//           malariaUnitControlName,
//           updateParent: updateParent,
//           emitEvent: emitEvent,
//         );
//       } else {
//         final formGroup = form.control(controlPath);
//
//         if (formGroup is FormGroup) {
//           formGroup.removeControl(
//             malariaUnitControlName,
//             updateParent: updateParent,
//             emitEvent: emitEvent,
//           );
//         }
//       }
//     }
//   }
//
//   void fieldNameValueUpdate(
//     String? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     fieldNameControl?.updateValue(value,
//         updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   void malariaUnitValueUpdate(
//     MUnitSection? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     malariaUnitControl?.updateValue(
//         MUnitSectionForm.formElements(value).rawValue,
//         updateParent: updateParent,
//         emitEvent: emitEvent);
//   }
//
//   void stockItemsValueUpdate(
//     List<RepeatedStockItem> value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     final localValue = (value);
//     if (localValue.isEmpty) {
//       stockItemsClear(updateParent: updateParent, emitEvent: emitEvent);
//
//       return;
//     }
//
//     final toUpdate = <RepeatedStockItem>[];
//     final toAdd = <RepeatedStockItem>[];
//
//     localValue.asMap().forEach((k, v) {
//       final values = (stockItemsControl.controls).map((e) => e.value).toList();
//
//       if (stockItemsRepeatedStockItemForm.asMap().containsKey(k) &&
//           values.asMap().containsKey(k)) {
//         toUpdate.add(v);
//       } else {
//         toAdd.add(v);
//       }
//     });
//
//     if (toUpdate.isNotEmpty) {
//       stockItemsControl.updateValue(
//           toUpdate
//               .map((e) => RepeatedStockItemForm.formElements(e).rawValue)
//               .toList(),
//           updateParent: updateParent,
//           emitEvent: emitEvent);
//     }
//
//     if (toAdd.isNotEmpty) {
//       toAdd.forEach((e) {
//         stockItemsControl.add(RepeatedStockItemForm.formElements(e),
//             updateParent: updateParent, emitEvent: emitEvent);
//       });
//     }
//   }
//
//   void stockItemsInsert(
//     int i,
//     RepeatedStockItem value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     final values = (stockItemsControl.controls).map((e) => e.value).toList();
//     if (values.length < i) {
//       addStockItemsItem(value);
//       return;
//     }
//
//     stockItemsControl.insert(
//       i,
//       RepeatedStockItemForm.formElements(value),
//       updateParent: updateParent,
//       emitEvent: emitEvent,
//     );
//   }
//
//   void stockItemsClear({
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     stockItemsRepeatedStockItemForm.clear();
//     stockItemsControl.clear(updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   void fieldNameValuePatch(
//     String? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     fieldNameControl?.patchValue(value,
//         updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   void malariaUnitValuePatch(
//     MUnitSection? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     malariaUnitControl?.updateValue(
//         MUnitSectionForm.formElements(value).rawValue,
//         updateParent: updateParent,
//         emitEvent: emitEvent);
//   }
//
//   void stockItemsValuePatch(
//     List<RepeatedStockItem> value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     final keys = stockItemsRepeatedStockItemForm.asMap().keys;
//
//     final toPatch = <RepeatedStockItem>[];
//     (value).asMap().forEach(
//       (k, v) {
//         if (keys.contains(k)) {
//           toPatch.add(v);
//         }
//       },
//     );
//
//     stockItemsControl.patchValue(
//         toPatch
//             .map((e) => RepeatedStockItemForm.formElements(e).rawValue)
//             .toList(),
//         updateParent: updateParent,
//         emitEvent: emitEvent);
//   }
//
//   void fieldNameValueReset(
//     String? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//     bool removeFocus = false,
//     bool? disabled,
//   }) =>
//       fieldNameControl?.reset(
//           value: value, updateParent: updateParent, emitEvent: emitEvent);
//
//   void malariaUnitValueReset(
//     MUnitSection? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//     bool removeFocus = false,
//     bool? disabled,
//   }) =>
//       malariaUnitControl?.reset(
//           value: MUnitSectionForm.formElements(value).rawValue,
//           updateParent: updateParent,
//           emitEvent: emitEvent);
//
//   void stockItemsValueReset(
//     List<RepeatedStockItem> value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//     bool removeFocus = false,
//     bool? disabled,
//   }) =>
//       stockItemsControl.reset(
//           value: value
//               .map((e) => RepeatedStockItemForm.formElements(e).rawValue)
//               .toList(),
//           updateParent: updateParent,
//           emitEvent: emitEvent);
//
//   FormControl<String>? get fieldNameControl => containsFieldName
//       ? form.control(fieldNameControlPath()) as FormControl<String>?
//       : null;
//
//   FormGroup? get malariaUnitControl => containsMalariaUnit
//       ? form.control(malariaUnitControlPath()) as FormGroup?
//       : null;
//
//   FormArray<Map<String, Object?>> get stockItemsControl =>
//       form.control(stockItemsControlPath()) as FormArray<Map<String, Object?>>;
//
//   MUnitSectionForm get malariaUnitForm =>
//       MUnitSectionForm(form, pathBuilder('malariaUnit'));
//
//   List<RepeatedStockItemForm> get stockItemsRepeatedStockItemForm {
//     final values = (stockItemsControl.controls).map((e) => e.value).toList();
//
//     return values
//         .asMap()
//         .map((k, v) => MapEntry(
//             k, RepeatedStockItemForm(form, pathBuilder("stockItems.$k"))))
//         .values
//         .toList();
//   }
//
//   void fieldNameSetDisabled(
//     bool disabled, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     if (disabled) {
//       fieldNameControl?.markAsDisabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     } else {
//       fieldNameControl?.markAsEnabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     }
//   }
//
//   void malariaUnitSetDisabled(
//     bool disabled, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     if (disabled) {
//       malariaUnitControl?.markAsDisabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     } else {
//       malariaUnitControl?.markAsEnabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     }
//   }
//
//   void stockItemsSetDisabled(
//     bool disabled, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     if (disabled) {
//       stockItemsControl.markAsDisabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     } else {
//       stockItemsControl.markAsEnabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     }
//   }
//
//   ExtendedControl<List<Map<String, Object?>?>, List<RepeatedStockItemForm>>
//       get stockItemsExtendedControl => ExtendedControl<
//               List<Map<String, Object?>?>, List<RepeatedStockItemForm>>(
//           form.control(stockItemsControlPath())
//               as FormArray<Map<String, Object?>>,
//           () => stockItemsRepeatedStockItemForm);
//
//   void addStockItemsItem(RepeatedStockItem value) {
//     stockItemsControl.add(RepeatedStockItemForm.formElements(value));
//   }
//
//   void removeStockItemsItemAtIndex(int i) {
//     if ((stockItemsControl.value ?? []).length > i) {
//       stockItemsControl.removeAt(i);
//     }
//   }
//
//   void addStockItemsItemList(List<RepeatedStockItem> value) {
//     value.map((e) => addStockItemsItem(e));
//   }
//
//   @override
//   StockDistribution get model {
//     final isValid = !currentForm.hasErrors && currentForm.errors.isEmpty;
//
//     if (!isValid) {
//       debugPrintStack(
//           label:
//               '[${path ?? 'StockDistributionForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
//     }
//     return StockDistribution(
//         fieldName: _fieldNameValue,
//         malariaUnit: _malariaUnitValue,
//         stockItems: _stockItemsValue);
//   }
//
//   @override
//   void toggleDisabled({
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     final currentFormInstance = currentForm;
//
//     if (currentFormInstance is! FormGroup) {
//       return;
//     }
//
//     if (_disabled.isEmpty) {
//       currentFormInstance.controls.forEach((key, control) {
//         _disabled[key] = control.disabled;
//       });
//
//       stockItemsRepeatedStockItemForm.forEach((e) => e.toggleDisabled());
//       malariaUnitForm.toggleDisabled();
//       currentForm.markAsDisabled(
//           updateParent: updateParent, emitEvent: emitEvent);
//     } else {
//       stockItemsRepeatedStockItemForm.forEach((e) => e.toggleDisabled());
//       malariaUnitForm.toggleDisabled();
//       currentFormInstance.controls.forEach((key, control) {
//         if (_disabled[key] == false) {
//           currentFormInstance.controls[key]?.markAsEnabled(
//             updateParent: updateParent,
//             emitEvent: emitEvent,
//           );
//         }
//
//         _disabled.remove(key);
//       });
//     }
//   }
//
//   @override
//   void submit({
//     required void Function(StockDistribution model) onValid,
//     void Function()? onNotValid,
//   }) {
//     currentForm.markAllAsTouched();
//     if (currentForm.valid) {
//       onValid(model);
//     } else {
//       onNotValid?.call();
//     }
//   }
//
//   AbstractControl<dynamic> get currentForm {
//     return path == null ? form : form.control(path!);
//   }
//
//   @override
//   void updateValue(
//     StockDistribution? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) =>
//       form.updateValue(StockDistributionForm.formElements(value).rawValue,
//           updateParent: updateParent, emitEvent: emitEvent);
//
//   @override
//   void reset({
//     StockDistribution? value,
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) =>
//       form.reset(
//           value: value != null ? formElements(value).rawValue : null,
//           updateParent: updateParent,
//           emitEvent: emitEvent);
//
//   String pathBuilder(String? pathItem) =>
//       [path, pathItem].whereType<String>().join(".");
//
//   static FormGroup formElements(StockDistribution? stockDistribution) =>
//       FormGroup({
//         fieldNameControlName: FormControl<String>(
//             value: stockDistribution?.fieldName,
//             validators: [],
//             asyncValidators: [],
//             asyncValidatorsDebounceTime: 250,
//             disabled: false,
//             touched: false),
//         stockItemsControlName: FormArray(
//             (stockDistribution?.stockItems ?? [])
//                 .map((e) => RepeatedStockItemForm.formElements(e))
//                 .toList(),
//             validators: [],
//             asyncValidators: [],
//             asyncValidatorsDebounceTime: 250,
//             disabled: false),
//         malariaUnitControlName:
//             MUnitSectionForm.formElements(stockDistribution?.malariaUnit)
//       },
//           validators: [],
//           asyncValidators: [],
//           asyncValidatorsDebounceTime: 250,
//           disabled: false);
// }
//
// class MUnitSectionForm implements FormModel<MUnitSection> {
//   MUnitSectionForm(
//     this.form,
//     this.path,
//   );
//
//   static const String mUnitNameControlName = "mUnitName";
//
//   static const String mUnitTypeControlName = "mUnitType";
//
//   final FormGroup form;
//
//   final String? path;
//
//   final Map<String, bool> _disabled = {};
//
//   String mUnitNameControlPath() => pathBuilder(mUnitNameControlName);
//
//   String mUnitTypeControlPath() => pathBuilder(mUnitTypeControlName);
//
//   String? get _mUnitNameValue => mUnitNameControl?.value;
//
//   String? get _mUnitTypeValue => mUnitTypeControl?.value;
//
//   bool get containsMUnitName {
//     try {
//       form.control(mUnitNameControlPath());
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   bool get containsMUnitType {
//     try {
//       form.control(mUnitTypeControlPath());
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   Map<String, Object>? get mUnitNameErrors => mUnitNameControl?.errors;
//
//   Map<String, Object>? get mUnitTypeErrors => mUnitTypeControl?.errors;
//
//   void get mUnitNameFocus => form.focus(mUnitNameControlPath());
//
//   void get mUnitTypeFocus => form.focus(mUnitTypeControlPath());
//
//   void mUnitNameRemove({
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     if (containsMUnitName) {
//       final controlPath = path;
//       if (controlPath == null) {
//         form.removeControl(
//           mUnitNameControlName,
//           updateParent: updateParent,
//           emitEvent: emitEvent,
//         );
//       } else {
//         final formGroup = form.control(controlPath);
//
//         if (formGroup is FormGroup) {
//           formGroup.removeControl(
//             mUnitNameControlName,
//             updateParent: updateParent,
//             emitEvent: emitEvent,
//           );
//         }
//       }
//     }
//   }
//
//   void mUnitTypeRemove({
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     if (containsMUnitType) {
//       final controlPath = path;
//       if (controlPath == null) {
//         form.removeControl(
//           mUnitTypeControlName,
//           updateParent: updateParent,
//           emitEvent: emitEvent,
//         );
//       } else {
//         final formGroup = form.control(controlPath);
//
//         if (formGroup is FormGroup) {
//           formGroup.removeControl(
//             mUnitTypeControlName,
//             updateParent: updateParent,
//             emitEvent: emitEvent,
//           );
//         }
//       }
//     }
//   }
//
//   void mUnitNameValueUpdate(
//     String? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     mUnitNameControl?.updateValue(value,
//         updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   void mUnitTypeValueUpdate(
//     String? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     mUnitTypeControl?.updateValue(value,
//         updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   void mUnitNameValuePatch(
//     String? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     mUnitNameControl?.patchValue(value,
//         updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   void mUnitTypeValuePatch(
//     String? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     mUnitTypeControl?.patchValue(value,
//         updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   void mUnitNameValueReset(
//     String? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//     bool removeFocus = false,
//     bool? disabled,
//   }) =>
//       mUnitNameControl?.reset(
//           value: value, updateParent: updateParent, emitEvent: emitEvent);
//
//   void mUnitTypeValueReset(
//     String? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//     bool removeFocus = false,
//     bool? disabled,
//   }) =>
//       mUnitTypeControl?.reset(
//           value: value, updateParent: updateParent, emitEvent: emitEvent);
//
//   FormControl<String>? get mUnitNameControl => containsMUnitName
//       ? form.control(mUnitNameControlPath()) as FormControl<String>?
//       : null;
//
//   FormControl<String>? get mUnitTypeControl => containsMUnitType
//       ? form.control(mUnitTypeControlPath()) as FormControl<String>?
//       : null;
//
//   void mUnitNameSetDisabled(
//     bool disabled, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     if (disabled) {
//       mUnitNameControl?.markAsDisabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     } else {
//       mUnitNameControl?.markAsEnabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     }
//   }
//
//   void mUnitTypeSetDisabled(
//     bool disabled, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     if (disabled) {
//       mUnitTypeControl?.markAsDisabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     } else {
//       mUnitTypeControl?.markAsEnabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     }
//   }
//
//   @override
//   MUnitSection get model {
//     final isValid = !currentForm.hasErrors && currentForm.errors.isEmpty;
//
//     if (!isValid) {
//       debugPrintStack(
//           label:
//               '[${path ?? 'MUnitSectionForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
//     }
//     return MUnitSection(mUnitName: _mUnitNameValue, mUnitType: _mUnitTypeValue);
//   }
//
//   @override
//   void toggleDisabled({
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     final currentFormInstance = currentForm;
//
//     if (currentFormInstance is! FormGroup) {
//       return;
//     }
//
//     if (_disabled.isEmpty) {
//       currentFormInstance.controls.forEach((key, control) {
//         _disabled[key] = control.disabled;
//       });
//
//       currentForm.markAsDisabled(
//           updateParent: updateParent, emitEvent: emitEvent);
//     } else {
//       currentFormInstance.controls.forEach((key, control) {
//         if (_disabled[key] == false) {
//           currentFormInstance.controls[key]?.markAsEnabled(
//             updateParent: updateParent,
//             emitEvent: emitEvent,
//           );
//         }
//
//         _disabled.remove(key);
//       });
//     }
//   }
//
//   @override
//   void submit({
//     required void Function(MUnitSection model) onValid,
//     void Function()? onNotValid,
//   }) {
//     currentForm.markAllAsTouched();
//     if (currentForm.valid) {
//       onValid(model);
//     } else {
//       onNotValid?.call();
//     }
//   }
//
//   AbstractControl<dynamic> get currentForm {
//     return path == null ? form : form.control(path!);
//   }
//
//   @override
//   void updateValue(
//     MUnitSection? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) =>
//       form.updateValue(MUnitSectionForm.formElements(value).rawValue,
//           updateParent: updateParent, emitEvent: emitEvent);
//
//   @override
//   void reset({
//     MUnitSection? value,
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) =>
//       form.reset(
//           value: value != null ? formElements(value).rawValue : null,
//           updateParent: updateParent,
//           emitEvent: emitEvent);
//
//   String pathBuilder(String? pathItem) =>
//       [path, pathItem].whereType<String>().join(".");
//
//   static FormGroup formElements(MUnitSection? mUnitSection) => FormGroup({
//         mUnitNameControlName: FormControl<String>(
//             value: mUnitSection?.mUnitName,
//             validators: [],
//             asyncValidators: [],
//             asyncValidatorsDebounceTime: 250,
//             disabled: false,
//             touched: false),
//         mUnitTypeControlName: FormControl<String>(
//             value: mUnitSection?.mUnitType,
//             validators: [],
//             asyncValidators: [],
//             asyncValidatorsDebounceTime: 250,
//             disabled: false,
//             touched: false)
//       },
//           validators: [],
//           asyncValidators: [],
//           asyncValidatorsDebounceTime: 250,
//           disabled: false);
// }
//
// class RepeatedStockItemForm implements FormModel<RepeatedStockItem> {
//   RepeatedStockItemForm(
//     this.form,
//     this.path,
//   );
//
//   static const String itemTypeControlName = "itemType";
//
//   static const String receivedQuantityControlName = "receivedQuantity";
//
//   static const String oumControlName = "oum";
//
//   final FormGroup form;
//
//   final String? path;
//
//   final Map<String, bool> _disabled = {};
//
//   String itemTypeControlPath() => pathBuilder(itemTypeControlName);
//
//   String receivedQuantityControlPath() =>
//       pathBuilder(receivedQuantityControlName);
//
//   String oumControlPath() => pathBuilder(oumControlName);
//
//   String get _itemTypeValue => itemTypeControl.value ?? "";
//
//   String get _receivedQuantityValue => receivedQuantityControl.value as String;
//
//   StockUom get _oumValue => oumForm.model;
//
//   bool get containsItemType {
//     try {
//       form.control(itemTypeControlPath());
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   bool get containsReceivedQuantity {
//     try {
//       form.control(receivedQuantityControlPath());
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   bool get containsOum {
//     try {
//       form.control(oumControlPath());
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   Map<String, Object> get itemTypeErrors => itemTypeControl.errors;
//
//   Map<String, Object> get receivedQuantityErrors =>
//       receivedQuantityControl.errors;
//
//   Map<String, Object> get oumErrors => oumControl.errors;
//
//   void get itemTypeFocus => form.focus(itemTypeControlPath());
//
//   void get receivedQuantityFocus => form.focus(receivedQuantityControlPath());
//
//   void get oumFocus => form.focus(oumControlPath());
//
//   void itemTypeValueUpdate(
//     String value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     itemTypeControl.updateValue(value,
//         updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   void receivedQuantityValueUpdate(
//     String value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     receivedQuantityControl.updateValue(value,
//         updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   void oumValueUpdate(
//     StockUom value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     oumControl.updateValue(StockUomForm.formElements(value).rawValue,
//         updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   void itemTypeValuePatch(
//     String value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     itemTypeControl.patchValue(value,
//         updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   void receivedQuantityValuePatch(
//     String value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     receivedQuantityControl.patchValue(value,
//         updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   void oumValuePatch(
//     StockUom value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     oumControl.updateValue(StockUomForm.formElements(value).rawValue,
//         updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   void itemTypeValueReset(
//     String value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//     bool removeFocus = false,
//     bool? disabled,
//   }) =>
//       itemTypeControl.reset(
//           value: value, updateParent: updateParent, emitEvent: emitEvent);
//
//   void receivedQuantityValueReset(
//     String value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//     bool removeFocus = false,
//     bool? disabled,
//   }) =>
//       receivedQuantityControl.reset(
//           value: value, updateParent: updateParent, emitEvent: emitEvent);
//
//   void oumValueReset(
//     StockUom value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//     bool removeFocus = false,
//     bool? disabled,
//   }) =>
//       oumControl.reset(
//           value: StockUomForm.formElements(value).rawValue,
//           updateParent: updateParent,
//           emitEvent: emitEvent);
//
//   FormControl<String> get itemTypeControl =>
//       form.control(itemTypeControlPath()) as FormControl<String>;
//
//   FormControl<String> get receivedQuantityControl =>
//       form.control(receivedQuantityControlPath()) as FormControl<String>;
//
//   FormGroup get oumControl => form.control(oumControlPath()) as FormGroup;
//
//   StockUomForm get oumForm => StockUomForm(form, pathBuilder('oum'));
//
//   void itemTypeSetDisabled(
//     bool disabled, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     if (disabled) {
//       itemTypeControl.markAsDisabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     } else {
//       itemTypeControl.markAsEnabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     }
//   }
//
//   void receivedQuantitySetDisabled(
//     bool disabled, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     if (disabled) {
//       receivedQuantityControl.markAsDisabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     } else {
//       receivedQuantityControl.markAsEnabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     }
//   }
//
//   void oumSetDisabled(
//     bool disabled, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     if (disabled) {
//       oumControl.markAsDisabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     } else {
//       oumControl.markAsEnabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     }
//   }
//
//   @override
//   RepeatedStockItem get model {
//     final isValid = !currentForm.hasErrors && currentForm.errors.isEmpty;
//
//     if (!isValid) {
//       debugPrintStack(
//           label:
//               '[${path ?? 'RepeatedStockItemForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
//     }
//     return RepeatedStockItem(
//         itemType: _itemTypeValue,
//         receivedQuantity: _receivedQuantityValue,
//         oum: _oumValue);
//   }
//
//   @override
//   void toggleDisabled({
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     final currentFormInstance = currentForm;
//
//     if (currentFormInstance is! FormGroup) {
//       return;
//     }
//
//     if (_disabled.isEmpty) {
//       currentFormInstance.controls.forEach((key, control) {
//         _disabled[key] = control.disabled;
//       });
//
//       oumForm.toggleDisabled();
//       currentForm.markAsDisabled(
//           updateParent: updateParent, emitEvent: emitEvent);
//     } else {
//       oumForm.toggleDisabled();
//       currentFormInstance.controls.forEach((key, control) {
//         if (_disabled[key] == false) {
//           currentFormInstance.controls[key]?.markAsEnabled(
//             updateParent: updateParent,
//             emitEvent: emitEvent,
//           );
//         }
//
//         _disabled.remove(key);
//       });
//     }
//   }
//
//   @override
//   void submit({
//     required void Function(RepeatedStockItem model) onValid,
//     void Function()? onNotValid,
//   }) {
//     currentForm.markAllAsTouched();
//     if (currentForm.valid) {
//       onValid(model);
//     } else {
//       onNotValid?.call();
//     }
//   }
//
//   AbstractControl<dynamic> get currentForm {
//     return path == null ? form : form.control(path!);
//   }
//
//   @override
//   void updateValue(
//     RepeatedStockItem? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) =>
//       form.updateValue(RepeatedStockItemForm.formElements(value).rawValue,
//           updateParent: updateParent, emitEvent: emitEvent);
//
//   @override
//   void reset({
//     RepeatedStockItem? value,
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) =>
//       form.reset(
//           value: value != null ? formElements(value).rawValue : null,
//           updateParent: updateParent,
//           emitEvent: emitEvent);
//
//   String pathBuilder(String? pathItem) =>
//       [path, pathItem].whereType<String>().join(".");
//
//   static FormGroup formElements(RepeatedStockItem? repeatedStockItem) =>
//       FormGroup({
//         itemTypeControlName: FormControl<String>(
//             value: repeatedStockItem?.itemType,
//             validators: [],
//             asyncValidators: [],
//             asyncValidatorsDebounceTime: 250,
//             disabled: false,
//             touched: false),
//         receivedQuantityControlName: FormControl<String>(
//             value: repeatedStockItem?.receivedQuantity,
//             validators: [],
//             asyncValidators: [],
//             asyncValidatorsDebounceTime: 250,
//             disabled: false,
//             touched: false),
//         oumControlName: StockUomForm.formElements(repeatedStockItem?.oum)
//       },
//           validators: [],
//           asyncValidators: [],
//           asyncValidatorsDebounceTime: 250,
//           disabled: false);
// }
//
// class StockUomForm implements FormModel<StockUom> {
//   StockUomForm(
//     this.form,
//     this.path,
//   );
//
//   static const String uomControlName = "uom";
//
//   static const String uomRateControlName = "uomRate";
//
//   final FormGroup form;
//
//   final String? path;
//
//   final Map<String, bool> _disabled = {};
//
//   String uomControlPath() => pathBuilder(uomControlName);
//
//   String uomRateControlPath() => pathBuilder(uomRateControlName);
//
//   String? get _uomValue => uomControl?.value;
//
//   String? get _uomRateValue => uomRateControl?.value;
//
//   bool get containsUom {
//     try {
//       form.control(uomControlPath());
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   bool get containsUomRate {
//     try {
//       form.control(uomRateControlPath());
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   Map<String, Object>? get uomErrors => uomControl?.errors;
//
//   Map<String, Object>? get uomRateErrors => uomRateControl?.errors;
//
//   void get uomFocus => form.focus(uomControlPath());
//
//   void get uomRateFocus => form.focus(uomRateControlPath());
//
//   void uomRemove({
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     if (containsUom) {
//       final controlPath = path;
//       if (controlPath == null) {
//         form.removeControl(
//           uomControlName,
//           updateParent: updateParent,
//           emitEvent: emitEvent,
//         );
//       } else {
//         final formGroup = form.control(controlPath);
//
//         if (formGroup is FormGroup) {
//           formGroup.removeControl(
//             uomControlName,
//             updateParent: updateParent,
//             emitEvent: emitEvent,
//           );
//         }
//       }
//     }
//   }
//
//   void uomRateRemove({
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     if (containsUomRate) {
//       final controlPath = path;
//       if (controlPath == null) {
//         form.removeControl(
//           uomRateControlName,
//           updateParent: updateParent,
//           emitEvent: emitEvent,
//         );
//       } else {
//         final formGroup = form.control(controlPath);
//
//         if (formGroup is FormGroup) {
//           formGroup.removeControl(
//             uomRateControlName,
//             updateParent: updateParent,
//             emitEvent: emitEvent,
//           );
//         }
//       }
//     }
//   }
//
//   void uomValueUpdate(
//     String? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     uomControl?.updateValue(value,
//         updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   void uomRateValueUpdate(
//     String? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     uomRateControl?.updateValue(value,
//         updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   void uomValuePatch(
//     String? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     uomControl?.patchValue(value,
//         updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   void uomRateValuePatch(
//     String? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     uomRateControl?.patchValue(value,
//         updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   void uomValueReset(
//     String? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//     bool removeFocus = false,
//     bool? disabled,
//   }) =>
//       uomControl?.reset(
//           value: value, updateParent: updateParent, emitEvent: emitEvent);
//
//   void uomRateValueReset(
//     String? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//     bool removeFocus = false,
//     bool? disabled,
//   }) =>
//       uomRateControl?.reset(
//           value: value, updateParent: updateParent, emitEvent: emitEvent);
//
//   FormControl<String>? get uomControl => containsUom
//       ? form.control(uomControlPath()) as FormControl<String>?
//       : null;
//
//   FormControl<String>? get uomRateControl => containsUomRate
//       ? form.control(uomRateControlPath()) as FormControl<String>?
//       : null;
//
//   void uomSetDisabled(
//     bool disabled, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     if (disabled) {
//       uomControl?.markAsDisabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     } else {
//       uomControl?.markAsEnabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     }
//   }
//
//   void uomRateSetDisabled(
//     bool disabled, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     if (disabled) {
//       uomRateControl?.markAsDisabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     } else {
//       uomRateControl?.markAsEnabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     }
//   }
//
//   @override
//   StockUom get model {
//     final isValid = !currentForm.hasErrors && currentForm.errors.isEmpty;
//
//     if (!isValid) {
//       debugPrintStack(
//           label:
//               '[${path ?? 'StockUomForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
//     }
//     return StockUom(uom: _uomValue, uomRate: _uomRateValue);
//   }
//
//   @override
//   void toggleDisabled({
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     final currentFormInstance = currentForm;
//
//     if (currentFormInstance is! FormGroup) {
//       return;
//     }
//
//     if (_disabled.isEmpty) {
//       currentFormInstance.controls.forEach((key, control) {
//         _disabled[key] = control.disabled;
//       });
//
//       currentForm.markAsDisabled(
//           updateParent: updateParent, emitEvent: emitEvent);
//     } else {
//       currentFormInstance.controls.forEach((key, control) {
//         if (_disabled[key] == false) {
//           currentFormInstance.controls[key]?.markAsEnabled(
//             updateParent: updateParent,
//             emitEvent: emitEvent,
//           );
//         }
//
//         _disabled.remove(key);
//       });
//     }
//   }
//
//   @override
//   void submit({
//     required void Function(StockUom model) onValid,
//     void Function()? onNotValid,
//   }) {
//     currentForm.markAllAsTouched();
//     if (currentForm.valid) {
//       onValid(model);
//     } else {
//       onNotValid?.call();
//     }
//   }
//
//   AbstractControl<dynamic> get currentForm {
//     return path == null ? form : form.control(path!);
//   }
//
//   @override
//   void updateValue(
//     StockUom? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) =>
//       form.updateValue(StockUomForm.formElements(value).rawValue,
//           updateParent: updateParent, emitEvent: emitEvent);
//
//   @override
//   void reset({
//     StockUom? value,
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) =>
//       form.reset(
//           value: value != null ? formElements(value).rawValue : null,
//           updateParent: updateParent,
//           emitEvent: emitEvent);
//
//   String pathBuilder(String? pathItem) =>
//       [path, pathItem].whereType<String>().join(".");
//
//   static FormGroup formElements(StockUom? stockUom) => FormGroup({
//         uomControlName: FormControl<String>(
//             value: stockUom?.uom,
//             validators: [],
//             asyncValidators: [],
//             asyncValidatorsDebounceTime: 250,
//             disabled: false,
//             touched: false),
//         uomRateControlName: FormControl<String>(
//             value: stockUom?.uomRate,
//             validators: [],
//             asyncValidators: [],
//             asyncValidatorsDebounceTime: 250,
//             disabled: false,
//             touched: false)
//       },
//           validators: [],
//           asyncValidators: [],
//           asyncValidatorsDebounceTime: 250,
//           disabled: false);
// }
//
// class ReactiveStockDistributionFormArrayBuilder<
//     ReactiveStockDistributionFormArrayBuilderT> extends StatelessWidget {
//   const ReactiveStockDistributionFormArrayBuilder({
//     Key? key,
//     this.control,
//     this.formControl,
//     this.builder,
//     required this.itemBuilder,
//   })  : assert(control != null || formControl != null,
//             "You have to specify `control` or `formControl`!"),
//         super(key: key);
//
//   final FormArray<ReactiveStockDistributionFormArrayBuilderT>? formControl;
//
//   final FormArray<ReactiveStockDistributionFormArrayBuilderT>? Function(
//       StockDistributionForm formModel)? control;
//
//   final Widget Function(BuildContext context, List<Widget> itemList,
//       StockDistributionForm formModel)? builder;
//
//   final Widget Function(
//       BuildContext context,
//       int i,
//       ReactiveStockDistributionFormArrayBuilderT? item,
//       StockDistributionForm formModel) itemBuilder;
//
//   @override
//   Widget build(BuildContext context) {
//     final formModel = ReactiveStockDistributionForm.of(context);
//
//     if (formModel == null) {
//       throw FormControlParentNotFoundException(this);
//     }
//
//     return ReactiveFormArray<ReactiveStockDistributionFormArrayBuilderT>(
//       formArray: formControl ?? control?.call(formModel),
//       builder: (context, formArray, child) {
//         final values = formArray.controls.map((e) => e.value).toList();
//         final itemList = values
//             .asMap()
//             .map((i, item) {
//               return MapEntry(
//                 i,
//                 itemBuilder(
//                   context,
//                   i,
//                   item,
//                   formModel,
//                 ),
//               );
//             })
//             .values
//             .toList();
//
//         return builder?.call(
//               context,
//               itemList,
//               formModel,
//             ) ??
//             Column(children: itemList);
//       },
//     );
//   }
// }
//
// class ReactiveStockDistributionFormFormGroupArrayBuilder<
//         ReactiveStockDistributionFormFormGroupArrayBuilderT>
//     extends StatelessWidget {
//   const ReactiveStockDistributionFormFormGroupArrayBuilder({
//     Key? key,
//     this.extended,
//     this.getExtended,
//     this.builder,
//     required this.itemBuilder,
//   })  : assert(extended != null || getExtended != null,
//             "You have to specify `control` or `formControl`!"),
//         super(key: key);
//
//   final ExtendedControl<List<Map<String, Object?>?>,
//       List<ReactiveStockDistributionFormFormGroupArrayBuilderT>>? extended;
//
//   final ExtendedControl<List<Map<String, Object?>?>,
//           List<ReactiveStockDistributionFormFormGroupArrayBuilderT>>
//       Function(StockDistributionForm formModel)? getExtended;
//
//   final Widget Function(BuildContext context, List<Widget> itemList,
//       StockDistributionForm formModel)? builder;
//
//   final Widget Function(
//       BuildContext context,
//       int i,
//       ReactiveStockDistributionFormFormGroupArrayBuilderT? item,
//       StockDistributionForm formModel) itemBuilder;
//
//   @override
//   Widget build(BuildContext context) {
//     final formModel = ReactiveStockDistributionForm.of(context);
//
//     if (formModel == null) {
//       throw FormControlParentNotFoundException(this);
//     }
//
//     final value = (extended ?? getExtended?.call(formModel))!;
//
//     return StreamBuilder<List<Map<String, Object?>?>?>(
//       stream: value.control.valueChanges,
//       builder: (context, snapshot) {
//         final itemList = (value.value() ??
//                 <ReactiveStockDistributionFormFormGroupArrayBuilderT>[])
//             .asMap()
//             .map((i, item) => MapEntry(
//                   i,
//                   itemBuilder(
//                     context,
//                     i,
//                     item,
//                     formModel,
//                   ),
//                 ))
//             .values
//             .toList();
//
//         return builder?.call(
//               context,
//               itemList,
//               formModel,
//             ) ??
//             Column(children: itemList);
//       },
//     );
//   }
// }
