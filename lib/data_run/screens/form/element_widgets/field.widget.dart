import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:datarun/commons/logging/logging.dart';
import 'package:datarun/data_run/screens/form/element/form_element.dart';
import 'package:datarun/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:datarun/data_run/screens/form/element_widgets/form_widget_factory.dart';
import 'package:datarun/data_run/screens/form/hooks/register_dependencies.dart';
import 'package:datarun/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class FieldWidget extends HookConsumerWidget {
  FieldWidget({super.key, required this.element});

  final FieldInstance<dynamic> element;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useRegisterDependencies(element);

    final elementPropertiesSnapshot = useStream(element.propertiesChanged);
    final formInstance = ref
        .watch(
            formInstanceProvider(formMetadata: FormMetadataWidget.of(context)))
        .requireValue;
    final control = formInstance.form.control(element.pathRecursive)
        as FormControl<dynamic>;

    useEffect(() {
      final subscription = control.valueChanges.listen((value) {
        if (value == null) {
          element.updateValue(value);
        } else {
          element.updateValue(value);
        }
      });

      logDebug(info: 'call use effect: ${element.name}, unsubscribe');
      return () => subscription;
    }, [control]);

    if (!elementPropertiesSnapshot.hasData) {
      return CircularProgressIndicator();
    }

    if (elementPropertiesSnapshot.data!.hidden) {
      return SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FieldFactory.fromType(element: element),
    );
  }
}
