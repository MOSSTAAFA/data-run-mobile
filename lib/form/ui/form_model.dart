import 'package:equatable/equatable.dart';

import '../data/data_integrity_check_result.dart';
import '../model/info_ui_model.dart';
import '../model/row_action.dart';

class FormModel with EquatableMixin {
  FormModel(
      {
        // this.loading = true,
      this.showToast,
      // this.focused,
      this.showInfo,
      this.savedValue,
      this.queryData,
      this.dataIntegrityResult,
      // this.completionPercentage = 0,
      // this.calculationLoop = false,
      // this.pendingIntents
      });

  // final bool loading;
  final String? showToast;
  // final bool? focused;
  final InfoUiModel? showInfo;

  final RowAction? savedValue;

  final RowAction? queryData;

  final DataIntegrityCheckResult? dataIntegrityResult;

  // final double completionPercentage;

  // final bool calculationLoop;

  // final FormIntent? pendingIntents;

  FormModel copyWith({
    // bool? loading,
    String? showToast,
    // bool? focused,
    InfoUiModel? showInfo,
    RowAction? savedValue,
    RowAction? queryData,
    DataIntegrityCheckResult? dataIntegrityResult,
    // double? completionPercentage,
    // bool? calculationLoop,
    // FormIntent? pendingIntents,
  }) {
    return FormModel(
      // loading: loading ?? this.loading,
      showToast: showToast ?? this.showToast,
      // focused: focused ?? this.focused,
      showInfo: showInfo ?? this.showInfo,
      savedValue: savedValue ?? this.savedValue,
      queryData: queryData ?? this.queryData,
      dataIntegrityResult: dataIntegrityResult ?? this.dataIntegrityResult,
      // completionPercentage: completionPercentage ?? this.completionPercentage,
      // calculationLoop: calculationLoop ?? this.calculationLoop,
      // pendingIntents: pendingIntents ?? this.pendingIntents,
    );
  }

  @override
  List<Object?> get props => [
        // loading,
        showToast,
        // focused,
        showInfo,
        savedValue,
        queryData,
        dataIntegrityResult,
        // completionPercentage,
        // calculationLoop,
        // pendingIntents
      ];
}
