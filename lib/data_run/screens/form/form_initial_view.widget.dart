import 'package:d2_remote/modules/datarun/form/shared/attribute_type.dart';
import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/commons/custom_widgets/async_value.widget.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/reactive_field/reactive_ou/ou_data_source.provider.dart';
import 'package:mass_pro/data_run/screens/form/reactive_field/reactive_ou/reactive_o_u_picker.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
import 'package:mass_pro/data_run/screens/form/element/validation/form_element_validator.dart';
import 'package:mass_pro/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormInitialView extends HookConsumerWidget {
  const FormInitialView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataSourceAsyncValue = ref.watch(ouPickerDataSourceProvider(
        formMetaData: FormMetadataWidget.of(context)));

    final formInstance = ref
        .watch(
            formInstanceProvider(formMetaData: FormMetadataWidget.of(context)))
        .requireValue;

    final FieldInstance<String> ouElement = FieldInstance(
        form: formInstance.form,
        template: FieldTemplate(
            mandatory: true,
            mainField: true,
            type: ValueType.OrganisationUnit,
            name: '_${AttributeType.orgUnit.name}'));
    return Card(
      shadowColor: Colors.transparent,
      margin: const EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: Center(
          child: AsyncValueWidget(
            value: dataSourceAsyncValue,
            data: (dataSource) => ReactiveOuPicker<String?>(
              dataSource: dataSource,
              validationMessages: validationMessages(context),
              element: ouElement,
            ),
          ),
        ),
      ),
    );
  }
}
