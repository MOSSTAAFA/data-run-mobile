import 'package:d2_remote/core/common/value_type.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../../commons/custom_widgets/mixins/keyboard_manager.dart';
import '../../commons/extensions/standard_extensions.dart';
import '../../commons/helpers/iterable.dart';
import '../data/data_integrity_check_result.dart';
import '../model/field_ui_model.dart';
import '../model/form_repository_records.dart';
import '../model/info_ui_model.dart';
import '../model/row_action.dart';
import '../model/section_ui_model_impl.dart';
import 'data_entry_items_list.widget.dart';
import 'event/list_view_ui_events.dart';
import 'form_view_model.dart';
import 'intent/form_intent.dart';
import 'provider/enrollment_result_dialog_ui_provider.dart';

class FormView extends ConsumerStatefulWidget {
  FormView(
      {super.key,
      this.needToForceUpdate = false,

      /// Sent ser. through
      required this.records,
      this.onItemChangeListener,
      this.onLoadingListener,
      this.onFocused,
      this.onFinishDataEntry,
      this.onActivityForResult,
      this.onPercentageUpdate,
      this.onDataIntegrityCheck,
      this.onFieldItemsRendered,
      this.onSavePicture,
      this.resultDialogUiProvider});

  // final LocationProvider? locationProvider;
  // TODO (NMC): make Injectable
  final bool needToForceUpdate;

  // TODO(NMC): make Injectable
  final EnrollmentResultDialogUiProvider? resultDialogUiProvider;

  /// Sent ser. through
  // Will be comming from event or Enrollment Widgets
  final FormRepositoryRecords records;

  final void Function(RowAction rowAction)? onItemChangeListener;
  final void Function(bool loading)? onLoadingListener;
  final void Function()? onFocused;
  final void Function()? onFinishDataEntry;
  final void Function()? onActivityForResult;
  final void Function(double percentage)? onPercentageUpdate;
  final void Function(DataIntegrityCheckResult result)? onDataIntegrityCheck;
  final void Function(bool fieldItemsRendered)? onFieldItemsRendered;

  //
  final void Function(String)? onSavePicture;

  //// in DataEntryAdapter
  Map<String, int> sectionPositions = {};

  @override
  ConsumerState<FormView> createState() => _FormViewState();
}

class _FormViewState extends ConsumerState<FormView> with KeyboardManager {
  late final FormViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final items = ref.watch(itemsProvider);
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: DataEntryItemsList(
          // searchStyle: widget.needToForceUpdate,
          ),
    );
    // return StreamBuilder<List<FieldUiModel>>(
    //     stream: widget.viewModel.items,
    //     builder:
    //         (BuildContext context, AsyncSnapshot<List<FieldUiModel>> snapshot) {
    //       if (snapshot.hasError) {
    //         return Text(
    //             'FormView items Stream snapshot Error: ${snapshot.error}');
    //       }
    //       if (!snapshot.hasData) {
    //         return const SizedBox();
    //       }

    //       _render(snapshot.data!);

    //       // in Adapter
    //       _swap(snapshot.data!, () {
    //         // dataEntryHeaderHelper.onItemsUpdatedCallback();
    //         widget.viewModel.onItemsRendered();
    //         widget.onFieldItemsRendered?.call(snapshot.data!.isEmpty);
    //       });

    //       return DataEntryList(
    //         fields: snapshot.data!,
    //         onIntent: (FormIntent intent) {
    //           if (intent is OnNext) {
    //             // scrollToPosition(intent.position!);
    //           }
    //           _intentHandler(intent);
    //         },
    //         onListViewUiEvents: (ListViewUiEvents uiEvent) {
    //           _uiEventHandler(uiEvent);
    //         },
    //         searchStyle: widget.needToForceUpdate,
    //       );
    //     });
  }

  @override
  void initState() {
    viewModel = ref.read(formViewModelProvider(widget.records));
    Future(() => viewModel.loadData());
    _setObservers();
    super.initState();
  }

  void _setObservers() {
    ref.listenManual<bool>(
        formModelInstanceProvider.select((formModel) => formModel.loading),
        (previous, next) => widget.onLoadingListener?.call(next));

    ref.listenManual<RowAction?>(
        formModelInstanceProvider.select((formModel) => formModel.savedValue),
        (previous, next) => next
            ?.let((rowAction) => widget.onItemChangeListener?.call(rowAction)));

    ref.listenManual<RowAction?>(
        formModelInstanceProvider.select((formModel) => formModel.queryData),
        (previous, next) => next?.let((rowAction) {
              if (widget.needToForceUpdate) {
                widget.onItemChangeListener?.let((it) => it(rowAction));
              }
            }));

    ref.listenManual<String?>(
        formModelInstanceProvider
            .select((formModel) => formModel.showToast),
        (previous, next) => next?.let((it) => showToast(it)));

    ref.listenManual<bool?>(
        formModelInstanceProvider
            .select((formModel) => formModel.focused),
        (previous, next) => next.let((it) => widget.onFocused?.call()));

    ref.listenManual<InfoUiModel?>(
        formModelInstanceProvider
            .select((formModel) => formModel.showInfo),
        (previous, next) =>
            next?.let((infoUiModel) => _showInfoDialog(infoUiModel)));

    ref.listenManual<DataIntegrityCheckResult?>(
        formModelInstanceProvider
            .select((formModel) => formModel.dataIntegrityResult),
        (previous, next) =>
            next?.let((result) => _handleDataIntegrityResult(result)));

    ref.listenManual<double>(
        formModelInstanceProvider
            .select((formModel) => formModel.completionPercentage),
        (previous, next) => next
            .let((percentage) => widget.onPercentageUpdate?.call(percentage)));

    ref.listenManual<bool>(
        formModelInstanceProvider
            .select((formModel) => formModel.calculationLoop),
        (previous, next) => next.let((displayLoopWarning) =>
            displayLoopWarning ? _showLoopWarning() : null));

    ref.listenManual<FormIntent?>(uiIntentProvider,
        (previous, next) => next?.let((it) => _intentHandler(it)));

    ref.listenManual<ListViewUiEvents?>(uiEventProvider,
        (previous, next) => next?.let((it) => _uiEventHandler(it)));
  }

  void _uiEventHandler(ListViewUiEvents uiEvent) {
    uiEvent.map(
      openCustomCalendar: (OpenCustomCalendar uiEvent) =>
          _showCustomCalendar(uiEvent),
      openYearMonthDayAgeCalendar: (OpenYearMonthDayAgeCalendar uiEvent) =>
          _showYearMonthDayAgeCalendar(uiEvent),
      openTimePicker: (OpenTimePicker uiEvent) => _showTimePicker(uiEvent),
      showDescriptionLabelDialog: (ShowDescriptionLabelDialog uiEvent) =>
          _showDescriptionLabelDialog(uiEvent),
      requestCurrentLocation: (RequestCurrentLocation uiEvent) =>
          _requestCurrentLocation(uiEvent),
      requestLocationByMap: (RequestLocationByMap uiEvent) =>
          _requestLocationByMap(uiEvent),
      displayQRCode: (DisplayQRCode uiEvent) => _displayQRImage(uiEvent),
      scanQRCode: (ScanQRCode uiEvent) => _requestQRScan(uiEvent),
      openOrgUnitDialog: (OpenOrgUnitDialog uiEvent) =>
          _showOrgUnitDialog(uiEvent),
      addImage: (AddImage uiEvent) => _requestAddImage(uiEvent),
      showImage: (ShowImage uiEvent) => _showFullPicture(uiEvent),
      openOptionSetDialog: (OpenOptionSetDialog uiEvent) =>
          _showOptionSetDialog(uiEvent),
      copyToClipboard: (CopyToClipboard uiEvent) =>
          _copyToClipboard(uiEvent.value),
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

  _showInfoDialog(InfoUiModel infoUiModel) {}

  _handleDataIntegrityResult(DataIntegrityCheckResult result) {
    if (widget.onDataIntegrityCheck != null) {
      widget.onDataIntegrityCheck?.call(result);
    } else {
      result.maybeMap(
          successfulResult: (_) => widget.onFinishDataEntry?.call(),
          orElse: () => _showDataEntryResultDialog(result));
    }
  }

  void _showDataEntryResultDialog(DataIntegrityCheckResult result) {
    // resultDialogUiProvider?.provideDataEntryUiModel(result)?.let {
    //     BottomSheetDialog(
    //         bottomSheetDialogUiModel = it,
    //         onSecondaryButtonClicked = {
    //             if (result.allowDiscard) {
    //                 viewModel.discardChanges()
    //             }
    //             onFinishDataEntry?.invoke()
    //         }
    //     ).show(childFragmentManager, AlertBottomDialog::class.java.simpleName)
    // }
  }

  _showLoopWarning() {}

  void _intentHandler(FormIntent intent) {
    viewModel.submitIntent(intent);
  }

  void _swap(List<FieldUiModel> updates, void Function() commitCallback) {
    widget.sectionPositions = {};
    for (final FieldUiModel fieldViewModel in updates) {
      if (fieldViewModel is SectionUiModelImpl) {
        widget.sectionPositions[fieldViewModel.uid] =
            updates.indexOf(fieldViewModel);
      }
    }

    // submitList(updates) {
    commitCallback.call();
    // }
  }

  void onEditionFinish() {
    // binding.recyclerView.requestFocus();
  }

  int _negativeOrZero(String value) {
    if (value.isEmpty) {
      return 0;
    } else {
      return -(int.tryParse(value) ?? 0);
    }
  }

  void clearValues() {
    _intentHandler(const FormIntent.onClear());
  }

  void onBackPressed() {
    viewModel.runDataIntegrityCheck(backButtonPressed: true);
  }

  void onSaveClick() {
    onEditionFinish();
    viewModel.saveDataEntry();
  }

  void reload() {
    viewModel.loadData();
  }

  void _render(IList<FieldUiModel> items) {
    viewModel.calculateCompletedFields();
    // TODO(NMC): implementing Rules
    // viewModel.updateConfigurationErrors();
    viewModel.displayLoopWarningIfNeeded();
    viewModel.displayLoopWarningIfNeeded();

    _handleKeyBoardOnFocusChange(items);
  }

  void _handleKeyBoardOnFocusChange(IList<FieldUiModel> items) {
    items.firstOrNullWhere((FieldUiModel it) => it.focused)?.let(
        (FieldUiModel fieldUiModel) =>
            fieldUiModel.valueType?.let((ValueType valueType) {
              if (!viewModel.valueTypeIsTextField(valueType)) {
                hideTheKeyboard(context);
              }
            }));
  }
}
