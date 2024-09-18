// import 'package:mass_pro/data_run/form_reactive/form_model/form_generate.dart';
// import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
//
// class ReactiveDeliveryListFormConsumer extends StatelessWidget {
//   const ReactiveDeliveryListFormConsumer({
//     Key? key,
//     required this.builder,
//     this.child,
//   }) : super(key: key);
//
//   final Widget? child;
//
//   final Widget Function(
//       BuildContext context, DeliveryListForm formModel, Widget? child) builder;
//
//   @override
//   Widget build(BuildContext context) {
//     final formModel = ReactiveDeliveryListForm.of(context);
//
//     if (formModel is! DeliveryListForm) {
//       throw FormControlParentNotFoundException(this);
//     }
//     return builder(context, formModel, child);
//   }
// }
//
// class DeliveryListFormInheritedStreamer extends InheritedStreamer<dynamic> {
//   const DeliveryListFormInheritedStreamer({
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
//   final DeliveryListForm form;
// }
//
// class ReactiveDeliveryListForm extends StatelessWidget {
//   const ReactiveDeliveryListForm({
//     Key? key,
//     required this.form,
//     required this.child,
//     this.canPop,
//     this.onPopInvoked,
//   }) : super(key: key);
//
//   final Widget child;
//
//   final DeliveryListForm form;
//
//   final bool Function(FormGroup formGroup)? canPop;
//
//   final void Function(FormGroup formGroup, bool didPop)? onPopInvoked;
//
//   static DeliveryListForm? of(
//     BuildContext context, {
//     bool listen = true,
//   }) {
//     if (listen) {
//       return context
//           .dependOnInheritedWidgetOfExactType<
//               DeliveryListFormInheritedStreamer>()
//           ?.form;
//     }
//
//     final element = context.getElementForInheritedWidgetOfExactType<
//         DeliveryListFormInheritedStreamer>();
//     return element == null
//         ? null
//         : (element.widget as DeliveryListFormInheritedStreamer).form;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return DeliveryListFormInheritedStreamer(
//       form: form,
//       stream: form.form.statusChanged,
//       child: ReactiveFormPopScope(
//         canPop: canPop,
//         onPopInvoked: onPopInvoked,
//         child: child,
//       ),
//     );
//   }
// }
//
// extension ReactiveReactiveDeliveryListFormExt on BuildContext {
//   DeliveryListForm? deliveryListFormWatch() =>
//       ReactiveDeliveryListForm.of(this);
//
//   DeliveryListForm? deliveryListFormRead() =>
//       ReactiveDeliveryListForm.of(this, listen: false);
// }
//
// class DeliveryListFormBuilder extends StatefulWidget {
//   const DeliveryListFormBuilder({
//     Key? key,
//     this.model,
//     this.child,
//     this.canPop,
//     this.onPopInvoked,
//     required this.builder,
//     this.initState,
//   }) : super(key: key);
//
//   final DeliveryList? model;
//
//   final Widget? child;
//
//   final bool Function(FormGroup formGroup)? canPop;
//
//   final void Function(FormGroup formGroup, bool didPop)? onPopInvoked;
//
//   final Widget Function(
//       BuildContext context, DeliveryListForm formModel, Widget? child) builder;
//
//   final void Function(BuildContext context, DeliveryListForm formModel)?
//       initState;
//
//   @override
//   _DeliveryListFormBuilderState createState() =>
//       _DeliveryListFormBuilderState();
// }
//
// class _DeliveryListFormBuilderState extends State<DeliveryListFormBuilder> {
//   late DeliveryListForm _formModel;
//
//   @override
//   void initState() {
//     _formModel =
//         DeliveryListForm(DeliveryListForm.formElements(widget.model), null);
//
//     if (_formModel.form.disabled) {
//       _formModel.form.markAsDisabled();
//     }
//
//     widget.initState?.call(context, _formModel);
//
//     super.initState();
//   }
//
//   @override
//   void didUpdateWidget(covariant DeliveryListFormBuilder oldWidget) {
//     if (widget.model != oldWidget.model) {
//       _formModel.updateValue(widget.model);
//     }
//
//     super.didUpdateWidget(oldWidget);
//   }
//
//   @override
//   void dispose() {
//     _formModel.form.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ReactiveDeliveryListForm(
//       key: ObjectKey(_formModel),
//       form: _formModel,
//       // canPop: widget.canPop,
//       // onPopInvoked: widget.onPopInvoked,
//       child: ReactiveFormBuilder(
//         form: () => _formModel.form,
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
// class DeliveryListForm implements FormModel<DeliveryList> {
//   DeliveryListForm(
//     this.form,
//     this.path,
//   );
//
//   static const String deliveryListControlName = "deliveryList";
//
//   final FormGroup form;
//
//   final String? path;
//
//   final Map<String, bool> _disabled = {};
//
//   String deliveryListControlPath() => pathBuilder(deliveryListControlName);
//
//   List<DeliveryPoint> get _deliveryListValue =>
//       deliveryListDeliveryPointForm.map((e) => e.model).toList();
//
//   bool get containsDeliveryList {
//     try {
//       form.control(deliveryListControlPath());
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   Map<String, Object> get deliveryListErrors => deliveryListControl.errors;
//
//   void get deliveryListFocus => form.focus(deliveryListControlPath());
//
//   void deliveryListValueUpdate(
//     List<DeliveryPoint> value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     final localValue = (value);
//     if (localValue.isEmpty) {
//       deliveryListClear(updateParent: updateParent, emitEvent: emitEvent);
//
//       return;
//     }
//
//     final toUpdate = <DeliveryPoint>[];
//     final toAdd = <DeliveryPoint>[];
//
//     localValue.asMap().forEach((k, v) {
//       final values =
//           (deliveryListControl.controls).map((e) => e.value).toList();
//
//       if (deliveryListDeliveryPointForm.asMap().containsKey(k) &&
//           values.asMap().containsKey(k)) {
//         toUpdate.add(v);
//       } else {
//         toAdd.add(v);
//       }
//     });
//
//     if (toUpdate.isNotEmpty) {
//       deliveryListControl.updateValue(
//           toUpdate
//               .map((e) => DeliveryPointForm.formElements(e).rawValue)
//               .toList(),
//           updateParent: updateParent,
//           emitEvent: emitEvent);
//     }
//
//     if (toAdd.isNotEmpty) {
//       toAdd.forEach((e) {
//         deliveryListControl.add(DeliveryPointForm.formElements(e),
//             updateParent: updateParent, emitEvent: emitEvent);
//       });
//     }
//   }
//
//   void deliveryListInsert(
//     int i,
//     DeliveryPoint value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     final values = (deliveryListControl.controls).map((e) => e.value).toList();
//     if (values.length < i) {
//       addDeliveryListItem(value);
//       return;
//     }
//
//     deliveryListControl.insert(
//       i,
//       DeliveryPointForm.formElements(value),
//       updateParent: updateParent,
//       emitEvent: emitEvent,
//     );
//   }
//
//   void deliveryListClear({
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     deliveryListDeliveryPointForm.clear();
//     deliveryListControl.clear(updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   void deliveryListValuePatch(
//     List<DeliveryPoint> value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     final keys = deliveryListDeliveryPointForm.asMap().keys;
//
//     final toPatch = <DeliveryPoint>[];
//     (value).asMap().forEach(
//       (k, v) {
//         if (keys.contains(k)) {
//           toPatch.add(v);
//         }
//       },
//     );
//
//     deliveryListControl.patchValue(
//         toPatch.map((e) => DeliveryPointForm.formElements(e).rawValue).toList(),
//         updateParent: updateParent,
//         emitEvent: emitEvent);
//   }
//
//   void deliveryListValueReset(
//     List<DeliveryPoint> value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//     bool removeFocus = false,
//     bool? disabled,
//   }) =>
//       deliveryListControl.reset(
//           value: value
//               .map((e) => DeliveryPointForm.formElements(e).rawValue)
//               .toList(),
//           updateParent: updateParent,
//           emitEvent: emitEvent);
//
//   FormArray<Map<String, Object?>> get deliveryListControl =>
//       form.control(deliveryListControlPath())
//           as FormArray<Map<String, Object?>>;
//
//   List<DeliveryPointForm> get deliveryListDeliveryPointForm {
//     final values = (deliveryListControl.controls).map((e) => e.value).toList();
//
//     return values
//         .asMap()
//         .map((k, v) => MapEntry(
//             k, DeliveryPointForm(form, pathBuilder("deliveryList.$k"))))
//         .values
//         .toList();
//   }
//
//   void deliveryListSetDisabled(
//     bool disabled, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     if (disabled) {
//       deliveryListControl.markAsDisabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     } else {
//       deliveryListControl.markAsEnabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     }
//   }
//
//   ExtendedControl<List<Map<String, Object?>?>, List<DeliveryPointForm>>
//       get deliveryListExtendedControl =>
//           ExtendedControl<List<Map<String, Object?>?>, List<DeliveryPointForm>>(
//               form.control(deliveryListControlPath())
//                   as FormArray<Map<String, Object?>>,
//               () => deliveryListDeliveryPointForm);
//
//   void addDeliveryListItem(DeliveryPoint value) {
//     deliveryListControl.add(DeliveryPointForm.formElements(value));
//   }
//
//   void removeDeliveryListItemAtIndex(int i) {
//     if ((deliveryListControl.value ?? []).length > i) {
//       deliveryListControl.removeAt(i);
//     }
//   }
//
//   void addDeliveryListItemList(List<DeliveryPoint> value) {
//     value.map((e) => addDeliveryListItem(e));
//   }
//
//   @override
//   DeliveryList get model {
//     final isValid = !currentForm.hasErrors && currentForm.errors.isEmpty;
//
//     if (!isValid) {
//       debugPrintStack(
//           label:
//               '[${path ?? 'DeliveryListForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
//     }
//     return DeliveryList(deliveryList: _deliveryListValue);
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
//       deliveryListDeliveryPointForm.forEach((e) => e.toggleDisabled());
//
//       currentForm.markAsDisabled(
//           updateParent: updateParent, emitEvent: emitEvent);
//     } else {
//       deliveryListDeliveryPointForm.forEach((e) => e.toggleDisabled());
//
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
//     required void Function(DeliveryList model) onValid,
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
//     DeliveryList? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) =>
//       form.updateValue(DeliveryListForm.formElements(value).rawValue,
//           updateParent: updateParent, emitEvent: emitEvent);
//
//   @override
//   void reset({
//     DeliveryList? value,
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
//   static FormGroup formElements(DeliveryList? deliveryList) => FormGroup({
//         deliveryListControlName: FormArray(
//             (deliveryList?.deliveryList ?? [])
//                 .map((e) => DeliveryPointForm.formElements(e))
//                 .toList(),
//             validators: [],
//             asyncValidators: [],
//             asyncValidatorsDebounceTime: 250,
//             disabled: false)
//       },
//           validators: [],
//           asyncValidators: [],
//           asyncValidatorsDebounceTime: 250,
//           disabled: false);
// }
//
// class DeliveryPointForm implements FormModel<DeliveryPoint> {
//   DeliveryPointForm(
//     this.form,
//     this.path,
//   );
//
//   static const String nameControlName = "name";
//
//   static const String addressControlName = "address";
//
//   final FormGroup form;
//
//   final String? path;
//
//   final Map<String, bool> _disabled = {};
//
//   String nameControlPath() => pathBuilder(nameControlName);
//
//   String addressControlPath() => pathBuilder(addressControlName);
//
//   String get _nameValue => nameControl.value ?? "";
//
//   Address? get _addressValue => addressForm.model;
//
//   bool get containsName {
//     try {
//       form.control(nameControlPath());
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   bool get containsAddress {
//     try {
//       form.control(addressControlPath());
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   Map<String, Object> get nameErrors => nameControl.errors;
//
//   Map<String, Object>? get addressErrors => addressControl?.errors;
//
//   void get nameFocus => form.focus(nameControlPath());
//
//   void get addressFocus => form.focus(addressControlPath());
//
//   void addressRemove({
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     if (containsAddress) {
//       final controlPath = path;
//       if (controlPath == null) {
//         form.removeControl(
//           addressControlName,
//           updateParent: updateParent,
//           emitEvent: emitEvent,
//         );
//       } else {
//         final formGroup = form.control(controlPath);
//
//         if (formGroup is FormGroup) {
//           formGroup.removeControl(
//             addressControlName,
//             updateParent: updateParent,
//             emitEvent: emitEvent,
//           );
//         }
//       }
//     }
//   }
//
//   void nameValueUpdate(
//     String value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     nameControl.updateValue(value,
//         updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   void addressValueUpdate(
//     Address? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     addressControl?.updateValue(AddressForm.formElements(value).rawValue,
//         updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   void nameValuePatch(
//     String value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     nameControl.patchValue(value,
//         updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   void addressValuePatch(
//     Address? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     addressControl?.updateValue(AddressForm.formElements(value).rawValue,
//         updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   void nameValueReset(
//     String value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//     bool removeFocus = false,
//     bool? disabled,
//   }) =>
//       nameControl.reset(
//           value: value, updateParent: updateParent, emitEvent: emitEvent);
//
//   void addressValueReset(
//     Address? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//     bool removeFocus = false,
//     bool? disabled,
//   }) =>
//       addressControl?.reset(
//           value: AddressForm.formElements(value).rawValue,
//           updateParent: updateParent,
//           emitEvent: emitEvent);
//
//   FormControl<String> get nameControl =>
//       form.control(nameControlPath()) as FormControl<String>;
//
//   FormGroup? get addressControl =>
//       containsAddress ? form.control(addressControlPath()) as FormGroup? : null;
//
//   AddressForm get addressForm => AddressForm(form, pathBuilder('address'));
//
//   void nameSetDisabled(
//     bool disabled, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     if (disabled) {
//       nameControl.markAsDisabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     } else {
//       nameControl.markAsEnabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     }
//   }
//
//   void addressSetDisabled(
//     bool disabled, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     if (disabled) {
//       addressControl?.markAsDisabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     } else {
//       addressControl?.markAsEnabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     }
//   }
//
//   @override
//   DeliveryPoint get model {
//     final isValid = !currentForm.hasErrors && currentForm.errors.isEmpty;
//
//     if (!isValid) {
//       debugPrintStack(
//           label:
//               '[${path ?? 'DeliveryPointForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
//     }
//     return DeliveryPoint(name: _nameValue, address: _addressValue);
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
//       addressForm.toggleDisabled();
//       currentForm.markAsDisabled(
//           updateParent: updateParent, emitEvent: emitEvent);
//     } else {
//       addressForm.toggleDisabled();
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
//     required void Function(DeliveryPoint model) onValid,
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
//     DeliveryPoint? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) =>
//       form.updateValue(DeliveryPointForm.formElements(value).rawValue,
//           updateParent: updateParent, emitEvent: emitEvent);
//
//   @override
//   void reset({
//     DeliveryPoint? value,
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
//   static FormGroup formElements(DeliveryPoint? deliveryPoint) => FormGroup({
//         nameControlName: FormControl<String>(
//             value: deliveryPoint?.name,
//             validators: const [RequiredValidator()],
//             asyncValidators: [],
//             asyncValidatorsDebounceTime: 250,
//             disabled: false,
//             touched: false),
//         addressControlName: AddressForm.formElements(deliveryPoint?.address)
//       },
//           validators: [],
//           asyncValidators: [],
//           asyncValidatorsDebounceTime: 250,
//           disabled: false);
// }
//
// class AddressForm implements FormModel<Address> {
//   AddressForm(
//     this.form,
//     this.path,
//   );
//
//   static const String streetControlName = "street";
//
//   static const String cityControlName = "city";
//
//   final FormGroup form;
//
//   final String? path;
//
//   final Map<String, bool> _disabled = {};
//
//   String streetControlPath() => pathBuilder(streetControlName);
//
//   String cityControlPath() => pathBuilder(cityControlName);
//
//   String? get _streetValue => streetControl?.value;
//
//   String? get _cityValue => cityControl?.value;
//
//   bool get containsStreet {
//     try {
//       form.control(streetControlPath());
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   bool get containsCity {
//     try {
//       form.control(cityControlPath());
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
//
//   Map<String, Object>? get streetErrors => streetControl?.errors;
//
//   Map<String, Object>? get cityErrors => cityControl?.errors;
//
//   void get streetFocus => form.focus(streetControlPath());
//
//   void get cityFocus => form.focus(cityControlPath());
//
//   void streetRemove({
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     if (containsStreet) {
//       final controlPath = path;
//       if (controlPath == null) {
//         form.removeControl(
//           streetControlName,
//           updateParent: updateParent,
//           emitEvent: emitEvent,
//         );
//       } else {
//         final formGroup = form.control(controlPath);
//
//         if (formGroup is FormGroup) {
//           formGroup.removeControl(
//             streetControlName,
//             updateParent: updateParent,
//             emitEvent: emitEvent,
//           );
//         }
//       }
//     }
//   }
//
//   void cityRemove({
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     if (containsCity) {
//       final controlPath = path;
//       if (controlPath == null) {
//         form.removeControl(
//           cityControlName,
//           updateParent: updateParent,
//           emitEvent: emitEvent,
//         );
//       } else {
//         final formGroup = form.control(controlPath);
//
//         if (formGroup is FormGroup) {
//           formGroup.removeControl(
//             cityControlName,
//             updateParent: updateParent,
//             emitEvent: emitEvent,
//           );
//         }
//       }
//     }
//   }
//
//   void streetValueUpdate(
//     String? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     streetControl?.updateValue(value,
//         updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   void cityValueUpdate(
//     String? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     cityControl?.updateValue(value,
//         updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   void streetValuePatch(
//     String? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     streetControl?.patchValue(value,
//         updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   void cityValuePatch(
//     String? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     cityControl?.patchValue(value,
//         updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   void streetValueReset(
//     String? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//     bool removeFocus = false,
//     bool? disabled,
//   }) =>
//       streetControl?.reset(
//           value: value, updateParent: updateParent, emitEvent: emitEvent);
//
//   void cityValueReset(
//     String? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//     bool removeFocus = false,
//     bool? disabled,
//   }) =>
//       cityControl?.reset(
//           value: value, updateParent: updateParent, emitEvent: emitEvent);
//
//   FormControl<String>? get streetControl => containsStreet
//       ? form.control(streetControlPath()) as FormControl<String>?
//       : null;
//
//   FormControl<String>? get cityControl => containsCity
//       ? form.control(cityControlPath()) as FormControl<String>?
//       : null;
//
//   void streetSetDisabled(
//     bool disabled, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     if (disabled) {
//       streetControl?.markAsDisabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     } else {
//       streetControl?.markAsEnabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     }
//   }
//
//   void citySetDisabled(
//     bool disabled, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     if (disabled) {
//       cityControl?.markAsDisabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     } else {
//       cityControl?.markAsEnabled(
//         updateParent: updateParent,
//         emitEvent: emitEvent,
//       );
//     }
//   }
//
//   @override
//   Address get model {
//     final isValid = !currentForm.hasErrors && currentForm.errors.isEmpty;
//
//     if (!isValid) {
//       debugPrintStack(
//           label:
//               '[${path ?? 'AddressForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
//     }
//     return Address(street: _streetValue, city: _cityValue);
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
//     required void Function(Address model) onValid,
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
//     Address? value, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) =>
//       form.updateValue(AddressForm.formElements(value).rawValue,
//           updateParent: updateParent, emitEvent: emitEvent);
//
//   @override
//   void reset({
//     Address? value,
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
//   static FormGroup formElements(Address? address) => FormGroup({
//         streetControlName: FormControl<String>(
//             value: address?.street,
//             validators: const [RequiredValidator()],
//             asyncValidators: [],
//             asyncValidatorsDebounceTime: 250,
//             disabled: false,
//             touched: false),
//         cityControlName: FormControl<String>(
//             value: address?.city,
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
// class ReactiveDeliveryListFormArrayBuilder<
//     ReactiveDeliveryListFormArrayBuilderT> extends StatelessWidget {
//   const ReactiveDeliveryListFormArrayBuilder({
//     Key? key,
//     this.control,
//     this.formControl,
//     this.builder,
//     required this.itemBuilder,
//   })  : assert(control != null || formControl != null,
//             "You have to specify `control` or `formControl`!"),
//         super(key: key);
//
//   final FormArray<ReactiveDeliveryListFormArrayBuilderT>? formControl;
//
//   final FormArray<ReactiveDeliveryListFormArrayBuilderT>? Function(
//       DeliveryListForm formModel)? control;
//
//   final Widget Function(BuildContext context, List<Widget> itemList,
//       DeliveryListForm formModel)? builder;
//
//   final Widget Function(
//       BuildContext context,
//       int i,
//       ReactiveDeliveryListFormArrayBuilderT? item,
//       DeliveryListForm formModel) itemBuilder;
//
//   @override
//   Widget build(BuildContext context) {
//     final formModel = ReactiveDeliveryListForm.of(context);
//
//     if (formModel == null) {
//       throw FormControlParentNotFoundException(this);
//     }
//
//     return ReactiveFormArray<ReactiveDeliveryListFormArrayBuilderT>(
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
// class ReactiveDeliveryListFormFormGroupArrayBuilder<
//     ReactiveDeliveryListFormFormGroupArrayBuilderT> extends StatelessWidget {
//   const ReactiveDeliveryListFormFormGroupArrayBuilder({
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
//       List<ReactiveDeliveryListFormFormGroupArrayBuilderT>>? extended;
//
//   final ExtendedControl<List<Map<String, Object?>?>,
//           List<ReactiveDeliveryListFormFormGroupArrayBuilderT>>
//       Function(DeliveryListForm formModel)? getExtended;
//
//   final Widget Function(BuildContext context, List<Widget> itemList,
//       DeliveryListForm formModel)? builder;
//
//   final Widget Function(
//       BuildContext context,
//       int i,
//       ReactiveDeliveryListFormFormGroupArrayBuilderT? item,
//       DeliveryListForm formModel) itemBuilder;
//
//   @override
//   Widget build(BuildContext context) {
//     final formModel = ReactiveDeliveryListForm.of(context);
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
//                 <ReactiveDeliveryListFormFormGroupArrayBuilderT>[])
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
