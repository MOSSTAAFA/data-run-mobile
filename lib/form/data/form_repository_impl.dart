import 'package:d2_remote/core/common/value_type.dart';
import 'package:dartx/dartx_io.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../../commons/date/field_with_issue.dart';
import '../../commons/extensions/standard_extensions.dart';
import '../model/action_type.dart';
import '../model/field_ui_model.dart';
import '../model/row_action.dart';
import '../model/section_ui_model_impl.dart';
import '../model/store_result.dart';
import '../ui/provider/display_name_provider.dart';
import '../ui/validation/field_error_message_provider.dart';
import 'data_entry_repository.dart';
import 'data_integrity_check_result.dart';
import 'form_repository.dart';
import 'form_value_store.dart';

class FormRepositoryImpl implements FormRepository {
  // RuleEngineRepository? ruleEngineRepository;
  // RulesUtilsProvider? rulesUtilsProvider;
  // LegendValueProvider? legendValueProvider;

  FormRepositoryImpl({
    this.formValueStore,
    required this.fieldErrorMessageProvider,
    required this.displayNameProvider,
    this.dataEntryRepository,
    /*this.ruleEngineRepository,
      this.rulesUtilsProvider,
      this.legendValueProvider*/
  });

  static const int _loopThreshold = 5;

  final FormValueStore? formValueStore;
  final FieldErrorMessageProvider fieldErrorMessageProvider;
  final DisplayNameProvider displayNameProvider;
  final DataEntryRepository? dataEntryRepository;

  double _completionPercentage = 0.0;
  final IList<RowAction> _itemsWithError = IList();
  final Map<String, String> _mandatoryItemsWithoutValue = {};
  String? _openedSectionUid;
  IList<FieldUiModel> _itemList = IList();
  String? _focusedItemId;

  // RuleUtilsProviderResult? ruleEffectsResult;
  bool _runDataIntegrity = false;
  int _calculationLoop = 0;
  IList<FieldUiModel> _backupList = IList();

  @override
  Future<IList<FieldUiModel>> fetchFormItems() async {
    final IList<String>? sectionUids =
        (await dataEntryRepository?.sectionUids())?.lock;

    _openedSectionUid = sectionUids != null && sectionUids.isNotEmpty
        ? sectionUids.first
        : null;

    final IList<FieldUiModel>? items =
        (await dataEntryRepository?.list())?.lock;
    _itemList = items ?? IList();

    _backupList = _itemList;
    return composeList();
  }

  @override
  Future<IList<FieldUiModel>> composeList() {
    _calculationLoop = 0;

    return _mergeListWithErrorFields(_itemList, _itemsWithError)
        .then((IList<FieldUiModel> listOfItems) {
          _calculateCompletionPercentage(listOfItems);
          return listOfItems;
        })
        .then(
            (IList<FieldUiModel> listOfItems) => _setOpenedSection(listOfItems))
        .then((IList<FieldUiModel> listOfItems) => _setFocusedItem(listOfItems))
        .then((IList<FieldUiModel> listOfItems) => _setLastItem(listOfItems));
  }

  /// pure function doesn't effect this class variables
  @override
  Future<DataIntegrityCheckResult> runDataIntegrityCheck(
      {required bool allowDiscard}) {
    _runDataIntegrity = true;
    final List<FieldWithIssue> itemsWithErrors = _getFieldsWithError();
    /*final*/
    final List<FieldWithIssue> itemsWithWarning = /*ruleEffectsResult?...??*/
        [];
    // final DataIntegrityCheckResult result;
    if (itemsWithErrors
        .isNotEmpty /*|| ruleEffectsResult?.canComplete == false*/) {
      return Future.value(FieldsWithErrorResult(
          mandatoryFields: _mandatoryItemsWithoutValue,
          fieldUidErrorList: itemsWithErrors,
          warningFields: itemsWithWarning,
          canComplete: /*ruleEffectsResult?.canComplete ??*/ true,
          onCompleteMessage: /*ruleEffectsResult?.messageOnComplete*/ null,
          allowDiscard: allowDiscard));
    }

    if (_mandatoryItemsWithoutValue.isNotEmpty) {
      return Future.value(MissingMandatoryResult(
          mandatoryFields: _mandatoryItemsWithoutValue,
          errorFields: itemsWithErrors,
          warningFields: itemsWithWarning,
          canComplete: /*ruleEffectsResult?.canComplete ??*/ true,
          onCompleteMessage: /*ruleEffectsResult?.messageOnComplete*/ null,
          allowDiscard: allowDiscard));
    }

    if (itemsWithWarning.isNotEmpty) {
      return Future.value(FieldsWithWarningResult(
          fieldUidWarningList: itemsWithWarning,
          canComplete: /*ruleEffectsResult?.canComplete ??*/ true,
          onCompleteMessage: /*ruleEffectsResult?.messageOnComplete*/ null));
    }

    if (backupOfChangedItems().isNotEmpty && allowDiscard) {
      return Future.value(const NotSavedResult());
    }

    return Future.value(const SuccessfulResult(
        canComplete: /*ruleEffectsResult?.canComplete ?? */ true,
        onCompleteMessage: /*ruleEffectsResult?.messageOnComplete*/ null));
  }

  @override
  IList<FieldUiModel> backupOfChangedItems() {
    // return backupList.minus(itemList.applyRuleEffects());
    return _backupList;
  }

  @override
  bool calculationLoopOverLimit() {
    return _calculationLoop == _loopThreshold;
  }

  @override
  void clearFocusItem() {
    _focusedItemId = null;
  }

  @override
  double completedFieldsPercentage(IList<FieldUiModel> value) {
    return _completionPercentage;
  }

  @override
  FieldUiModel? currentFocusedItem() {
    return _itemList
        .firstOrNullWhere((FieldUiModel item) => _focusedItemId == item.uid);
  }

  @override
  void removeAllValues() {
    _itemList = _itemList
        .map((FieldUiModel fieldUiModel) =>
            fieldUiModel.setValue(null).setDisplayName(null))
        .toIList();
  }

  @override
  Future<StoreResult?> save(String id, String? value, String? extraData) {
    return formValueStore?.save(id, value, extraData) ??
        Future<StoreResult?>.value();
  }

  @override
  void setFieldRequestingCoordinates(String uid, bool requestInProcess) {
    // TODO(NMC): improve
    _itemList.let((IList<FieldUiModel> list) => list
        .firstOrNullWhere((FieldUiModel item) => item.uid == uid)
        ?.let((FieldUiModel item) => list.replace(
            list.indexOf(item), item.setIsLoadingData(requestInProcess))));
  }

  @override
  void setFocusedItem(RowAction action) {
    when(action.type, {
      ActionType.ON_NEXT: () => _focusedItemId = _getNextItem(action.id),
      ActionType.ON_FINISH: () => _focusedItemId = null,
    }).orElse(() => _focusedItemId = action.id);
  }

  @override
  void updateErrorList(RowAction action) {
    if (action.error != null) {
      if (_itemsWithError
              .firstOrNullWhere((RowAction item) => item.id == action.id) ==
          null) {
        _itemsWithError.add(action);
      }
    } else {
      _itemsWithError
          .firstOrNullWhere((RowAction item) => item.id == action.id)
          ?.let((RowAction item) => _itemsWithError.remove(item));
    }
  }

  @override
  void updateSectionOpened(RowAction action) {
    _openedSectionUid = action.id;
  }

  @override
  Future<void> updateValueOnList(
      String uid, String? value, ValueType? valueType) async {
    final int itemIndex =
        _itemList.indexWhere((FieldUiModel item) => item.uid == uid);
    if (itemIndex >= 0) {
      // TODO(NMC): improve
      final FieldUiModel item = _itemList[itemIndex];
      _itemList = _itemList.replace(
          itemIndex,
          item.setValue(value).setDisplayName(await displayNameProvider
              .provideDisplayName(valueType, value, item.optionSet)));
      /*   .setLegend(
                legendValueProvider?.provideLegendValue(item.uid, value))*/
    }
  }

  Future<IList<FieldUiModel>> _mergeListWithErrorFields(
      IList<FieldUiModel> list, IList<RowAction> fieldsWithError) async {
    _mandatoryItemsWithoutValue.clear();
    final List<FieldUiModel> mergedList =
        await Future.wait<FieldUiModel>(list.map((FieldUiModel item) async {
      if (item.mandatory && item.value == null) {
        _mandatoryItemsWithoutValue[item.label] =
            item.programStageSection ?? '';
      }
      final RowAction? action = fieldsWithError
          .firstOrNullWhere((RowAction action) => action.id == item.uid);

      if (action != null) {
        final String? error = action.error != null
            ? fieldErrorMessageProvider.getFriendlyErrorMessage(action.error!)
            : null;

        final String? displayName = await displayNameProvider
            .provideDisplayName(action.valueType, action.value);
        return item
            .setValue(action.value)
            .setError(error)
            .setDisplayName(displayName);
      } else {
        return item;
      }
    }));
    return mergedList.lock;
  }

  void _calculateCompletionPercentage(IList<FieldUiModel> list) {
    const List<ValueType> unsupportedValueTypes = [
      ValueType.FILE_RESOURCE,
      ValueType.TRACKER_ASSOCIATE,
      ValueType.USERNAME
    ];

    final Iterable<FieldUiModel> fields = list.filter((FieldUiModel it) =>
        it.valueType != null && !unsupportedValueTypes.contains(it.valueType));

    final int totalFields = fields.length;
    final int fieldsWithValue =
        fields.filter((FieldUiModel it) => it.value != null).length;
    if (totalFields == 0) {
      _completionPercentage = 0;
    } else {
      _completionPercentage =
          fieldsWithValue.toDouble() / totalFields.toDouble();
    }
  }

  Future<IList<FieldUiModel>> _setOpenedSection(
      IList<FieldUiModel> list) async {
    final List<FieldUiModel> fields = [];
    for (final FieldUiModel field in list) {
      if (field.isSection()) {
        fields.add(_updateSection(field, list));
      } else {
        final FieldUiModel item = await _updateField(field);
        fields.add(item);
      }
    }

    return fields
        .filter((FieldUiModel field) =>
            field.isSectionWithFields() ||
            field.programStageSection == _openedSectionUid)
        .toIList();
  }

  FieldUiModel _updateSection(
      FieldUiModel sectionFieldUiModel, IList<FieldUiModel> fields) {
    int total = 0;
    int values = 0;
    final bool isOpen = sectionFieldUiModel.uid == _openedSectionUid;
    fields
        .filter((FieldUiModel item) =>
            item.programStageSection == sectionFieldUiModel.uid &&
            item.valueType != null)
        .forEach((FieldUiModel item) {
      total++;
      if (!item.value.isNullOrEmpty) {
        values++;
      }
    });

    const int
        warningCount = /*ruleEffectsResult?.warningMap()?.filter { warning ->
    fields.firstOrNull { field ->
    field.uid == warning.key && field.programStageSection == sectionFieldUiModel.uid
    } != null
    }?.size ?: */
        0;
    //

    final int mandatoryCount = _runDataIntegrity
        ? _mandatoryItemsWithoutValue
            .filter((MapEntry<String, String> mandatory) =>
                mandatory.value == sectionFieldUiModel.uid)
            .length
        : 0;

    final int errorCount = _getFieldsWithError()
        .associate((FieldWithIssue it) =>
            MapEntry<String, String>(it.fieldUid, it.message))
        .filter((MapEntry<String, String> error) =>
            fields.firstOrNullWhere((FieldUiModel field) =>
                field.uid == error.key &&
                field.programStageSection == sectionFieldUiModel.uid) !=
            null)
        .length;

    return dataEntryRepository?.updateSection(sectionFieldUiModel, isOpen,
            total, values, errorCount + mandatoryCount, warningCount) ??
        sectionFieldUiModel;
  }

  Future<FieldUiModel> _updateField(FieldUiModel fieldUiModel) async {
    final bool needsMandatoryWarning =
        fieldUiModel.mandatory && fieldUiModel.value == null;

    if (needsMandatoryWarning) {
      _mandatoryItemsWithoutValue[fieldUiModel.label] =
          fieldUiModel.programStageSection ?? '';
    }

    return await dataEntryRepository?.updateField(
            fieldUiModel,
            fieldErrorMessageProvider
                .mandatoryWarning()
                .takeIf((_) => needsMandatoryWarning && _runDataIntegrity),
            /*ruleEffectsResult?.optionsToHide(fieldUiModel.uid) ?:*/ [],
            /*ruleEffectsResult?.optionGroupsToHide(fieldUiModel.uid) ?:*/ [],
            /*ruleEffectsResult?.optionGroupsToShow(fieldUiModel.uid) ?:*/ []) ??
        fieldUiModel;
  }

  List<FieldWithIssue> _getFieldsWithError() {
    return _itemsWithError.mapNotNull((RowAction errorItem) {
      final FieldUiModel? item = _itemList
          .firstOrNullWhere((FieldUiModel item) => item.uid == errorItem.id);
      if (item != null) {
        return FieldWithIssue(
            fieldUid: item.uid,
            fieldName: item.label,
            issueType: IssueType.ERROR,
            message: errorItem.error != null
                ? fieldErrorMessageProvider
                    .getFriendlyErrorMessage(errorItem.error!)
                : '');
      }
      return null;
    }).toList();
  }

  IList<FieldUiModel> _setFocusedItem(IList<FieldUiModel> list) {
    if (_focusedItemId != null) {
      final FieldUiModel? item = list
          .firstOrNullWhere((FieldUiModel item) => item.uid == _focusedItemId);
      if (item != null) {
        list = list.replace(list.indexOf(item), item.setFocus());
      }
    }
    return list;
  }

  IList<FieldUiModel> _setLastItem(IList<FieldUiModel> list) {
    if (list.isEmpty) {
      return list;
    }
    if (list.all((FieldUiModel it) => it is SectionUiModelImpl)) {
      final FieldUiModel lastItem = _getLastSectionItem(list);
      if (_usesKeyboard(lastItem.valueType) &&
          lastItem.valueType != ValueType.LONG_TEXT) {
        return list.replace(
            list.indexOf(lastItem), lastItem.setKeyBoardActionDone());
      }
    }
    return list;
  }

  FieldUiModel _getLastSectionItem(IList<FieldUiModel> list) {
    if (list.all((FieldUiModel item) => item is SectionUiModelImpl)) {
      return list.reversed.first;
    }
    return list.reversed
        .firstWhere((FieldUiModel item) => item.valueType != null);
  }

  bool _usesKeyboard(ValueType? valueType) {
    return valueType != null
        ? valueType.isText || valueType.isNumeric || valueType.isInteger
        : false;
  }

  String? _getNextItem(String currentItemUid) {
    _itemList.let((IList<FieldUiModel> fields) {
      // final oldItem = fields.firstOrNullWhere((item) => item.uid == currentItemUid);
      final int pos = fields
          .indexWhere((FieldUiModel oldItem) => oldItem.uid == currentItemUid);
      if (pos < fields.length - 1) {
        return fields[pos + 1].uid;
      }
    });
    return null;
  }
}
