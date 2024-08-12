import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/commons/custom_widgets/async_value.widget.dart';
import 'package:mass_pro/data_run/form/form_configuration.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';
import 'package:mass_pro/data_run/screens/project_details/entity_creation_dialog/dynamic_form_field.widget.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_item.model.dart';
import 'package:mass_pro/data_run/submission/submission.dart';
import 'package:mass_pro/data_run/submission/submission_initial_repository.dart';
import 'package:mass_pro/generated/l10n.dart';

class EntityCreationDialog extends ConsumerStatefulWidget {
  const EntityCreationDialog({super.key, required this.formModel});
  final FormListItemModel formModel;

  @override
  EntityCreationDialogState createState() => EntityCreationDialogState();
}

class EntityCreationDialogState extends ConsumerState<EntityCreationDialog> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
  }

  Future<String?> _createEntity(FormConfiguration formConfiguration) async {
    final SubmissionInitialRepository submissionInitialRepository = ref.read(
        submissionInitialRepositoryProvider(
            formConfiguration: formConfiguration));

    return submissionInitialRepository.createSyncable(
        activityUid: widget.formModel.activity!,
        teamUid: widget.formModel.team!,
        formData: Map<String, String?>.from(_formKey.currentState!.value));
  }

  Future<void> createAndPopupWithResult(
      BuildContext context, FormConfiguration formConfiguration) async {
    setState(() {
      _isLoading = true;
    });

    String? syncableId;
    try {
      if (_formKey.currentState?.validate() ?? false) {
        // Call the function to create entity
        _formKey.currentState!.save();
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

  @override
  Widget build(BuildContext context) {
    final formConfigAsync =
        ref.watch(formConfigurationProvider(widget.formModel.form));

    return AsyncValueWidget(
        value: formConfigAsync,
        data: (formConfig) => AlertDialog(
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
                    //
                    FormBuilder(
                      key: _formKey,
                      clearValueOnUnregister: true,
                      onChanged: () {
                        _formKey.currentState!.save();
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: widget.formModel.fields
                                ?.map((QFieldModel fieldModel) =>
                                    DynamicFormFieldWidget(
                                        fieldModel: fieldModel))
                                .toList() ??
                            <Widget>[],
                      ),
                    ),
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
            ));
  }
}
