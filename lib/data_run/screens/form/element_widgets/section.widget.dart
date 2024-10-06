import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element_widgets/form_element.widget.dart';
import 'package:mass_pro/data_run/screens/form/element_widgets/form_widget_factory.dart';
import 'package:mass_pro/data_run/screens/form/hooks/register_dependencies.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class SectionWidget extends HookConsumerWidget {
  SectionWidget({super.key, required this.element, String path = ''});

  final SectionInstance element;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useRegisterDependencies(element);

    return ReactiveForm(
      formGroup: element.elementControl,
      child: Column(
        children: element.elements.values.map((childElement) {
          // return FormElementWidgetFactory.createWidget(childElement);
          return FormElementWidget(element: childElement);
        }).toList(),
      ),
    );
  }
}
