import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/commons/custom_widgets/async_value.widget.dart';
import 'package:mass_pro/data_run/screens/form_submission_list/model/submission_list.provider.dart';

class SubmissionsChips extends ConsumerWidget {
  const SubmissionsChips({
    super.key,
    required this.form,
  });

  final String form;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final submissionStatusAsyncValue =
        ref.watch(submissionStatusModelProvider(form: form));

    return AsyncValueWidget(
      value: submissionStatusAsyncValue,
      data: (entityCountByStatus) => Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: <Widget>[
          /// Sent
          Chip(
              avatar: CircleAvatar(
                  foregroundColor: entityCountByStatus.synced > 0
                      ? Colors.green
                      : Colors.grey,
                  child: const Icon(Icons.cloud_done)),
              label: Text('${entityCountByStatus.synced}')),

          /// Finished
          Chip(
            avatar: CircleAvatar(
                foregroundColor:
                    entityCountByStatus.toPost > 0 ? Colors.blue : Colors.grey,
                child: const Icon(Icons.cloud_upload)),
            label: Text('${entityCountByStatus.toPost}'),
          ),

          /// Not Finished
          Chip(
            avatar: CircleAvatar(
              foregroundColor: entityCountByStatus.toUpdate > 0
                  ? Colors.orange
                  : Colors.grey,
              child: const Icon(Icons.update),
            ),
            label: Text('${entityCountByStatus.toUpdate}'),
          ),

          /// Errors
          Chip(
            avatar: const CircleAvatar(
              child: Icon(Icons.error),
            ),
            label: Text('${entityCountByStatus.withError}'),
          ),
        ],
      ),
    );
  }
}
