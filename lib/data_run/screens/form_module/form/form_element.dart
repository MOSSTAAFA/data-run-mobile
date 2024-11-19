abstract class FormElement {
  String templatePath;
  dynamic value;
  Map<String, dynamic> metadata;

  FormElement(this.templatePath, this.value, this.metadata);

  void accept(FormElementVisitor visitor);
}

class Field extends FormElement {
  Field(String templatePath, dynamic value, Map<String, dynamic> metadata)
      : super(templatePath, value, metadata);

  @override
  void accept(FormElementVisitor visitor) {
    visitor.visitField(this);
  }
}

class RepeatSection extends FormElement {
  List<FormElement> items = [];

  RepeatSection(String templatePath, Map<String, dynamic> metadata)
      : super(templatePath, null, metadata);

  @override
  void accept(FormElementVisitor visitor) {
    visitor.visitRepeatSection(this);
  }
}


abstract class FormElementVisitor {
  void visitField(Field field);

  void visitRepeatSection(RepeatSection repeatSection);
}
