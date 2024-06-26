import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/form/form_input_field.model.dart';
import 'package:mass_pro/data_run/screens/form/dynamic_form_field.widget.dart';

class FormFieldWidget extends ConsumerWidget {
  const FormFieldWidget(
      {super.key, required this.fieldModel, required this.fieldModelIndex});

  final FormFieldModel fieldModel;
  final int fieldModelIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexedFieldModel =
        ref.watch(fieldInputModelNotifierProvider(fieldModelIndex));

    return indexedFieldModel.maybeWhen(
      data: (FormFieldModel data) {
        return Visibility(
          visible: data.isVisible,
          child: DynamicFormFieldWidget(fieldModel: data),
        );
      },
      error: (Object e, _) => Center(
        child: Text(
          e.toString(),
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.red),
        ),
      ),
      orElse: () => const SizedBox.shrink(),
    );
  }
}
