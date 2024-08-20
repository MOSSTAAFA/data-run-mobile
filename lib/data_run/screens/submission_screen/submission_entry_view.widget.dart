import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/get_error_widget.dart';
import 'package:mass_pro/data_run/screens/submission_form/form_field.widget.dart';
import 'package:mass_pro/data_run/screens/submission_form/model/form_fields_state_notifier.dart';
import 'package:mass_pro/data_run/screens/submission_form/model/q_field.model.dart';

class SubmissionEntryView extends ConsumerWidget {
  const SubmissionEntryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<IMap<String, QFieldModel>> fields =
        ref.watch(formFieldsStateNotifierProvider);
    return switch (fields) {
      AsyncValue(:final Object error?, :final stackTrace) =>
        getErrorWidget(error, stackTrace),
      AsyncValue(valueOrNull: final qfields?) => Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView(
            children: qfields.entries
                .map(
                  (MapEntry<String, QFieldModel> entry) => Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: FormFieldWidget(
                          key: ValueKey<String>(entry.key),
                          qFieldModel: entry.value,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      _ => const SizedBox.shrink(),
    };
  }
}
