// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file:

part of 'form_generate2.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveStockDistributionFormConsumer extends StatelessWidget {
  const ReactiveStockDistributionFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
          BuildContext context, StockDistributionForm formModel, Widget? child)
      builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveStockDistributionForm.of(context);

    if (formModel is! StockDistributionForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class StockDistributionFormInheritedStreamer
    extends InheritedStreamer<dynamic> {
  const StockDistributionFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final StockDistributionForm form;
}

class ReactiveStockDistributionForm extends StatelessWidget {
  const ReactiveStockDistributionForm({
    Key? key,
    required this.form,
    required this.child,
    this.canPop,
    this.onPopInvoked,
  }) : super(key: key);

  final Widget child;

  final StockDistributionForm form;

  final bool Function(FormGroup formGroup)? canPop;

  final void Function(FormGroup formGroup, bool didPop)? onPopInvoked;

  static StockDistributionForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
              StockDistributionFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        StockDistributionFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as StockDistributionFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return StockDistributionFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: ReactiveFormPopScope(
        canPop: canPop,
        onPopInvoked: onPopInvoked,
        child: child,
      ),
    );
  }
}

extension ReactiveReactiveStockDistributionFormExt on BuildContext {
  StockDistributionForm? stockDistributionFormWatch() =>
      ReactiveStockDistributionForm.of(this);

  StockDistributionForm? stockDistributionFormRead() =>
      ReactiveStockDistributionForm.of(this, listen: false);
}

class StockDistributionFormBuilder extends StatefulWidget {
  const StockDistributionFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.canPop,
    this.onPopInvoked,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final StockDistribution? model;

  final Widget? child;

  final bool Function(FormGroup formGroup)? canPop;

  final void Function(FormGroup formGroup, bool didPop)? onPopInvoked;

  final Widget Function(
          BuildContext context, StockDistributionForm formModel, Widget? child)
      builder;

  final void Function(BuildContext context, StockDistributionForm formModel)?
      initState;

  @override
  _StockDistributionFormBuilderState createState() =>
      _StockDistributionFormBuilderState();
}

class _StockDistributionFormBuilderState
    extends State<StockDistributionFormBuilder> {
  late StockDistributionForm _formModel;

  @override
  void initState() {
    _formModel = StockDistributionForm(
        StockDistributionForm.formElements(widget.model), null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant StockDistributionFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel.updateValue(widget.model);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _formModel.form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ReactiveValueListenableBuilder;
    ReactiveFormFieldBuilder;
    ReactiveListenableWidgetBuilder;
    ReactiveFormConsumerBuilder;
    return ReactiveStockDistributionForm(
      key: ObjectKey(_formModel),
      form: _formModel,
      // canPop: widget.canPop,
      // onPopInvoked: widget.onPopInvoked,
      child: ReactiveFormBuilder(
        form: () => _formModel.form,
        canPop: widget.canPop,
        onPopInvoked: widget.onPopInvoked,
        builder: (context, formGroup, child) =>
            widget.builder(context, _formModel, widget.child),
        child: widget.child,
      ),
    );
  }
}

class StockDistributionForm implements FormModel<StockDistribution> {
  StockDistributionForm(
    this.form,
    this.path,
  );

  static const String stockItemsControlName = "stockItems";

  final FormGroup form;

  final String? path;

  final Map<String, bool> _disabled = {};

  String stockItemsControlPath() => pathBuilder(stockItemsControlName);

  List<RepeatedStockItem> get _stockItemsValue =>
      stockItemsRepeatedStockItemForm.map((e) => e.model).toList();

  bool get containsStockItems {
    try {
      form.control(stockItemsControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Map<String, Object> get stockItemsErrors => stockItemsControl.errors;

  void get stockItemsFocus => form.focus(stockItemsControlPath());

  void stockItemsValueUpdate(
    List<RepeatedStockItem> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final localValue = (value);
    if (localValue.isEmpty) {
      stockItemsClear(updateParent: updateParent, emitEvent: emitEvent);

      return;
    }

    final toUpdate = <RepeatedStockItem>[];
    final toAdd = <RepeatedStockItem>[];

    localValue.asMap().forEach((k, v) {
      final values = (stockItemsControl.controls).map((e) => e.value).toList();

      if (stockItemsRepeatedStockItemForm.asMap().containsKey(k) &&
          values.asMap().containsKey(k)) {
        toUpdate.add(v);
      } else {
        toAdd.add(v);
      }
    });

    if (toUpdate.isNotEmpty) {
      stockItemsControl.updateValue(
          toUpdate
              .map((e) => RepeatedStockItemForm.formElements(e).rawValue)
              .toList(),
          updateParent: updateParent,
          emitEvent: emitEvent);
    }

    if (toAdd.isNotEmpty) {
      toAdd.forEach((e) {
        stockItemsControl.add(RepeatedStockItemForm.formElements(e),
            updateParent: updateParent, emitEvent: emitEvent);
      });
    }
  }

  void stockItemsInsert(
    int i,
    RepeatedStockItem value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final values = (stockItemsControl.controls).map((e) => e.value).toList();
    if (values.length < i) {
      addStockItemsItem(value);
      return;
    }

    stockItemsControl.insert(
      i,
      RepeatedStockItemForm.formElements(value),
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void stockItemsClear({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    stockItemsRepeatedStockItemForm.clear();
    stockItemsControl.clear(updateParent: updateParent, emitEvent: emitEvent);
  }

  void stockItemsValuePatch(
    List<RepeatedStockItem> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final keys = stockItemsRepeatedStockItemForm.asMap().keys;

    final toPatch = <RepeatedStockItem>[];
    (value).asMap().forEach(
      (k, v) {
        if (keys.contains(k)) {
          toPatch.add(v);
        }
      },
    );

    stockItemsControl.patchValue(
        toPatch
            .map((e) => RepeatedStockItemForm.formElements(e).rawValue)
            .toList(),
        updateParent: updateParent,
        emitEvent: emitEvent);
  }

  void stockItemsValueReset(
    List<RepeatedStockItem> value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      stockItemsControl.reset(
          value: value
              .map((e) => RepeatedStockItemForm.formElements(e).rawValue)
              .toList(),
          updateParent: updateParent,
          emitEvent: emitEvent);

  FormArray<Map<String, Object?>> get stockItemsControl =>
      form.control(stockItemsControlPath()) as FormArray<Map<String, Object?>>;

  List<RepeatedStockItemForm> get stockItemsRepeatedStockItemForm {
    final values = (stockItemsControl.controls).map((e) => e.value).toList();

    return values
        .asMap()
        .map((k, v) => MapEntry(
            k, RepeatedStockItemForm(form, pathBuilder("stockItems.$k"))))
        .values
        .toList();
  }

  void stockItemsSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      stockItemsControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      stockItemsControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  ExtendedControl<List<Map<String, Object?>?>, List<RepeatedStockItemForm>>
      get stockItemsExtendedControl => ExtendedControl<
              List<Map<String, Object?>?>, List<RepeatedStockItemForm>>(
          form.control(stockItemsControlPath())
              as FormArray<Map<String, Object?>>,
          () => stockItemsRepeatedStockItemForm);

  void addStockItemsItem(RepeatedStockItem value) {
    stockItemsControl.add(RepeatedStockItemForm.formElements(value));
  }

  void removeStockItemsItemAtIndex(int i) {
    if ((stockItemsControl.value ?? []).length > i) {
      stockItemsControl.removeAt(i);
    }
  }

  void addStockItemsItemList(List<RepeatedStockItem> value) {
    value.map((e) => addStockItemsItem(e));
  }

  @override
  StockDistribution get model {
    final isValid = !currentForm.hasErrors && currentForm.errors.isEmpty;

    if (!isValid) {
      debugPrintStack(
          label:
              '[${path ?? 'StockDistributionForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return StockDistribution(stockItems: _stockItemsValue);
  }

  @override
  void toggleDisabled({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final currentFormInstance = currentForm;

    if (currentFormInstance is! FormGroup) {
      return;
    }

    if (_disabled.isEmpty) {
      currentFormInstance.controls.forEach((key, control) {
        _disabled[key] = control.disabled;
      });

      stockItemsRepeatedStockItemForm.forEach((e) => e.toggleDisabled());

      currentForm.markAsDisabled(
          updateParent: updateParent, emitEvent: emitEvent);
    } else {
      stockItemsRepeatedStockItemForm.forEach((e) => e.toggleDisabled());

      currentFormInstance.controls.forEach((key, control) {
        if (_disabled[key] == false) {
          currentFormInstance.controls[key]?.markAsEnabled(
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }

        _disabled.remove(key);
      });
    }
  }

  @override
  void submit({
    required void Function(StockDistribution model) onValid,
    void Function()? onNotValid,
  }) {
    currentForm.markAllAsTouched();
    if (currentForm.valid) {
      onValid(model);
    } else {
      onNotValid?.call();
    }
  }

  AbstractControl<dynamic> get currentForm {
    return path == null ? form : form.control(path!);
  }

  @override
  void updateValue(
    StockDistribution? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(StockDistributionForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);

  @override
  void reset({
    StockDistribution? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);

  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");

  static FormGroup formElements(StockDistribution? stockDistribution) =>
      FormGroup({
        stockItemsControlName: FormArray(
            (stockDistribution?.stockItems ?? [])
                .map((e) => RepeatedStockItemForm.formElements(e))
                .toList(),
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class RepeatedStockItemForm implements FormModel<RepeatedStockItem> {
  RepeatedStockItemForm(
    this.form,
    this.path,
  );

  static const String receivedControlName = "received";

  final FormGroup form;

  final String? path;

  final Map<String, bool> _disabled = {};

  String receivedControlPath() => pathBuilder(receivedControlName);

  int get _receivedValue => receivedControl.value as int;

  bool get containsReceived {
    try {
      form.control(receivedControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Map<String, Object> get receivedErrors => receivedControl.errors;

  void get receivedFocus => form.focus(receivedControlPath());

  void receivedValueUpdate(
    int value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    receivedControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void receivedValuePatch(
    int value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    receivedControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void receivedValueReset(
    int value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      receivedControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  FormControl<int> get receivedControl =>
      form.control(receivedControlPath()) as FormControl<int>;

  void receivedSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      receivedControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      receivedControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  RepeatedStockItem get model {
    final isValid = !currentForm.hasErrors && currentForm.errors.isEmpty;

    if (!isValid) {
      debugPrintStack(
          label:
              '[${path ?? 'RepeatedStockItemForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return RepeatedStockItem(received: _receivedValue);
  }

  @override
  void toggleDisabled({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final currentFormInstance = currentForm;

    if (currentFormInstance is! FormGroup) {
      return;
    }

    if (_disabled.isEmpty) {
      currentFormInstance.controls.forEach((key, control) {
        _disabled[key] = control.disabled;
      });

      currentForm.markAsDisabled(
          updateParent: updateParent, emitEvent: emitEvent);
    } else {
      currentFormInstance.controls.forEach((key, control) {
        if (_disabled[key] == false) {
          currentFormInstance.controls[key]?.markAsEnabled(
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }

        _disabled.remove(key);
      });
    }
  }

  @override
  void submit({
    required void Function(RepeatedStockItem model) onValid,
    void Function()? onNotValid,
  }) {
    currentForm.markAllAsTouched();
    if (currentForm.valid) {
      onValid(model);
    } else {
      onNotValid?.call();
    }
  }

  AbstractControl<dynamic> get currentForm {
    return path == null ? form : form.control(path!);
  }

  @override
  void updateValue(
    RepeatedStockItem? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(RepeatedStockItemForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);

  @override
  void reset({
    RepeatedStockItem? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);

  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");

  static FormGroup formElements(RepeatedStockItem? repeatedStockItem) =>
      FormGroup({
        receivedControlName: FormControl<int>(
            value: repeatedStockItem?.received,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class ReactiveStockDistributionFormArrayBuilder<
    ReactiveStockDistributionFormArrayBuilderT> extends StatelessWidget {
  const ReactiveStockDistributionFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<ReactiveStockDistributionFormArrayBuilderT>? formControl;

  final FormArray<ReactiveStockDistributionFormArrayBuilderT>? Function(
      StockDistributionForm formModel)? control;

  final Widget Function(BuildContext context, List<Widget> itemList,
      StockDistributionForm formModel)? builder;

  final Widget Function(
      BuildContext context,
      int i,
      ReactiveStockDistributionFormArrayBuilderT? item,
      StockDistributionForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveStockDistributionForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    return ReactiveFormArray<ReactiveStockDistributionFormArrayBuilderT>(
      formArray: formControl ?? control?.call(formModel),
      builder: (context, formArray, child) {
        final values = formArray.controls.map((e) => e.value).toList();
        final itemList = values
            .asMap()
            .map((i, item) {
              return MapEntry(
                i,
                itemBuilder(
                  context,
                  i,
                  item,
                  formModel,
                ),
              );
            })
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}

class ReactiveStockDistributionFormFormGroupArrayBuilder<
        ReactiveStockDistributionFormFormGroupArrayBuilderT>
    extends StatelessWidget {
  const ReactiveStockDistributionFormFormGroupArrayBuilder({
    Key? key,
    this.extended,
    this.getExtended,
    this.builder,
    required this.itemBuilder,
  })  : assert(extended != null || getExtended != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final ExtendedControl<List<Map<String, Object?>?>,
      List<ReactiveStockDistributionFormFormGroupArrayBuilderT>>? extended;

  final ExtendedControl<List<Map<String, Object?>?>,
          List<ReactiveStockDistributionFormFormGroupArrayBuilderT>>
      Function(StockDistributionForm formModel)? getExtended;

  final Widget Function(BuildContext context, List<Widget> itemList,
      StockDistributionForm formModel)? builder;

  final Widget Function(
      BuildContext context,
      int i,
      ReactiveStockDistributionFormFormGroupArrayBuilderT? item,
      StockDistributionForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveStockDistributionForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList = (value.value() ??
                <ReactiveStockDistributionFormFormGroupArrayBuilderT>[])
            .asMap()
            .map((i, item) => MapEntry(
                  i,
                  itemBuilder(
                    context,
                    i,
                    item,
                    formModel,
                  ),
                ))
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}
