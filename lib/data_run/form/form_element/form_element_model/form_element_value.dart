// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
//
// abstract class FormElement {
//   String name;
//   String type;
//   Entry<String, dynamic> value;
//   bool isVisible;
//   bool isValid;
//   List<String> errors;
//
//   FormElement(this.name, this.type);
// }
//
// class Field extends FormElement {
//   Field(String name, String type) : super(name, type);
// }
//
// class Section extends FormElement {
//   List<FormElement> children;
//
//   Section(String name, this.children) : super(name, 'Section');
// }
//
// class RepeatSection extends FormElement {
//   List<Section> items;
//
//   RepeatSection(String name, this.items) : super(name, 'RepeatSection');
// }
//
// class FormModel {
//   List<FormElement> elements;
//
//   FormModel(this.elements);
// }
