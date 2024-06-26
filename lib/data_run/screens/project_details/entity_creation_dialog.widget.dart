import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/form/syncable_query_mapping_repository.dart';
import 'package:mass_pro/data_run/screens/form/dynamic_form_field.widget.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_item.model.dart';

class EntityCreationDialog extends ConsumerStatefulWidget {
  // final FormListItemModel formListModel;

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

  Future<String?> _createEntity(FormListItemModel formModel) async {
    final syncableEntityInitialRepository = ref.read(
        syncableEntityInitialRepositoryProvider(formCode: formModel.formCode));

    return syncableEntityInitialRepository.createSyncable(
        activityUid: formModel.activity!,
        teamUid: formModel.team!,
        mainFieldValues: formModel.fields);
  }

  Future<void> createAndPopupWithResult(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    String? syncableId;
    try {
      if (_formKey.currentState?.validate() ?? false) {
        // Call the function to create entity
        syncableId = await _createEntity(widget.formModel);

        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pop(syncableId);
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }

      // // After adding the entity, close the dialog
      // // Check if the context is still mounted
      // if (!context.mounted) {
      //   return;
      // }
      // Close the dialog if entity creation is successful
    } catch (e) {
      // Handle the error here, show a snackbar, or set an error state
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error creating entity: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create Entity'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            //
            FormBuilder(
              key: _formKey,
              clearValueOnUnregister: true,
              onPopInvoked: (bool value) {
                /// show confirm, save, complete
                debugPrint('showDialog onPopInvoked ');
              },
              onChanged: () {
                _formKey.currentState!.save();
                debugPrint(
                    'form _formKey State Changed: ${_formKey.currentState!.value.toString()}');
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: widget.formModel.fields
                        ?.map((fieldModel) =>
                            DynamicFormFieldWidget(fieldModel: fieldModel))
                        .toList() ??
                    [],
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
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Submit'),
          onPressed:
              _isLoading ? null : () => createAndPopupWithResult(context),
        ),
      ],
    );
  }
}
