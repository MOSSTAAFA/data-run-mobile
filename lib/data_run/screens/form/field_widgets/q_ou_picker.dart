import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/commons/custom_widgets/async_value.widget.dart';
import 'package:mass_pro/data_run/screens/form/field_widgets/ou_picker_data_source.provider.dart';
import 'package:mass_pro/data_run/screens/form/field_widgets/reactive_o_u_picker.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';

class QOrgUnitPickerField extends HookConsumerWidget {
  const QOrgUnitPickerField({super.key, required this.element});

  final FieldInstance<dynamic> element;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final elementConfig = useState(element.properties);
    if (elementConfig.value.hidden) {
      return SizedBox.shrink();
    }

    final dataSourceAsyncValue = ref.watch(ouPickerDataSourceProvider(
        formMetaData: FormMetadataWidget.of(context)));

    return AsyncValueWidget(
      value: dataSourceAsyncValue,
      data: (dataSource) => ReactiveOuPicker(
        // formControl: element.elementControl,
        formControlName: element.name,
        enabled: element.enabled,
        labelText: element.label,
        validationMessages: element.validationMessages,
        dataSource: dataSource,
      ),
    );
  }
}
