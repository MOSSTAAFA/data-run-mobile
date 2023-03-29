import 'package:flutter/material.dart';
import '../../commons/extensions/standard_extensions.dart';
import '../data/data_integrity_check_result.dart';
import '../model/field_ui_model.dart';
import '../model/form_repository_records.dart';
import '../model/info_ui_model.dart';
import '../model/row_action.dart';
import 'event/list_view_ui_events.dart';
import 'form_view_model.dart';
import 'provider/enrollment_result_dialog_ui_provider.dart';

class FormView extends StatelessWidget {

  const FormView(
      {super.key,
      required this.needToForceUpdate,
      required this.viewModel,

      /// Sent ser. through
      this.records,
      this.onItemChangeListener,
      this.onLoadingListener,
      this.onFocused,
      this.onFinishDataEntry,
      this.onActivityForResult,
      this.completionListener,
      this.onDataIntegrityCheck,
      this.onFieldItemsRendered,
      this.onSavePicture,
      this.resultDialogUiProvider});
  // final LocationProvider? locationProvider;
  // TODO(NMC): make Injectable
  final bool needToForceUpdate;

  // TODO(NMC): make Injectable
  final EnrollmentResultDialogUiProvider? resultDialogUiProvider;

  // TODO(NMC): maybe make Injectable
  final FormViewModel viewModel;

  /// Sent ser. through
  // TODO(NMC): make Injectable
  final FormRepositoryRecords? records;

  final void Function(RowAction)? onItemChangeListener;
  final void Function(bool)? onLoadingListener;
  final void Function()? onFocused;
  final void Function()? onFinishDataEntry;
  final void Function()? onActivityForResult;
  final void Function(double)? completionListener;
  final void Function(DataIntegrityCheckResult)? onDataIntegrityCheck;
  final void Function(bool)? onFieldItemsRendered;

  //
  final void Function(String)? onSavePicture;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void _setObservers() {
    viewModel.savedValue.listen((rowAction) {
      onItemChangeListener?.let((it) => it(rowAction));
    });

    viewModel.queryData.listen((rowAction) {
      if (needToForceUpdate) {
        onItemChangeListener?.let((it) => it(rowAction));
      }
    });

    viewModel.items.listen((items) {
      _render(items!);
    });

    viewModel.loading.listen((loading) {
      if (onLoadingListener != null) {
        onLoadingListener?.let((it) => it(loading));
      } else {
        if (loading) {
          // binding.progress.show();
        } else {
          // binding.progress.hide();
        }
      }
    });

    // viewModel.confError.listen((confErrors) {
    //   displayConfigurationErrors(confErrors);
    // });

    viewModel.showToast.listen((message) {
      // Toast.makeText(context, message, Toast.LENGTH_SHORT).show();
    });

    viewModel.focused.listen((items) {
      onFocused?.let((it) => it());
    });

    viewModel.showInfo.listen((infoUiModel) {
      _showInfoDialog(infoUiModel!);
    });

    viewModel.dataIntegrityResult.listen((result) {
      _handleDataIntegrityResult(result!);
    });

    viewModel.completionPercentage.listen((percentage) {
      completionListener?.let((it) => it(percentage!));
    });

    viewModel.calculationLoop.listen((displayLoopWarning) {
      if (displayLoopWarning) {
        _showLoopWarning();
      }
    });
  }

  void _uiEventHandler(ListViewUiEvents uiEvent) {
    uiEvent.map(
      openCustomCalendar: (uiEvent) => _showCustomCalendar(uiEvent),
      openYearMonthDayAgeCalendar: (uiEvent) =>
          _showYearMonthDayAgeCalendar(uiEvent),
      openTimePicker: (uiEvent) => _showTimePicker(uiEvent),
      showDescriptionLabelDialog: (uiEvent) =>
          _showDescriptionLabelDialog(uiEvent),
      requestCurrentLocation: (uiEvent) => _requestCurrentLocation(uiEvent),
      requestLocationByMap: (uiEvent) => _requestLocationByMap(uiEvent),
      displayQRCode: (uiEvent) => _displayQRImage(uiEvent),
      scanQRCode: (uiEvent) => _requestQRScan(uiEvent),
      openOrgUnitDialog: (uiEvent) => _showOrgUnitDialog(uiEvent),
      addImage: (uiEvent) => _requestAddImage(uiEvent),
      showImage: (uiEvent) => _showFullPicture(uiEvent),
      openOptionSetDialog: (uiEvent) => _showOptionSetDialog(uiEvent),
      copyToClipboard: (uiEvent) => _copyToClipboard(uiEvent.value),
    );
  }

  _showCustomCalendar(OpenCustomCalendar uiEvent) {}

  _showYearMonthDayAgeCalendar(OpenYearMonthDayAgeCalendar uiEvent) {}

  _showTimePicker(OpenTimePicker uiEvent) {}

  _showDescriptionLabelDialog(ShowDescriptionLabelDialog uiEvent) {}

  _requestCurrentLocation(RequestCurrentLocation uiEvent) {}

  _requestLocationByMap(RequestLocationByMap uiEvent) {}

  _displayQRImage(DisplayQRCode uiEvent) {}

  _requestQRScan(ScanQRCode uiEvent) {}

  _showOrgUnitDialog(OpenOrgUnitDialog uiEvent) {}

  _requestAddImage(AddImage uiEvent) {}

  _showFullPicture(ShowImage uiEvent) {}

  _showOptionSetDialog(OpenOptionSetDialog uiEvent) {}

  _copyToClipboard(String? value) {}

  _render(List<FieldUiModel> list) {}

  _showInfoDialog(InfoUiModel infoUiModel) {}

  _handleDataIntegrityResult(
      DataIntegrityCheckResult dataIntegrityCheckResult) {}

  _showLoopWarning() {}
}
