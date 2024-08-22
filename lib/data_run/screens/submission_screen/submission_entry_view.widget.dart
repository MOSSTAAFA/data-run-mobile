import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/get_error_widget.dart';
import 'package:mass_pro/data_run/screens/submission_form/form_field.widget.dart';
import 'package:mass_pro/data_run/screens/submission_form/model/form_fields_state_notifier.dart';
import 'package:mass_pro/data_run/screens/submission_form/model/q_field.model.dart';

class SubmissionEntryView extends StatefulWidget {
  const SubmissionEntryView({super.key});

  @override
  State<SubmissionEntryView> createState() => _SubmissionEntryViewState();
}

class _SubmissionEntryViewState extends State<SubmissionEntryView> {
  @override
  Widget build(BuildContext context) {
    // return switch (fields) {
    //   AsyncValue(:final Object error?, :final stackTrace) =>
    //       getErrorWidget(error, stackTrace),
    //   AsyncValue(valueOrNull: final qfields?) =>
    //
    //   _ => const SizedBox.shrink(),
    // };

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Consumer(
        builder: (context, ref, child) {
          final AsyncValue<IMap<String, QFieldModel>> fields =
              ref.watch(formFieldsStateNotifierProvider);
          return switch (fields) {
            AsyncValue(:final Object error?, :final stackTrace) =>
              getErrorWidget(error, stackTrace),
            AsyncValue(valueOrNull: final qfields?) => ListView(
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
            _ => const SizedBox.shrink(),
          };

          ;
        },
      ),
    );
  }
}
