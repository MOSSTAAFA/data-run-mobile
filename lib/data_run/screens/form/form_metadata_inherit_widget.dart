import 'package:mass_pro/data_run/screens/form/model/form_metadata.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class FormMetadataWidget extends InheritedWidget {
  const FormMetadataWidget({
    super.key,
    required this.formMetadata,
    required super.child,
  });

  final FormMetadata formMetadata;

  static FormMetadata of(BuildContext context) {
    final FormMetadataWidget? inheritedWidget =
        context.dependOnInheritedWidgetOfExactType<FormMetadataWidget>();
    if (inheritedWidget == null) {
      throw 'No FormElementInheritedWidget found in context.';
    }
    return inheritedWidget.formMetadata;
  }

  @override
  bool updateShouldNotify(covariant FormMetadataWidget oldWidget) {
    return formMetadata != oldWidget.formMetadata;
  }
}
