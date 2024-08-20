import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/submission_form/model/q_field.model.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/form/q_field_widget_factory.dart';
import 'package:mass_pro/form/ui/intent/form_intent.dart';
import 'package:mass_pro/form/ui/view_model/form_pending_intents.dart';

class FormFieldWidget extends ConsumerStatefulWidget {
  const FormFieldWidget({super.key, required this.qFieldModel});

  final QFieldModel qFieldModel;

  @override
  ConsumerState<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends ConsumerState<FormFieldWidget> {
  Widget getErrorWidget(Object e) {
    return Center(
      child: Text(
        e.toString(),
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(color: Colors.red),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final QFormFieldBuilder builder = ref
        .watch(fieldWidgetFactoryProvider)
        .getBuilder(widget.qFieldModel.valueType);

    final Widget fieldWidget =
        builder.call(widget.qFieldModel.setCallback(intentCallback: onIntent));

    if (!widget.qFieldModel.isVisible) {
      return const SizedBox.shrink();
    }

    return fieldWidget;
  }

  void onIntent(FormIntent intent) {
    ref
        .read(formPendingIntentsProvider.notifier)
        .submitIntent((FormIntent current) => intent);
  }
}
