import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/commons/custom_widgets/async_value.widget.dart';
import 'package:mass_pro/commons/logging/logging.dart';
import 'package:mass_pro/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:mass_pro/data_run/screens/form/element/validation/form_element_validator.dart';
import 'package:mass_pro/data_run/screens/form/field_widgets/custom_reactive_widget/ou_picker_data_source.provider.dart';
import 'package:mass_pro/data_run/screens/form/field_widgets/custom_reactive_widget/reactive_o_u_picker.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class QOrgUnitPickerField extends HookConsumerWidget {
  const QOrgUnitPickerField({super.key, required this.element});

  final FieldInstance<String> element;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataSourceAsyncValue = ref.watch(ouPickerDataSourceProvider(
        formMetadata: FormMetadataWidget.of(context)));

    final formInstance = ref
        .watch(
            formInstanceProvider(formMetadata: FormMetadataWidget.of(context)))
        .requireValue;

    return AsyncValueWidget(
      value: dataSourceAsyncValue,
      valueBuilder: (dataSource) => ReactiveOuPicker(
        enabled: formInstance.enabled,
        // formControl: element.elementControl,
        formControl: formInstance.form.control(element.pathRecursive)
            as FormControl<String>,
        validationMessages: validationMessages(context),
        decoration: InputDecoration(labelText: element.label),
        dataSource: dataSource,
      ),
    );
  }
}
