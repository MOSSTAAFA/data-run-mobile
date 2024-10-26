import 'package:d2_remote/modules/datarun/form/shared/attribute_type.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/commons/custom_widgets/async_value.widget.dart';
import 'package:mass_pro/data_run/screens/form/element/form_instance.dart';
import 'package:mass_pro/data_run/screens/form/field_widgets/ou_picker_data_source.provider.dart';
import 'package:mass_pro/data_run/screens/form/field_widgets/reactive_o_u_picker.dart';
import 'package:mass_pro/data_run/screens/form/element/validation/form_element_validator.dart';
import 'package:mass_pro/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormInitialView extends HookConsumerWidget {
  const FormInitialView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataSourceAsyncValue = ref.watch(ouPickerDataSourceProvider(
        formMetadata: FormMetadataWidget.of(context)));

    final formInstance = ref
        .watch(
            formInstanceProvider(formMetadata: FormMetadataWidget.of(context)))
        .requireValue;

    return ReactiveForm(
      formGroup: formInstance.form,
      child: Card(
        shadowColor: Colors.transparent,
        margin: const EdgeInsets.all(8.0),
        child: SizedBox.expand(
          child: Center(
            child: AsyncValueWidget(
              value: dataSourceAsyncValue,
              valueBuilder: (dataSource) => ReactiveOuPicker<String?>(
                dataSource: dataSource,
                validationMessages: validationMessages(context),
                formControl:
                    formInstance.form.control('_${orgUnitControlName}')
                        as FormControl<String>,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
