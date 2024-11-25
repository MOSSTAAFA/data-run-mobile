import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:datarun/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:datarun/data_run/screens/form/element/validation/form_element_validator.dart';
import 'package:datarun/data_run/screens/form/field_widgets/code_scanner/reactive_barcode_scanner.dart';
import 'package:datarun/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
import 'package:flutter/material.dart';
import 'package:datarun/data_run/screens/form/element/form_element.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class QBarcodeReaderField<T> extends ConsumerWidget {
  final FieldInstance<T> element;

  const QBarcodeReaderField({Key? key, required this.element})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formInstance = ref
        .watch(
            formInstanceProvider(formMetadata: FormMetadataWidget.of(context)))
        .requireValue;
    final control =
        formInstance.form.control(element.pathRecursive) as FormControl<T>;

    return ReactiveCodeScanField<T>(
        formControl: control,
        validationMessages: validationMessages(context),
        decoration: InputDecoration(
          enabled: control.enabled,
          labelText: element.label,
        ));
  }
}
