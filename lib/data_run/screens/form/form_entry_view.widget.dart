import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element_widgets/element.widget.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
import 'package:mass_pro/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:mass_pro/data_run/screens/form/reactive_elements/reactive_field_instance_builder.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:scrollable/exports.dart';

class FormInstanceEntryView extends StatefulHookConsumerWidget {
  final ScrollController scrollController;

  const FormInstanceEntryView({
    super.key,
    required this.scrollController,
  });

  @override
  FormInstanceEntryViewState createState() => FormInstanceEntryViewState();
}

class FormInstanceEntryViewState extends ConsumerState<FormInstanceEntryView> {
  final _entryFormKey = GlobalKey<ReactiveFormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final formInstance = ref
        .watch(
            formInstanceProvider(formMetaData: FormMetadataWidget.of(context)))
        .requireValue;
    return ReactiveFormBuilder(
      key: _entryFormKey,
      form: () => formInstance.form,
      builder: (BuildContext context, FormGroup formGroup, Widget? child) {
        return KeyboardDismiss(
          child: SingleChildScrollView(
            controller: widget.scrollController,
            child: Column(
              children: formInstance.elements.values
                  .map(
                    (element) => ReactiveFieldInstanceBuilder(
                        formElement: element,
                        builder: (BuildContext context,
                            FormElementInstance<dynamic> elementState,
                            Widget? child) {

                        },
                        child: ElementWidget(element: element)),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
