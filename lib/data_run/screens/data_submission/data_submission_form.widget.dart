import 'package:d2_remote/modules/datarun/form/entities/dynamic_form.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataSubmissionFormWidget extends ConsumerWidget {
  const DataSubmissionFormWidget(this.form, {super.key});

  final DynamicForm form;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Placeholder();
    // return FormBuilder(
    //   key: _formKey,
    //   child: Column(
    //       children: form.fieldsList!
    //           .map<Widget>((field) => FormInputFieldWidget(
    //                 field: field,
    //               ))
    //           .toList()),
    // );
  }
}
