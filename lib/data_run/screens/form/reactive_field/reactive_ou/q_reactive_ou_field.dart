import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/commons/custom_widgets/async_value.widget.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/hooks/register_dependencies.dart';
import 'package:mass_pro/data_run/screens/form/reactive_field/reactive_ou/ou_data_source.provider.dart';
import 'package:mass_pro/data_run/screens/form/reactive_field/reactive_ou/reactive_o_u_picker.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/element_field_inherited.widget.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class QReactiveOrgUnitPickerField extends HookConsumerWidget {
  const QReactiveOrgUnitPickerField({
    super.key,
    required this.element,
  });

  final FieldInstance<dynamic> element;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final element = FieldElementInheritedWidget.of(context);
    // final initFieldElement = useRegisterDependencies(element);

    final dataSourceAsyncValue = ref.watch(ouPickerDataSourceProvider(
        formMetaData: FormMetadataWidget.of(context)));
    return AsyncValueWidget(
      value: dataSourceAsyncValue,
      data: (dataSource) => ReactiveOuPicker(
        element: element,
        dataSource: dataSource,
      ),
    );
  }
}
