import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/org_unit/model/data_model.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/get_error_widget.dart';
import 'package:mass_pro/data_run/screens/submission_screen/model/submission_screen.provider.dart';

class SubmissionInitialView extends ConsumerStatefulWidget {
  SubmissionInitialView(
      {super.key,
      this.initialOrgUnit,
      required this.submissionId,
      required List<String> selectableUids})
      : this.selectableUids = selectableUids;

  final String? initialOrgUnit;
  final String submissionId;
  final List<String> selectableUids;

  @override
  SubmissionInitialViewState createState() => SubmissionInitialViewState();
}

class SubmissionInitialViewState extends ConsumerState<SubmissionInitialView> {
  String? _initialOrgUnitId;

  @override
  void initState() {
    super.initState();
    _initialOrgUnitId = widget.initialOrgUnit;
  }

  @override
  Widget build(BuildContext context) {
    final dataSourceValue = ref.watch(
        treeNodeDataSourceProvider(selectableUids: widget.selectableUids.lock));

    return switch (dataSourceValue) {
      AsyncValue(:final Object error?, :final stackTrace) =>
        getErrorWidget(error, stackTrace),
      AsyncValue(valueOrNull: final dataSource?) => OrgUnitPickerField(
        key: ValueKey('orgUnit_${widget.submissionId}'),
          dataSource: dataSource,
          initialValueUid: _initialOrgUnitId,
          onChanged: (value) {
            debugPrint('### onChanged Value: $value');
          },
          onSubmitted: (value) {
            debugPrint('### onSubmitted Value: $value');
            ref
                .watch(submissionProvider(submissionId: widget.submissionId).notifier)
                .updateOrgUnit(value);
          },
          onSaved: (value) {
            debugPrint('### onSaved Value: $value');
            ref
                .watch(submissionProvider(submissionId: widget.submissionId).notifier)
                .updateOrgUnit(value);
          },
        ),
      _ => const SizedBox.shrink(),
    };
  }
}
