// import 'dart:async';
//
// import 'package:dynamic_forms/dynamic_forms.dart';
// import 'package:expression_language/expression_language.dart';
// import 'package:mass_pro/data_run/form/form_element/form_element_model/element.dart';
// import 'package:mass_pro/data_run/form/form_element/properties/property.dart';
// import 'package:meta/meta.dart';
// import 'package:rxdart/rxdart.dart';
//
// abstract class FormElement implements Element {
//   static const String defaultPropertyName = 'value';
//   static const String parentPropertyName = 'parent';
//   static const String isVisiblePropertyName = 'isVisible';
//
//   @override
//   String? id;
//
//   Property<FormElement>? get parentProperty =>
//       properties[parentPropertyName] as Property<FormElement>;
//   set parentProperty(Property<FormElement>? value) =>
//       registerProperty(parentPropertyName, value);
//   FormElement? get parent => parentProperty?.value;
//
//   Property<bool> get isVisibleProperty =>
//       properties[isVisiblePropertyName] as Property<bool>;
//   set isVisibleProperty(Property<bool> value) =>
//       registerProperty(isVisiblePropertyName, value);
//   bool get isVisible => isVisibleProperty.value;
//   Stream<bool> get isVisibleChanged => isVisibleProperty.valueChanged;
//
//   @protected
//   Map<String, Property> properties = {};
//
//   FormElement getInstance();
//
//   Stream<String> get propertyChanged {
//     _propertyChanged ??= _getPropertyChanged();
//     return _propertyChanged!;
//   }
//
//   Stream<String>? _propertyChanged;
//
//   Stream<String> _getPropertyChanged() {
//     var keyStreams = <Stream<String>>[];
//     properties.forEach((k, Property v) {
//       keyStreams.add(v.valueChanged.map((_) => k));
//     });
//     var mergedStream = MergeStream(keyStreams);
//     var connectableObservable = mergedStream.publishReplay(maxSize: 1);
//     connectableObservable.connect();
//     return connectableObservable;
//   }
//
//   Property getProperty([String? propertyName]) {
//     propertyName ??= defaultPropertyName;
//     var properties = getProperties();
//     if (properties.containsKey(propertyName)) {
//       return properties[propertyName]!;
//     }
//     throw Exception("Can't get expressions for $propertyName");
//   }
//
//   @override
//   ExpressionProviderElement clone(
//       ExpressionProvider<ExpressionProviderElement>? parent) {
//     var result = getInstance();
//     result.id = id;
//     result.registerProperty(parentPropertyName, parent as Property?);
//     result._fillFromDictionary(this, result, parent);
//
//     return result;
//   }
//
//   void _fillFromDictionary(FormElement oldFormElement, FormElement instance,
//       ExpressionProvider<ExpressionProviderElement>? parent) {
//     var formElementProperties = Map.from(oldFormElement.getProperties())
//       ..removeWhere((k, v) => k == parentPropertyName);
//     formElementProperties.forEach((k, v) =>
//         instance.properties[k] = cloneProperty(k, v, parent, instance));
//   }
//
//   Property<T>? registerProperty<T>(String name, Property<T>? property) {
//     if (property == null) {
//       return null;
//     }
//     properties[name] = property;
//     return property;
//   }
//
//   TFormElement? getFirstParentOfType<TFormElement extends FormElement>() {
//     var currentParent = parent;
//     while (currentParent != null) {
//       if (currentParent is TFormElement) {
//         return currentParent;
//       }
//       currentParent = currentParent.parent;
//     }
//     return null;
//   }
// }
