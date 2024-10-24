import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/commons/custom_widgets/async_value.widget.dart';
import 'package:mass_pro/data_run/screens/form/field_widgets/ou_picker_data_source.provider.dart';
import 'package:mass_pro/data_run/screens/form/field_widgets/reactive_o_u_picker.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';

class QOrgUnitPickerField extends HookConsumerWidget {
  const QOrgUnitPickerField({super.key, required this.element});

  final FieldInstance<String> element;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final elementConfig = useState(element.elementProperties);
    // if (elementConfig.value.hidden) {
    //   return SizedBox.shrink();
    // }

    final dataSourceAsyncValue = ref.watch(ouPickerDataSourceProvider(
        formMetadata: FormMetadataWidget.of(context)));

    return AsyncValueWidget(
      value: dataSourceAsyncValue,
      valueBuilder: (dataSource) => ReactiveOuPicker(
        formControl: element.elementControl,
        validationMessages: element.validationMessages,
        dataSource: dataSource,
      ),
    );
  }
}
