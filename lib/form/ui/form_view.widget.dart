import 'package:d2_remote/core/common/value_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:mass_pro/form/ui/form_view_providers.dart';

import '../../commons/custom_widgets/mixins/keyboard_manager.dart';
import '../../commons/extensions/standard_extensions.dart';
import '../data/data_integrity_check_result.dart';
import '../model/field_ui_model.dart';
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
      // this.records,
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
  // final FormRepositoryRecords? records;

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
  @override
  Widget build(BuildContext context) {
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
    _setObservers();
    super.initState();
  }

  void _setObservers() {
    ref.listenManual<bool>(loadingProvider,
        (previous, next) => widget.onLoadingListener?.call(next));

    ref.listenManual<RowAction?>(
        savedValueProvider,
        (previous, next) => next
            ?.let((rowAction) => widget.onItemChangeListener?.call(rowAction)));

    ref.listenManual<RowAction?>(
        queryDataProvider,
        (previous, next) => next?.let((rowAction) {
              if (widget.needToForceUpdate) {
                widget.onItemChangeListener?.let((it) => it(rowAction));
              }
            }));

    // ref
    //     .watch(itemsProvider)
    //     .let((AsyncValue<List<FieldUiModel>> items) => items.when(
    //           loading: () {},
    //           data: (List<FieldUiModel>? data) => _render(data ?? []),
    //           error: (Object error, StackTrace stackTrace) =>
    //               _error = error.toString(),
    //         ));

    // ref.watch(loadingProvider).let((bool it) => _loading = it);

    // viewModel.confError.listen((confErrors) {
    //   displayConfigurationErrors(confErrors);
    // });

    ref.listenManual<String?>(showToastProvider,
        (previous, next) => next?.let((it) => showToast(it)));

    ref.listenManual<bool?>(focusedProvider,
        (previous, next) => next.let((it) => widget.onFocused?.call()));

    ref.listenManual<InfoUiModel?>(
        showInfoProvider,
        (previous, next) =>
            next?.let((infoUiModel) => _showInfoDialog(infoUiModel)));

    ref.listenManual<DataIntegrityCheckResult?>(
        dataIntegrityResultValueProvider,
        (previous, next) =>
            next?.let((result) => _handleDataIntegrityResult(result)));

    ref.listenManual<AsyncValue<double>>(
        completionPercentageValueProvider,
        (previous, next) => next.let((percentage) =>
            widget.onPercentageUpdate?.call(percentage.value ?? 0)));

    ref.listenManual<AsyncValue<bool>>(
        calculationLoopValueProvider,
        (previous, next) => next.let((displayLoopWarning) =>
            displayLoopWarning.value ?? false ? _showLoopWarning() : null));

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

  void _handleKeyBoardOnFocusChange(List<FieldUiModel> items) {
    items.firstWhereOrNull((FieldUiModel it) => it.focused)?.let(
        (FieldUiModel fieldUiModel) =>
            fieldUiModel.valueType?.let((ValueType valueType) {
              if (!ref
                  .read(formViewModelProvider)
                  .valueTypeIsTextField(valueType)) {
                hideTheKeyboard(context);
              }
            }));
  }

  void _intentHandler(FormIntent intent) {
    ref.read(formViewModelProvider).submitIntent(intent);
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
    _intentHandler(FormIntent.onClear());
  }

  void onBackPressed() {
    ref
        .read(formViewModelProvider)
        .runDataIntegrityCheck(backButtonPressed: true);
  }

  void onSaveClick() {
    onEditionFinish();
    ref.read(formViewModelProvider).saveDataEntry();
  }

  void reload() {
    ref.read(itemsProvider.notifier).loadData();
  }
}
