import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/commons/constants.dart';
import 'package:mass_pro/data_run/form/form_configuration.dart';
import 'package:mass_pro/data_run/screens/form_reactive/fields/reactive_o_u_picker.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_element_model.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/get_error_widget.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/org_unit_picker/model/data_model.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';

class QOrgUnitPickerField extends HookConsumerWidget {
  const QOrgUnitPickerField({super.key, required this.element});

  final FieldInstance<dynamic> element;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final elementConfig = useState(element.properties);
    if (elementConfig.value.hidden) {
      return SizedBox.shrink();
    }

    final Bundle eventBundle = Get.arguments as Bundle;
    final form = eventBundle.getString(FORM_UID)!;
    final formVersion = eventBundle.getInt(FORM_VERSION)!;

    final formConfig = ref
        .watch(formConfigurationProvider(form: form, formVersion: formVersion))
        .requireValue;

    final dataSourceValue = ref.watch(
        treeNodeDataSourceProvider(selectableUids: formConfig.orgUnitTreeUids));

    return switch (dataSourceValue) {
      AsyncValue(error: final error?, stackTrace: final stackTrace?) =>
        getErrorWidget(error, stackTrace),
      AsyncValue(valueOrNull: final dataSource?) => ReactiveOuPicker(
          // formControl: element.elementControl,
        formControlName: element.name,
          validationMessages: element.validationMessages,
          dataSource: dataSource,
        ),
      _ => const CircularProgressIndicator(),
    };
  }
}
