import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/constants.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/org_unit_picker/model/data_model.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/get_error_widget.dart';
import 'package:mass_pro/data_run/screens/form_submission_list/model/submission_list.provider.dart';
import 'package:mass_pro/data_run/screens/form_submission_screen/model/submission.provider.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';

class SubmissionInitialView extends ConsumerStatefulWidget {
  SubmissionInitialView(
      {super.key, this.enabled = true, required List<String> selectableUids})
      : this.selectableUids = selectableUids;

  final List<String> selectableUids;
  final bool enabled;

  @override
  SubmissionInitialViewState createState() => SubmissionInitialViewState();
}

class SubmissionInitialViewState extends ConsumerState<SubmissionInitialView> {
  late final String form;

  late final String submissionId;

  @override
  void initState() {
    super.initState();
    final Bundle eventBundle = Get.arguments as Bundle;
    form = eventBundle.getString(FORM_UID)!;
    submissionId = eventBundle.getString(SYNCABLE_UID)!;
  }

  @override
  Widget build(BuildContext context) {
    final submissionValue =
        ref.watch(submissionProvider(submissionId: submissionId));

    return Card(
      shadowColor: Colors.transparent,
      margin: const EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: Center(
          child: switch (submissionValue) {
            AsyncValue(error: final error?, stackTrace: final stackTrace?) =>
              getErrorWidget(error, stackTrace),
            AsyncValue(valueOrNull: final submission?) =>
              FormBuilderField<String?>(
                name: 'orgUnit',
                enabled: widget.enabled,
                initialValue: submission.orgUnit,
                validator: FormBuilderValidators.required(),
                onChanged: (value) {
                  ref
                      .watch(formSubmissionListProvider(form: form).notifier)
                      .saveOrgUnit(submissionId, value);
                },
                builder: (field) {
                  final dataSourceValue = ref.watch(treeNodeDataSourceProvider(
                      selectableUids: widget.selectableUids.lock));
                  return switch (dataSourceValue) {
                    AsyncValue(
                      error: final error?,
                      stackTrace: final stackTrace?
                    ) =>
                      getErrorWidget(error, stackTrace),
                    AsyncValue(valueOrNull: final dataSource?) =>
                      OrgUnitPickerField(
                        enabled: widget.enabled,
                        dataSource: dataSource,
                        initialValueUid: submission.orgUnit,
                        onChanged: (value) {
                          field.didChange(value);
                        },
                      ),
                    _ => const CircularProgressIndicator(),
                  };
                },
              ),
            _ => const CircularProgressIndicator(),
          },
        ),
      ),
    );
  }
}
