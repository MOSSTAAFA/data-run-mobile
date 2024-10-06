part of 'form_element.dart';

class RepeatInstance extends SectionElement<List<Map<String, Object?>?>> {
  RepeatInstance({
    required super.template,
    required super.form,
    super.expanded = false,
    List<RepeatItemInstance> elements = const []
  }) {
    this._elements.addAll(elements);
    addAll(elements);

    // if (properties.disabled) {
    //   markAsDisabled();
    // }
    //
    // if (properties.hidden) {
    //   markAsHidden();
    // }
  }

  final List<FormElementInstance<Map<String, Object?>?>> _elements = [];

  /// Gets the list of child elements.
  List<FormElementInstance<Map<String, Object?>?>> get elements =>
      List.unmodifiable(_elements);

  //<editor-fold desc="Value">
  @override
  List<Map<String, Object?>?> get rawValue => elementControl.rawValue;

  //</editor-fold>

  //<editor-fold desc="Add-Insert">
  /// Insert a new [element] at the end of the RepeatSection.
  void add(RepeatItemInstance element,
      {bool updateParent = true, bool emitEvent = true}) {
    addAll([element], emitEvent: emitEvent, updateParent: updateParent);
  }

  /// Appends all [elements] to the end of the RepeatSection.
  void addAll(List<RepeatItemInstance> elements,
      {bool updateParent = true, bool emitEvent = true}) {
    _elements.addAll(elements);
    for (final element in elements) {
      element.parentSection = this;
    }
  }

  //
  // /// build this repeated section and all its elements
  // void buildElement(List<Map<String, Object?>?>? value,
  //     {bool updateParent = true, bool emitEvent = true}) {
  //   value?.asMap().forEach((int k, Map<String, Object?>? v) {
  //     addItem(value: v);
  //   });
  // }
  //
  // void addItem({Map<String, Object?>? value}) {
  //   // // init new Section FormGroup control
  //   // final control = FromTemplateControlFactory.createSectionTemplateFormGroup(
  //   //     template,
  //   //     savedValue: value);
  //   // elementControl.add(control);
  //
  //   // init Section Instance and add it to this repeated instance
  //   final repeatItemSection =
  //       FromElementFactory.createRepeatItem(form, template, savedValue: value);
  //
  //   add(repeatItemSection);
  //   // add(repeatItemSection);
  //   // updateValueAndValidity(
  //   //   updateParent: updateParent,
  //   //   emitEvent: emitEvent,
  //   // );
  // }

  // void addItemList(List<Map<String, Object?>?> value) {
  //   value.map((e) => addItem(value: e));
  // }

  // void insert(
  //   int index,
  //   Map<String, Object?>? value, {
  //   bool updateParent = true,
  //   bool emitEvent = true,
  // }) {
  //   final List<Map<String, Object?>?> values =
  //       (elementControl.controls).map((e) => e.value).toList();
  //   if (values.length < index) {
  //     addItem(value: value);
  //     return;
  //   }
  //
  //   // init new Section FormGroup control
  //   final control = FromTemplateControlFactory.createSectionTemplateFormGroup(
  //       template,
  //       savedValue: value);
  //   elementControl.insert(index, control,
  //       updateParent: updateParent, emitEvent: emitEvent);
  //
  //   // init Section Instance and add it to this repeated instance
  //   final section = FromElementFactory.createRepeatItem(control, template);
  //   // section.buildElement(value);
  //
  //   _elements.insert(index, section);
  //   section.parentSection = this;
  // }

  // ///
  // void addRepeatSectionItem(SectionInstance value) {
  //   add(value);
  //   elementControl.add(FromElementControlFactory.createSectionControl(value));
  // }

  // void addRepeatSectionItemList(List<SectionInstance> value) {
  //   value.map((e) => addRepeatSectionItem(e));
  // }

  // void insert(
  //   int index,
  //   SectionInstance element, {
  //   bool updateParent = true,
  //   bool emitEvent = true,
  // }) {
  //   _elements.insert(index, element);
  //   element.parentSection = this;
  //
  //   updateValueAndValidity(
  //     emitEvent: emitEvent,
  //     updateParent: updateParent,
  //   );
  //
  //   // if (emitEvent) {
  //   //   emitsCollectionChanged(_controls);
  //   // }
  // }

  //</editor-fold>

  //<editor-fold desc="Remove, Clear">

  /// new remove

  // void removeAt(int i) {
  //   if ((elementControl.value ?? []).length > i) {
  //     elementControl.removeAt(i);
  //     removeAt(i);
  //   }
  // }

  /// Removes and returns the child element at the given [index].
  void remove(
    FormElementInstance<Map<String, Object?>?> element, {
    bool emitEvent = true,
    bool updateParent = true,
  }) {
    final index = _elements.indexOf(element);
    if (index == -1) {
      throw FormControlNotFoundException();
    }
    removeAt(index, emitEvent: emitEvent, updateParent: updateParent);
  }

  FormElementInstance<Map<String, Object?>?> removeAt(
    int index, {
    bool emitEvent = true,
    bool updateParent = true,
  }) {
    // if (elements.length > index) {
    final removedElement = _elements.removeAt(index);
    removedElement.parentSection = null;
    elementControl.removeAt(index,
        updateParent: updateParent, emitEvent: emitEvent);
    return removedElement;
    // } else {
    //
    // }

    // updateValueAndValidity(
    //   emitEvent: emitEvent,
    //   updateParent: updateParent,
    // );

    // if (emitEvent) {
    //   emitsCollectionChanged(_controls);
    // }

    // return removedElement;
  }

  /// Removes all children elements from the repeatSection.
  void clear({bool emitEvent = true, bool updateParent = true}) {
    forEachChild((element) => element.parentSection = null);
    _elements.clear();

    elementControl.clear(updateParent: updateParent, emitEvent: emitEvent);

    // updateValueAndValidity(
    //   emitEvent: emitEvent,
    //   updateParent: updateParent,
    // );

    // if (emitEvent) {
    //   emitsCollectionChanged(_controls);
    // }
  }

  // void clearElement({
  //   bool updateParent = true,
  //   bool emitEvent = true,
  // }) {
  //   // repeatedSectionItems.clear();
  //   clear(updateParent: updateParent, emitEvent: emitEvent);
  //   elementControl.clear(updateParent: updateParent, emitEvent: emitEvent);
  // }

  // void reset({
  //   List<Map<String, Object?>?>? value,
  //   bool updateParent = true,
  //   bool emitEvent = true,
  //   bool removeFocus = false,
  //   bool? disabled,
  // }) {
  //   elementControl.markAsPristine(updateParent: updateParent);
  //   elementControl.markAsUntouched(updateParent: updateParent);
  //
  //   updateValue(value, updateParent: updateParent, emitEvent: emitEvent);
  //
  //   if (disabled != null) {
  //     disabled
  //         ? markAsDisabled(updateParent: true, emitEvent: false)
  //         : markAsEnabled(updateParent: true, emitEvent: false);
  //   }
  //
  //   if (removeFocus) {
  //     unfocus(touched: false);
  //   }
  // }

  // @override
  // void reset({
  //   List<Map<String, Object?>?>? value,
  //   bool? disabled,
  //   bool? hidden, // implement hidden if not triggered
  //   bool updateParent = true,
  //   bool emitEvent = true,
  // }) =>
  //     elementControl.reset(
  //         value: value,
  //         updateParent: updateParent,
  //         emitEvent: emitEvent,
  //         disabled: disabled);

  // void repeatSectionSetDisabled(
  //     bool disabled, {
  //       bool updateParent = true,
  //       bool emitEvent = true,
  //     }) {
  //   if (disabled) {
  //     markAsDisabled(updateParent: updateParent, emitEvent: emitEvent);
  //     elementControl.markAsDisabled(
  //       updateParent: updateParent,
  //       emitEvent: emitEvent,
  //     );
  //   } else {
  //     markAsEnabled(
  //       updateParent: updateParent,
  //       emitEvent: emitEvent,
  //     );
  //     elementControl.markAsEnabled(
  //       updateParent: updateParent,
  //       emitEvent: emitEvent,
  //     );
  //   }
  // }

  //</editor-fold>

  //<editor-fold desc="Look up element">
  /// Checks if repeatSection contains a element by a given [name].
  /// The name here must be the string representation of the children index.
  ///
  /// `i.e repeated.element('0')`
  @override
  bool contains(String name) {
    final index = int.tryParse(name);
    if (index != null && index < _elements.length) {
      return true;
    }

    return false;
  }

  int sectionIndexWhere(bool test(FormElementInstance<dynamic> section),
      [int start = 0]) {
    return elements.indexWhere(test);
  }

  @override
  FormElementInstance<dynamic> element(String name) {
    final namePath = name.split('.');
    if (namePath.length > 1) {
      final control = findElementInCollection(namePath);
      if (control != null) {
        return control;
      }
    } else {
      final index = int.tryParse(name);
      if (index == null) {
        throw FormRepeatElementInvalidIndexException(name);
      } else if (index < _elements.length) {
        return _elements[index];
      }
    }

    throw FormElementNotFoundException(elementName: name);
  }

  @override
  FormElementInstance<dynamic>? findElement(String path) =>
      findElementInCollection(path.split('.'));

  @override
  bool anyElements(
      bool Function(FormElementInstance<dynamic> element) condition) {
    return _elements.any((element) => element.enabled && condition(element));
  }

  //</editor-fold>

  //<editor-fold desc="Update Value">

  // @override
  // void updateValue(List<Map<String, Object?>?>? value,
  //     {bool updateParent = true, bool emitEvent = true}) {
  //   for (var i = 0; i < _elements.length; i++) {
  //     if (value == null || i < value.length) {
  //       _elements[i].updateValue(
  //         value?.elementAt(i),
  //         updateParent: false,
  //         emitEvent: emitEvent,
  //       );
  //     }
  //   }
  //
  //   if (value != null && value.length > _elements.length) {
  //     final newElements = value
  //         .toList()
  //         .asMap()
  //         .entries
  //         .where((MapEntry<int, Map<String, Object?>?> entry) =>
  //             entry.key >= _elements.length)
  //         .map((MapEntry<int, Map<String, Object?>?> entry) =>
  //             FromElementFactory.createSectionInstance(form, template,
  //                 savedValue: entry.value))
  //         .toList();
  //
  //     addAll(
  //       newElements,
  //       updateParent: updateParent,
  //     );
  //   } else {
  //     updateValueAndValidity(
  //       updateParent: updateParent,
  //     );
  //   }
  // }
  //
  // void repeatSectionValuePatch(
  //     List<Map<String, Object?>?>? value, {
  //       bool updateParent = true,
  //       bool emitEvent = true,
  //     }) {
  //   final keys = value?.asMap().keys;
  //
  //   final toPatch = <SectionInstance>[];
  //
  //   (value ?? []).asMap().forEach(
  //         (k, v) {
  //       if (keys.contains(k)) {
  //         toPatch.add(v);
  //       }
  //     },
  //   );
  //
  //   elementControl.patchValue(
  //       toPatch
  //           .map((e) =>
  //       FromElementControlFactory.createSectionControl(e).rawValue)
  //           .toList(),
  //       updateParent: updateParent,
  //       emitEvent: emitEvent);
  // }
  //
  @override
  void patchValue(
    List<Map<String, Object?>?>? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    for (var i = 0; i < _elements.length; i++) {
      if (value == null || i < value.length) {
        _elements[i].updateValue(
          value?.elementAt(i),
          updateParent: false,
          emitEvent: emitEvent,
        );
      }
    }

    // updateValueAndValidity(updateParent: updateParent);
  }

  // updateRepeatSectionValue
  @override
  void updateValue(
    List<Map<String, Object?>?>? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final List<Map<String, Object?>?>? localValue = (value);
    if ((localValue ?? []).isEmpty) {
      clear(updateParent: updateParent, emitEvent: emitEvent);
      return;
    }

    final toUpdate = <Map<String, Object?>?>[];
    final toAdd = <Map<String, Object?>?>[];

    localValue!.asMap().forEach((int k, Map<String, Object?>? v) {
      final List<Map<String, Object?>?> controlValues =
          elementControl.controls.map((e) => e.value).toList();

      if (elements.asMap().containsKey(k) &&
          controlValues.asMap().containsKey(k)) {
        toUpdate.add(v);
      } else {
        toAdd.add(v);
      }
    });

    if (toUpdate.isNotEmpty) {
      elementControl.updateValue(
          toUpdate
              .map((Map<String, Object?>? e) =>
                  FromElementControlFactory.createSectionFormGroup(template,
                          savedValue: e)
                      .rawValue)
              .toList(),
          updateParent: updateParent,
          emitEvent: emitEvent);
    }

    if (toAdd.isNotEmpty) {
      toAdd.forEach((e) {
        elementControl.add(
            FromElementControlFactory.createSectionFormGroup(template,
                savedValue: e),
            updateParent: updateParent,
            emitEvent: emitEvent);
        add(FromElementFactory.createRepeatItem(form, template, savedValue: e));
      });
    }
  }

  // void updateRepeatSectionValue(
  //   List<SectionInstance> value, {
  //   bool updateParent = true,
  //   bool emitEvent = true,
  // }) {
  //   final List<SectionInstance> localValue = (value);
  //   if (localValue.isEmpty) {
  //     repeatSectionClear(updateParent: updateParent, emitEvent: emitEvent);
  //     return;
  //   }
  //
  //   final toUpdate = <SectionInstance>[];
  //   final toAdd = <SectionInstance>[];
  //
  //   localValue.asMap().forEach((int k, SectionInstance v) {
  //     final List<Map<String, Object?>?> controlValues =
  //         elementControl.controls.map((e) => e.value).toList();
  //
  //     if (repeatSectionItems.asMap().containsKey(k) &&
  //         controlValues.asMap().containsKey(k)) {
  //       toUpdate.add(v);
  //     } else {
  //       toAdd.add(v);
  //     }
  //   });
  //
  //   if (toUpdate.isNotEmpty) {
  //     elementControl.updateValue(
  //         toUpdate
  //             .map((SectionInstance e) =>
  //                 FromElementControlFactory.createSectionControl(e).rawValue)
  //             .toList(),
  //         updateParent: updateParent,
  //         emitEvent: emitEvent);
  //     updateValue(toUpdate.map((e) => e.rawValue).toList(),
  //         updateParent: updateParent, emitEvent: emitEvent);
  //   }
  //
  //   if (toAdd.isNotEmpty) {
  //     toAdd.forEach((e) {
  //       elementControl.add(FromElementControlFactory.createSectionControl(e),
  //           updateParent: updateParent, emitEvent: emitEvent);
  //       add(e);
  //     });
  //   }
  // }
  //</editor-fold>

  //<editor-fold desc="Util-methods">
  @override
  void forEachChild(
          void Function(FormElementInstance<dynamic> element) callback) =>
      _elements.forEach(callback);

  @override
  bool allElementsDisabled() => elementControl.allControlsDisabled();

  @override
  void dispose() {
    forEachChild((element) {
      element.parentSection = null;
      element.dispose();
    });
    elementControl.closeCollectionEvents();
    super.dispose();
  }

  void get repeatSectionFocus => form.focus(elementPath);

  //</editor-fold>

  // /// stockItemsRepeatedStockItemForm
  // /// create the items list empty with length = count of items
  // // List<Map<String, Object?>?> get repeatSectionItems
  // List<SectionInstance> get repeatSectionItems {
  //   final values = (elementControl.controls).map((e) => e.value).toList();
  //
  //   return values
  //       .asMap()
  //       .map((k, Map<String, Object?>? v) => MapEntry(
  //           k, SectionInstance(form: form, template: template)..value = v))
  //       .values
  //       .toList();
  // }

  // ExtendedControl<List<Map<String, Object?>?>, List<SectionInstance>>
  //     get repeatSectionExtendedControl =>
  //         ExtendedControl<List<Map<String, Object?>?>, List<SectionInstance>>(
  //             form.control(elementPath) as FormArray<Map<String, Object?>>,
  //             () => repeatSectionItems);

  // void addElement(FieldTemplate element, value) {
  //   elementControl.addAll({
  //     element.name: FromTemplateControlFactory.createTemplateControl(element)
  //   });
  //   addAll({
  //     element.name: FromElementFactory.createElement(elementControl, element,
  //         savedValue: value)
  //   });
  // }

  @override
  FormArray<Map<String, Object?>> get elementControl =>
      form.control(elementPath) as FormArray<Map<String, Object?>>;
}
