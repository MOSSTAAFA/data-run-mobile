// import 'dart:ffi';
//
// import 'package:mass_pro/data_run/form_reactive/dynamic_form/dynamic_form_mapper.dart';
// import 'package:mass_pro/data_run/form_reactive/form_element/form_element_exception.dart';
// import 'package:mass_pro/data_run/form_reactive/form_element/form_element_model.dart';
//
// extension FormElementExtension<T> on FormElement<T> {
//   /// Retrieves a child element given the element's [name] or path.
//   ///
//   /// The [name] is a dot-delimited string that define the path to the
//   /// element.
//   ///
//   /// Throws [FormElementNotFoundException] if no element founded with
//   /// the specified [name]/path.
//   FormElement<dynamic> element(String name) {
//     return this.map(
//         fieldElement: (fieldElement) => this,
//         sectionElement: (sectionElement) {
//           final namePath = name.split('.');
//           if (namePath.length > 1) {
//
//             final element = findElementInSection(namePath);
//             sectionElement.copyWith()
//             if (element != null) {
//               return element;
//             }
//           } else if (contains(name)) {
//             return sectionElement.elements[name]!;
//           }
//
//           throw FormElementNotFoundException(elementName: name);
//         },
//         repeatableElement: (repeatableElement) {
//           final namePath = name.split('.');
//           if (namePath.length > 1) {
//             final element = findElementInSection(namePath);
//             if (element != null) {
//               return element;
//             }
//           } else {
//             final index = int.tryParse(name);
//             if (index == null) {
//               throw FormRepeatElementInvalidIndexException(name);
//             } else if (index < repeatableElement.formElements.length) {
//               return repeatableElement.formElements[index];
//             }
//           }
//
//           throw FormElementNotFoundException(elementName: name);
//         });
//   }
//
//   /// Checks if (Section/RepeatedSection formElements) contains a FormElement by a given [name].
//   ///
//   /// Returns true if (formElements) contains the element, otherwise returns false.
//   bool contains(String name) {
//     return this.map(
//         fieldElement: (fieldElement) => name == fieldElement.name,
//         sectionElement: (sectionElement) =>
//             sectionElement.formElements.containsKey(name),
//         repeatableElement: (repeatableElement) {
//           final index = int.tryParse(name);
//           if (index != null && index < repeatableElement.formElements.length) {
//             return true;
//           }
//
//           return false;
//         });
//   }
//
//   /// when the element is either sectionElement or RepeatedElement
//   /// Walks the [path] to find the matching element, otherwise returns null
//   ///
//   /// Returns null if no match is found or the element is FieldElement
//   FormElement<dynamic>? findElementInSection(List<String> path) {
//     return this.maybeMap(
//         fieldElement: (sectionElement) => null,
//         orElse: () {
//           if (path.isEmpty) {
//             return null;
//           }
//
//           final result =
//               path.fold<FormElement<dynamic>?>(this, (element, name) {
//             if (element != null &&
//                 (element is RepeatableElement<dynamic> ||
//                     element is SectionElement<dynamic>)) {
//               return element.contains(name) ? element.element(name) : null;
//             } else {
//               return null;
//             }
//           });
//
//           return result;
//         });
//   }
//
//   // FormElement updateValue(T? value, {bool updateParent = true}) {
//   //   map(
//   //       fieldElement: (fieldElement) {
//   //         if (value != fieldElement.value) {
//   //           final newValue =  fieldElement.copyWith(element(name));
//   //
//   //           if (updateParent) {
//   //             fieldElement.parent?.markAsDirty(updateParent: updateParent);
//   //           }
//   //
//   //           return newValue;
//   //         }
//   //
//   //         return this;
//   //       },
//   //
//   //       sectionElement: (sectionElement) {
//   //         final newValue = sectionElement.value ?? {};
//   //
//   //         for (final key in sectionElement.formElements.keys) {
//   //           sectionElement.formElements[key]!.updateValue(
//   //             newValue[key],
//   //             updateParent: false,
//   //             emitEvent: emitEvent,
//   //           );
//   //         }
//   //       },
//   //       repeatableElement: (repeatableElement) {
//   //
//   //       });
//   //   if (value != this.value) {
//   //     value = value;
//   //   }
//   //
//   //   if (updateParent) {
//   //     parent?.markAsDirty(updateParent: updateParent);
//   //   }
//   //
//   //   return this.copyWith(value: value);
//   // }
//   //
//   // @override
//   // FormElement patchValue(T? value,
//   //     {bool updateParent = true, bool emitEvent = true}) {
//   //   map(
//   //       fieldElement: (fieldElement) {
//   //         return updateValue(value, updateParent: updateParent);;
//   //       },
//   //       sectionElement: (sectionElement) {
//   //
//   //       },
//   //       repeatableElement: (repeatableElement) {
//   //
//   //       });
//   //
//   //   updateValue(value, updateParent: updateParent);
//   // }
//   //
//   // FormElement<Object> markAsDirty({bool updateParent = true, bool emitEvent = true}) {
//   //   map(
//   //       fieldElement: (fieldElement) {
//   //       },
//   //       sectionElement: (sectionElement) {
//   //
//   //       },
//   //       repeatableElement: (repeatableElement) {
//   //
//   //       });
//   //
//   //   if (updateParent) {
//   //     parent?.markAsDirty(updateParent: updateParent);
//   //     copyWith(parent: parent?.markAsDirty(updateParent: updateParent));
//   //   }
//   // }
//   //
//   // FormElement markAsEnabled({bool updateParent = true}) {
//   //   map(
//   //       fieldElement: (fieldElement) {
//   //       },
//   //       sectionElement: (sectionElement) {
//   //
//   //       },
//   //       repeatableElement: (repeatableElement) {
//   //
//   //       });
//   //
//   // }
//   //
//   // FormElement<dynamic>? findElement(String path) {
//   //   map(
//   //       fieldElement: (fieldElement) => this,
//   //       sectionElement: (sectionElement) {
//   //
//   //       },
//   //       repeatableElement: (repeatableElement) {
//   //
//   //       });
//   // }
// }
// //
// // extension FieldElementExtension<T> on FieldElement<T> {
// //   /// Retrieves a child element given the element's [name] or path.
// //   ///
// //   /// The [name] is a dot-delimited string that define the path to the
// //   /// element.
// //   ///
// //   /// Throws [FormElementNotFoundException] if no element founded with
// //   /// the specified [name]/path.
// //   FormElement<dynamic> element(String name) {
// //     return this;
// //   }
// //
// //   FormElement updateValue(T? value, {bool updateParent = true}) {
// //     if (value != this.value) {
// //       final newValue =  this.copyWith(value: value);
// //       if (updateParent) {
// //         parent?.markAsDirty(updateParent: updateParent);
// //       }
// //
// //       return newValue;
// //     }
// //
// //     return this;
// //   }
// //
// //   FormElement patchValue(T? value,
// //       {bool updateParent = true}) {
// //     return updateValue(value, updateParent: updateParent);
// //   }
// //
// //   FormElement markAsDirty({bool updateParent = true}) {
// //     if (updateParent) {
// //       parent?.markAsDirty(updateParent: updateParent);
// //     }
// //   }
// //
// //
// // }
// //
// // extension SectionElementExtension<T> on SectionElement<T> {
// //   /// Retrieves a child element given the element's [name] or path.
// //   ///
// //   /// The [name] is a dot-delimited string that define the path to the
// //   /// element.
// //   ///
// //   /// Throws [FormElementNotFoundException] if no element founded with
// //   /// the specified [name]/path.
// //   FormElement<dynamic> element(String name) {
// //     return this.map(
// //         fieldElement: (fieldElement) => this,
// //         sectionElement: (sectionElement) {
// //           final namePath = name.split('.');
// //           if (namePath.length > 1) {
// //             final element = findElementInSection(namePath);
// //             if (element != null) {
// //               return element;
// //             }
// //           } else if (contains(name)) {
// //             return sectionElement.formElements[name]!;
// //           }
// //
// //           throw FormElementNotFoundException(elementName: name);
// //         },
// //         repeatableElement: (repeatableElement) {
// //           final namePath = name.split('.');
// //           if (namePath.length > 1) {
// //             final element = findElementInSection(namePath);
// //             if (element != null) {
// //               return element;
// //             }
// //           } else {
// //             final index = int.tryParse(name);
// //             if (index == null) {
// //               throw FormRepeatElementInvalidIndexException(name);
// //             } else if (index < repeatableElement.formElements.length) {
// //               return repeatableElement.formElements[index];
// //             }
// //           }
// //
// //           throw FormElementNotFoundException(elementName: name);
// //         });
// //   }
// //
// //   /// Checks if (Section/RepeatedSection formElements) contains a FormElement by a given [name].
// //   ///
// //   /// Returns true if (formElements) contains the element, otherwise returns false.
// //   bool contains(String name) {
// //     return this.map(
// //         fieldElement: (fieldElement) => name == fieldElement.name,
// //         sectionElement: (sectionElement) =>
// //             sectionElement.formElements.containsKey(name),
// //         repeatableElement: (repeatableElement) {
// //           final index = int.tryParse(name);
// //           if (index != null && index < repeatableElement.formElements.length) {
// //             return true;
// //           }
// //
// //           return false;
// //         });
// //   }
// //
// //   /// when the element is either sectionElement or RepeatedElement
// //   /// Walks the [path] to find the matching element, otherwise returns null
// //   ///
// //   /// Returns null if no match is found or the element is FieldElement
// //   FormElement<dynamic>? findElementInSection(List<String> path) {
// //     return this.maybeMap(
// //         fieldElement: (sectionElement) => null,
// //         orElse: () {
// //           if (path.isEmpty) {
// //             return null;
// //           }
// //
// //           final result =
// //               path.fold<FormElement<dynamic>?>(this, (element, name) {
// //             if (element != null &&
// //                 (element is RepeatableElement<dynamic> ||
// //                     element is SectionElement<dynamic>)) {
// //               return element.contains(name) ? element.element(name) : null;
// //             } else {
// //               return null;
// //             }
// //           });
// //
// //           return result;
// //         });
// //   }
// //
// //   @override
// //   FormElement updateValue(T? value, {bool updateParent = true}) {
// //     map(
// //         fieldElement: (fieldElement) => fieldElement.copyWith(value: value),
// //         sectionElement: (sectionElement),
// //         repeatableElement: (repeatableElement));
// //     if (value != this.value) {
// //       value = value;
// //     }
// //
// //     if (updateParent) {
// //       parent?.markAsDirty(updateParent: updateParent);
// //     }
// //
// //     return this.copyWith(value: value);
// //   }
// //
// //   @override
// //   FormElement patchValue(T? value,
// //       {bool updateParent = true, bool emitEvent = true}) {
// //     updateValue(value, updateParent: updateParent);
// //   }
// //
// //   FormElement markAsDirty({bool updateParent = true, bool emitEvent = true}) {
// //     if (updateParent) {
// //       parent?.markAsDirty(updateParent: updateParent);
// //     }
// //   }
// // }
// //
// // extension RepeatedElementExtension<T> on RepeatableElement<T> {
// //   /// Retrieves a child element given the element's [name] or path.
// //   ///
// //   /// The [name] is a dot-delimited string that define the path to the
// //   /// element.
// //   ///
// //   /// Throws [FormElementNotFoundException] if no element founded with
// //   /// the specified [name]/path.
// //   FormElement<dynamic> element(String name) {
// //     return this.map(
// //         fieldElement: (fieldElement) => this,
// //         sectionElement: (sectionElement) {
// //           final namePath = name.split('.');
// //           if (namePath.length > 1) {
// //             final element = findElementInSection(namePath);
// //             if (element != null) {
// //               return element;
// //             }
// //           } else if (contains(name)) {
// //             return sectionElement.formElements[name]!;
// //           }
// //
// //           throw FormElementNotFoundException(elementName: name);
// //         },
// //         repeatableElement: (repeatableElement) {
// //           final namePath = name.split('.');
// //           if (namePath.length > 1) {
// //             final element = findElementInSection(namePath);
// //             if (element != null) {
// //               return element;
// //             }
// //           } else {
// //             final index = int.tryParse(name);
// //             if (index == null) {
// //               throw FormRepeatElementInvalidIndexException(name);
// //             } else if (index < repeatableElement.formElements.length) {
// //               return repeatableElement.formElements[index];
// //             }
// //           }
// //
// //           throw FormElementNotFoundException(elementName: name);
// //         });
// //   }
// //
// //   /// Checks if (Section/RepeatedSection formElements) contains a FormElement by a given [name].
// //   ///
// //   /// Returns true if (formElements) contains the element, otherwise returns false.
// //   bool contains(String name) {
// //     return this.map(
// //         fieldElement: (fieldElement) => name == fieldElement.name,
// //         sectionElement: (sectionElement) =>
// //             sectionElement.formElements.containsKey(name),
// //         repeatableElement: (repeatableElement) {
// //           final index = int.tryParse(name);
// //           if (index != null && index < repeatableElement.formElements.length) {
// //             return true;
// //           }
// //
// //           return false;
// //         });
// //   }
// //
// //   /// when the element is either sectionElement or RepeatedElement
// //   /// Walks the [path] to find the matching element, otherwise returns null
// //   ///
// //   /// Returns null if no match is found or the element is FieldElement
// //   FormElement<dynamic>? findElementInSection(List<String> path) {
// //     return this.maybeMap(
// //         fieldElement: (sectionElement) => null,
// //         orElse: () {
// //           if (path.isEmpty) {
// //             return null;
// //           }
// //
// //           final result =
// //               path.fold<FormElement<dynamic>?>(this, (element, name) {
// //             if (element != null &&
// //                 (element is RepeatableElement<dynamic> ||
// //                     element is SectionElement<dynamic>)) {
// //               return element.contains(name) ? element.element(name) : null;
// //             } else {
// //               return null;
// //             }
// //           });
// //
// //           return result;
// //         });
// //   }
// //
// //   @override
// //   FormElement updateValue(T? value, {bool updateParent = true}) {
// //     map(
// //         fieldElement: (fieldElement) => fieldElement.copyWith(value: value),
// //         sectionElement: (sectionElement),
// //         repeatableElement: (repeatableElement));
// //     if (value != this.value) {
// //       value = value;
// //     }
// //
// //     if (updateParent) {
// //       parent?.markAsDirty(updateParent: updateParent);
// //     }
// //
// //     return this.copyWith(value: value);
// //   }
// //
// //   @override
// //   FormElement patchValue(T? value,
// //       {bool updateParent = true, bool emitEvent = true}) {
// //     updateValue(value, updateParent: updateParent);
// //   }
// //
// //   FormElement markAsDirty({bool updateParent = true, bool emitEvent = true}) {
// //     if (updateParent) {
// //       parent?.markAsDirty(updateParent: updateParent);
// //     }
// //   }
// // }
