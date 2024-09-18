import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/commons/constants.dart';
import 'package:mass_pro/data_run/screens/form_reactive/fields/reactive_o_u_picker.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/org_unit_picker/model/data_model.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/get_error_widget.dart';
import 'package:mass_pro/data_run/screens/form_submission_list/model/submission_list.provider.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormInitialView extends StatefulHookConsumerWidget {
  FormInitialView({super.key, this.enabled = true});

  final bool enabled;

  @override
  FormInitialViewState createState() => FormInitialViewState();
}

class FormInitialViewState extends ConsumerState<FormInitialView> {
  // late final String form;

  late final String submissionId;

  // late final int formVersion;

  @override
  void initState() {
    super.initState();
    final Bundle eventBundle = Get.arguments as Bundle;
    // form = eventBundle.getString(FORM_UID)!;
    submissionId = eventBundle.getString(SYNCABLE_UID)!;
    // formVersion = eventBundle.getInt(FORM_VERSION)!;
  }

  @override
  Widget build(BuildContext context) {
    final formInstance = ref.watch(formInstanceProvider).requireValue;
    final dataSourceValue = ref.watch(treeNodeDataSourceProvider(
        selectableUids: formInstance.template.orgUnits.lock));

    return Card(
      shadowColor: Colors.transparent,
      margin: const EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: Center(
          child: switch (dataSourceValue) {
            AsyncValue(error: final error?, stackTrace: final stackTrace?) =>
              getErrorWidget(error, stackTrace),
            AsyncValue(valueOrNull: final dataSource?) =>
              ReactiveOuPicker<String?>(
                key: ValueKey('OrgUnit_submission'),
                formControl: formInstance.formInit.control('orgUnit')
                    as FormControl<String?>,
                dataSource: dataSource,
              ),
            _ => const CircularProgressIndicator(),
          },
        ),
      ),
    );
  }
}
