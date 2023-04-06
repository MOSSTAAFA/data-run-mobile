import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../commons/custom_widgets/mixins/keyboard_manager.dart';
import '../../commons/extensions/standard_extensions.dart';
import '../data/data_integrity_check_result.dart';
import '../model/field_ui_model.dart';
import '../model/form_repository_records.dart';
import '../model/info_ui_model.dart';
import '../model/row_action.dart';
import '../model/section_ui_model_impl.dart';
import 'data_entry_list.widget.dart';
import 'event/list_view_ui_events.dart';
import 'form_view_model.dart';
import 'intent/form_intent.dart';
import 'provider/enrollment_result_dialog_ui_provider.dart';

class FormView extends StatefulWidget {
  FormView({super.key,
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
  // Will be comming from event or Enrollment Widgets
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

  //// in DataEntryAdapter
  Map<String, int> sectionPositions = {};

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> with KeyboardManager {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<FieldUiModel>>(
        stream: widget.viewModel.items,
        builder:
            (BuildContext context, AsyncSnapshot<List<FieldUiModel>> snapshot) {
          if (snapshot.hasError) {
            return Text(
                'FormView items Stream snapshot Error: ${snapshot.error}');
          }
          if (!snapshot.hasData) {
            return const SizedBox();
          }

          _render(snapshot.data!);

          // in Adapter
          _swap(snapshot.data!, () {
            // dataEntryHeaderHelper.onItemsUpdatedCallback();
            widget.viewModel.onItemsRendered();
            widget.onFieldItemsRendered?.call(snapshot.data!.isEmpty);
          });

          return DataEntryList(
            fields: snapshot.data!,
            onIntent: (FormIntent intent) {
              if (intent is OnNext) {
                // scrollToPosition(intent.position!);
              }
              _intentHandler(intent);
            },
            onListViewUiEvents: (ListViewUiEvents uiEvent) {
              _uiEventHandler(uiEvent);
            },
            searchStyle: widget.needToForceUpdate,
          );
        });
  }

  void _setObservers() {
    widget.viewModel.savedValue.listen((rowAction) {
      widget.onItemChangeListener?.let((it) => it(rowAction));
    });

    widget.viewModel.queryData.listen((rowAction) {
      if (widget.needToForceUpdate) {
        widget.onItemChangeListener?.let((it) => it(rowAction));
      }
    });

    widget.viewModel.items.listen((items) {
      _render(items!);
    });

    widget.viewModel.loading.listen((loading) {
      if (widget.onLoadingListener != null) {
        widget.onLoadingListener?.let((it) => it(loading));
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

    widget.viewModel.showToast.listen((message) {
      // Toast.makeText(context, message, Toast.LENGTH_SHORT).show();
    });

    widget.viewModel.focused.listen((items) {
      widget.onFocused?.let((it) => it());
    });

    widget.viewModel.showInfo.listen((infoUiModel) {
      _showInfoDialog(infoUiModel!);
    });

    widget.viewModel.dataIntegrityResult.listen((result) {
      _handleDataIntegrityResult(result!);
    });

    widget.viewModel.completionPercentage.listen((percentage) {
      widget.completionListener?.let((it) => it(percentage!));
    });

    widget.viewModel.calculationLoop.listen((displayLoopWarning) {
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

  _render(List<FieldUiModel> items) {
    widget.viewModel.calculateCompletedFields();
    // TODO(NMC): implementing Rules
    // viewModel.updateConfigurationErrors();
    widget.viewModel.displayLoopWarningIfNeeded();
    _handleKeyBoardOnFocusChange(items);
  }

  _showInfoDialog(InfoUiModel infoUiModel) {}

  _handleDataIntegrityResult(
      DataIntegrityCheckResult dataIntegrityCheckResult) {}

  _showLoopWarning() {}

  void _handleKeyBoardOnFocusChange(List<FieldUiModel> items) {
    items
        .firstWhereOrNull((FieldUiModel it) => it.focused)
        ?.let((fieldUiModel) =>
        fieldUiModel.valueType?.let((valueType) {
          if (!widget.viewModel.valueTypeIsTextField(valueType)) {
            hideKeyboard(context);
          }
        }));
  }

  void _intentHandler(FormIntent intent) {
    widget.viewModel.submitIntent(intent);
  }

  void _swap(List<FieldUiModel> updates, void Function() commitCallback) {
    widget.sectionPositions = {};
    for (final fieldViewModel in updates) {
      if (fieldViewModel is SectionUiModelImpl) {
        widget.sectionPositions[fieldViewModel.uid] =
            updates.indexOf(fieldViewModel);
      }
    }

    // submitList(updates) {
    commitCallback.call();
    // }
  }
}
