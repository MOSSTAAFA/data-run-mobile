// import 'package:mass_pro/data_run/form_reactive/form_element/form_element_model.dart';
//
// import 'form_element_exception.dart';
//
/// List Of Section a formTemplate RepeatSection's elements would be
/// instantiated and added as a group of elements under a section with it's name be its index
/// TODO: check if all RepeatSection methods are going to work as intended
// class RepeatSection
//     extends SectionElement<List<FormElementInstance>> {
//   RepeatSection(
//       {required super.name,
//       required super.type,
//       super.parentSection,
//       required super.properties,
//       super.elements = const []});
//
//   /// Insert a new [element] at the end of the RepeatSection.
//   void add(FormElementInstance element) {
//     addAll([element]);
//   }
//
//   /// Appends all [elements] to the end of the RepeatSection.
//   void addAll(List<FormElementInstance> elements) {
//     elements.addAll(elements);
//     for (final element in elements) {
//       element.parentSection = this.name;
//     }
//   }
//
//   /// Removes and returns the child element at the given [index].
//   /// TODO: Implement
//   List<FormElementInstance>? removeAt(int index) {
//     return elements.remove(index);
//   }
//
//   /// Removes all children elements from the repeatSection.
//   void clear() {
//     elements.clear();
//   }
//
//   /// Checks if repeatSection contains a element by a given [name].
//   /// The name here must be the string representation of the children index.
//   ///
//   /// `i.e repeated.element('0')`
//   @override
//   bool contains(String name) {
//     final index = int.tryParse(name);
//     if (index != null) {
//       return elements.containsKey(index);
//     }
//     return false;
//   }
//
//   /// In a repeatSection Retrieves the a section using it's index as a string
//   /// or a path starting from the index
//   /// The [name] is a dot-delimited string that represents the index position
//   /// of the element in repeatSection or the path to the nested element.
//   ///
//   /// Throws [FormRepeatElementInvalidIndexException] if [name] is not e valid [int]
//   /// number.
//   ///
//   /// ### Example:
//   ///
//   /// ```dart
//   /// final repeatSectionInstance = RepeatSection(name: 'repeatedName',
//   ///   type: ValueType.RepeatedSection, elements: [
//   ///     FieldElement(name: 'fieldName1', type: ValueType.Text, defaultValue: 'value', value: 'Hello'),
//   ///     FieldElement(name: 'fieldName2', type: ValueType.Integer, value: 44),
//   ///     Section(name: 'sectionName1', type: ValueType.Section, elements: [
//   ///       FieldElement(name: 'sectionFieldName1', type: ValueType.Text, value: null),
//   ///       FieldElement(name: 'sectionFieldName2', type: ValueType.Number, value: 2.3),
//   ///     ])
//   ///   ],
//   ///   [
//   ///     FieldElement(name: 'fieldName1', type: ValueType.Text, defaultValue: 'value', value: 'Hi'),
//   ///     FieldElement(name: 'fieldName2', type: ValueType.Integer, value: 44),
//   ///     Section(name: 'sectionName1', type: ValueType.Section, elements: [
//   ///       FieldElement(name: 'sectionFieldName1', type: ValueType.Text, value: null),
//   ///       FieldElement(name: 'sectionFieldName2', type: ValueType.Number, value: 2.3),
//   ///   ]),
//   /// ],
//   /// );
//   ///
//   /// final element = repeatSectionInstance.element('1.'); // retrieve the Section
//   /// final element = repeatSectionInstance.element('1.fieldName2');
//   /// final element = repeatSectionInstance.element('1.sectionName'); // retrieve the Section at the index
//   /// final element = repeatSectionInstance.element('1.sectionName.sectionFieldName1'); // retrieve the field in Section at the index
//   ///
//   /// ```
//   ///
//   @override
//   FormElementInstance element(String name) {
//     final namePath = name.split('.');
//     if (namePath.length > 1) {
//       final element = findElementInCollection(namePath);
//       if (element != null) {
//         return element;
//       }
//     } else {
//       final index = int.tryParse(name);
//       if (index == null) {
//         throw FormRepeatElementInvalidIndexException(name);
//       } else if (index < elements.length) {
//         return elements[index];
//       }
//     }
//
//     throw FormElementNotFoundException(elementName: name);
//   }
//
//   /// Gets the value of the [SectionInstance] flattened.
//   Map<String, dynamic> get rawValue {
//     // TODO: implement rawValue
//     throw UnimplementedError();
//   }
// }
//
// class RepeatSection
//     extends SectionElement<Map<int, List<FormElementInstance>>> {
//   RepeatSection(
//       {required super.name,
//         required super.type,
//         super.parentSection,
//         required super.properties,
//         super.elements = const {}});
//
//   /// Insert a new [element] at the end of the RepeatSection.
//   void add(FormElementInstance element) {
//     addAll([element]);
//   }
//
//   /// Appends all [elements] to the end of the RepeatSection.
//   void addAll(List<FormElementInstance> elements) {
//     elements.addAll(elements);
//     for (final element in elements) {
//       element.parentSection = this.name;
//     }
//   }
//
//   /// Removes and returns the child element at the given [index].
//   /// TODO: Implement
//   List<FormElementInstance>? removeAt(int index) {
//     return elements.remove(index);
//   }
//
//   /// Removes all children elements from the repeatSection.
//   void clear() {
//     elements.clear();
//   }
//
//   /// Checks if repeatSection contains a element by a given [name].
//   /// The name here must be the string representation of the children index.
//   ///
//   /// `i.e repeated.element('0')`
//   @override
//   bool contains(String name) {
//     final index = int.tryParse(name);
//     if (index != null) {
//       return elements.containsKey(index);
//     }
//     return false;
//   }
//
//   /// In a repeatSection Retrieves the a section using it's index as a string
//   /// or a path starting from the index
//   /// The [name] is a dot-delimited string that represents the index position
//   /// of the element in repeatSection or the path to the nested element.
//   ///
//   /// Throws [FormRepeatElementInvalidIndexException] if [name] is not e valid [int]
//   /// number.
//   ///
//   /// ### Example:
//   ///
//   /// ```dart
//   /// final repeatSectionInstance = RepeatSection(name: 'repeatedName',
//   ///   type: ValueType.RepeatedSection, elements: [
//   ///     FieldElement(name: 'fieldName1', type: ValueType.Text, defaultValue: 'value', value: 'Hello'),
//   ///     FieldElement(name: 'fieldName2', type: ValueType.Integer, value: 44),
//   ///     Section(name: 'sectionName1', type: ValueType.Section, elements: [
//   ///       FieldElement(name: 'sectionFieldName1', type: ValueType.Text, value: null),
//   ///       FieldElement(name: 'sectionFieldName2', type: ValueType.Number, value: 2.3),
//   ///     ])
//   ///   ],
//   ///   [
//   ///     FieldElement(name: 'fieldName1', type: ValueType.Text, defaultValue: 'value', value: 'Hi'),
//   ///     FieldElement(name: 'fieldName2', type: ValueType.Integer, value: 44),
//   ///     Section(name: 'sectionName1', type: ValueType.Section, elements: [
//   ///       FieldElement(name: 'sectionFieldName1', type: ValueType.Text, value: null),
//   ///       FieldElement(name: 'sectionFieldName2', type: ValueType.Number, value: 2.3),
//   ///   ]),
//   /// ],
//   /// );
//   ///
//   /// final element = repeatSectionInstance.element('1.'); // retrieve the Section
//   /// final element = repeatSectionInstance.element('1.fieldName2');
//   /// final element = repeatSectionInstance.element('1.sectionName'); // retrieve the Section at the index
//   /// final element = repeatSectionInstance.element('1.sectionName.sectionFieldName1'); // retrieve the field in Section at the index
//   ///
//   /// ```
//   ///
//   @override
//   FormElementInstance element(String name) {
//     final namePath = name.split('.');
//     if (namePath.length > 1) {
//       final element = findElementInCollection(namePath);
//       if (element != null) {
//         return element;
//       }
//     } else {
//       final index = int.tryParse(name);
//       if (index == null) {
//         throw FormRepeatElementInvalidIndexException(name);
//       } else if (index < elements.length) {
//         return elements[index];
//       }
//     }
//
//     throw FormElementNotFoundException(elementName: name);
//   }
//
//   /// Gets the value of the [SectionInstance] flattened.
//   Map<String, dynamic> get rawValue {
//     // TODO: implement rawValue
//     throw UnimplementedError();
//   }
// }
