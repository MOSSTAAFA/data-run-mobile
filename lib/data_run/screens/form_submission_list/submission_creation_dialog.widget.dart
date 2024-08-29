import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/form/form_configuration.dart';
import 'package:mass_pro/data_run/form/form_to_q_field_models.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/org_unit_picker/model/data_model.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/fields/q_field_widget_factory.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/get_error_widget.dart';
import 'package:mass_pro/data_run/screens/form_submission_list/model/submission_list.provider.dart';
import 'package:mass_pro/generated/l10n.dart';

class SubmissionCreationDialog extends ConsumerStatefulWidget {
  const SubmissionCreationDialog(
      {super.key,
      required this.form,
      required this.activity,
      required this.team});

  final String form;
  final String activity;
  final String team;

  @override
  SubmissionCreationDialogState createState() =>
      SubmissionCreationDialogState();
}

class SubmissionCreationDialogState
    extends ConsumerState<SubmissionCreationDialog> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;
  String? _orgUnitUid;

  // late final String form;

  // late final String activity;
  // late final String team;

  // late final int latestFormVersion;
  //
  // @override
  // void initState() {
  //   // final Bundle eventBundle = Get.arguments as Bundle;
  //   // form = eventBundle.getString(FORM_UID)!;
  //   // activity = eventBundle.getString(ACTIVITY_UID)!;
  //   // team = eventBundle.getString(TEAM_UID)!;
  //   // latestFormVersion = eventBundle.getInt(FORM_VERSION)!;
  //   super.initState();
  // }

  Future<String?> _createEntity(FormConfiguration formConfiguration) async {
    final submissionInitialRepository =
        ref.read(submissionListProvider(form: widget.form).notifier);

    return submissionInitialRepository.createSubmission(
        activityUid: widget.activity,
        orgUnit: _orgUnitUid!,
        teamUid: widget.team,
        formData: Map<String, dynamic>.from(_formKey.currentState!.value));
  }

  Future<void> createAndPopupWithResult(
      BuildContext context, FormConfiguration formConfiguration) async {
    setState(() {
      _isLoading = true;
    });

    String? syncableId;
    try {
      if (_formKey.currentState?.validate() ?? false) {
        syncableId = await _createEntity(formConfiguration);

        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pop(syncableId);
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${S.of(context).errorOpeningNewForm}: $e')),
      );
    }
  }

  String? _getInitialUid(FormConfiguration formConfig) {
    String? uid =
        formConfig.isSingleOrgUnit ? formConfig.orgUnitTreeUids.first : null;
    if (uid != null) {
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      //   setState(() {
      _orgUnitUid = formConfig.orgUnitTreeUids.first;
      //   });
      // });
    }

    return uid;
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<FormConfiguration> formConfigAsync =
        ref.watch(formConfigurationProvider(form: widget.form));

    return switch (formConfigAsync) {
      AsyncValue(error: final error?, stackTrace: final stackTrace?) =>
        getErrorWidget(error, stackTrace),
      AsyncValue(valueOrNull: final formConfig?) => AlertDialog(
          surfaceTintColor: Theme.of(context).colorScheme.primary,
          shadowColor: Theme.of(context).colorScheme.shadow,
          title: Column(
            children: [
              Text('${S.of(context).openNewForm}:',
                  style: Theme.of(context).textTheme.titleMedium),
              Text(formConfig.label,
                  style: Theme.of(context).textTheme.titleLarge)
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                FormBuilder(
                  key: _formKey,
                  onChanged: () {
                    _formKey.currentState!.save();
                    debugPrint('${_formKey.currentState!.value}');
                    _formKey.currentState!.save();
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FormBuilderField<String?>(
                          key: ValueKey('FormBuilderField_${formConfig.form}'),
                          name: 'orgUnit',
                          initialValue: _getInitialUid(formConfig),
                          builder: (field) {
                            final dataSource = ref.watch(
                                treeNodeDataSourceProvider(
                                    selectableUids:
                                        formConfig.orgUnitTreeUids));
                            return switch (dataSource) {
                              AsyncValue(
                                error: final error?,
                                stackTrace: final stackTrace?
                              ) =>
                                getErrorWidget(error, stackTrace),
                              AsyncValue(valueOrNull: final dataSource?) =>
                                OrgUnitPickerField(
                                  key: ValueKey('orgPicker_${formConfig.form}'),
                                  dataSource: dataSource,
                                  // initialValueUid: _getInitialUid(formConfig),
                                  onChanged: (value) {
                                    // debugPrint('### Value: $value');
                                    _orgUnitUid = value;
                                    field.didChange(value);
                                  },
                                ),
                              _ => const CircularProgressIndicator(),
                            };
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                ...formConfig.mainFields.values.map((f) {
                  final fieldModel = mapToModel(
                      field: f,
                      options: formConfig.optionLists.get(f.listName ?? ''));
                  final QFormFieldBuilder builder = ref
                      .watch(fieldWidgetFactoryProvider)
                      .getBuilder(fieldModel.valueType);

                  final Widget fieldWidget = builder.call(fieldModel);

                  if (!fieldModel.isVisible) {
                    return const SizedBox.shrink();
                  }

                  return fieldWidget;
                }),
                if (_isLoading)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(S.of(context).cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              onPressed: _isLoading
                  ? null
                  : () => createAndPopupWithResult(context, formConfig),
              child: Text(S.of(context).open),
            ),
          ],
        ),
      _ => const CircularProgressIndicator(),
    };
  }
}
