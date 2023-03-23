import 'package:d2_remote/core/common/value_type.dart';
import 'package:dartx/dartx_io.dart';
import 'package:mass_pro/commons/date/field_with_issue.dart';
import 'package:mass_pro/commons/extensions/standard_extensions.dart';
import 'package:mass_pro/form/data/data_entry_repository.dart';
import 'package:mass_pro/form/data/data_integrity_check_result.dart';
import 'package:mass_pro/form/data/form_repository.dart';
import 'package:mass_pro/form/data/form_value_store.dart';
import 'package:mass_pro/form/model/action_type.dart';
import 'package:mass_pro/form/model/field_ui_model.dart';
import 'package:mass_pro/form/model/row_action.dart';
import 'package:mass_pro/form/model/section_ui_model_impl.dart';
import 'package:mass_pro/form/model/store_result.dart';
import 'package:mass_pro/form/ui/provider/display_name_provider.dart';
import 'package:mass_pro/form/ui/validation/field_error_message_provider.dart';

class FormRepositoryImpl implements FormRepository {
  static const int _loopThreshold = 5;

  final FormValueStore? formValueStore;
  final FieldErrorMessageProvider fieldErrorMessageProvider;
  final DisplayNameProvider displayNameProvider;
  final DataEntryRepository? dataEntryRepository;

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

  double _completionPercentage = 0.0;
  final List<RowAction> _itemsWithError = [];
  final Map<String, String> _mandatoryItemsWithoutValue = {};
  String? _openedSectionUid;
  List<FieldUiModel> _itemList = [];
  String? _focusedItemId;

  // RuleUtilsProviderResult? ruleEffectsResult;
  bool _runDataIntegrity = false;
  int _calculationLoop = 0;
  List<FieldUiModel> _backupList = [];

  @override
  Future<List<FieldUiModel>> fetchFormItems() async {
    final List<String>? sectionUids = await dataEntryRepository?.sectionUids();

    _openedSectionUid = sectionUids != null && sectionUids.isNotEmpty
        ? sectionUids.first
        : null;

    final List<FieldUiModel>? items = await dataEntryRepository?.list();
    _itemList = items ?? [];

    _backupList = _itemList;
    return composeList();
  }

  @override
  Future<List<FieldUiModel>> composeList() {
    _calculationLoop = 0;

    return _mergeListWithErrorFields(_itemList, _itemsWithError)
        .then((listOfItems) {
          _calculateCompletionPercentage(listOfItems);
          return listOfItems;
        })
        .then((listOfItems) => _setOpenedSection(listOfItems))
        .then((listOfItems) => _setFocusedItem(listOfItems))
        .then((listOfItems) => _setLastItem(listOfItems));
  }

  @override
  Future<DataIntegrityCheckResult> runDataIntegrityCheck({required bool allowDiscard}) {
    _runDataIntegrity = true;
    final itemsWithErrors = _getFieldsWithError();
    /*final*/
    List<FieldWithIssue> itemsWithWarning = /*ruleEffectsResult?...??*/ [];
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
  List<FieldUiModel> backupOfChangedItems() {
    // return backupList.minus(itemList.applyRuleEffects());
    return _backupList;
  }

  @override
  Future<bool> calculationLoopOverLimit() {
    return Future.value(_calculationLoop == _loopThreshold);
  }

  @override
  void clearFocusItem() {
    _focusedItemId = null;
  }

  @override
  Future<double> completedFieldsPercentage(List<FieldUiModel> value) {
    return Future.value(_completionPercentage);
  }

  @override
  FieldUiModel? currentFocusedItem() {
    return _itemList.firstOrNullWhere((item) => _focusedItemId == item.uid);
  }

  @override
  void removeAllValues() {
    _itemList = _itemList
        .map((fieldUiModel) => fieldUiModel.setValue(null).setDisplayName(null))
        .toList();
  }

  @override
  Future<StoreResult?> save(String id, String? value, String? extraData) async {
    return await formValueStore?.save(id, value, extraData);
  }

  @override
  void setFieldRequestingCoordinates(String uid, bool requestInProcess) {
    _itemList.let((list) => list
        .firstOrNullWhere((item) => item.uid == uid)
        ?.let((item) => list[list.indexOf(item)] =
            item.setIsLoadingData(requestInProcess)));
  }

  @override
  void setFocusedItem(RowAction action) {
    switch (action.type) {
      case ActionType.ON_NEXT:
        _focusedItemId = _getNextItem(action.id);
        break;
      case ActionType.ON_FINISH:
        _focusedItemId = null;
        break;
      default:
        _focusedItemId = action.id;
    }
  }

  @override
  void updateErrorList(RowAction action) {
    if (action.error != null) {
      if (_itemsWithError.firstOrNullWhere((item) => item.id == action.id) ==
          null) {
        _itemsWithError.add(action);
      }
    } else {
      _itemsWithError
          .firstOrNullWhere((item) => item.id == action.id)
          ?.let((item) => _itemsWithError.remove(item));
    }
  }

  @override
  void updateSectionOpened(RowAction action) {
    _openedSectionUid = action.id;
  }

  @override
  Future<void> updateValueOnList(
      String uid, String? value, ValueType? valueType) async {
    final itemIndex = _itemList.indexWhere((item) => item.uid == uid);
    if (itemIndex >= 0) {
      final item = _itemList[itemIndex];
      _itemList[itemIndex] = item.setValue(value).setDisplayName(
          await displayNameProvider.provideDisplayName(
              valueType, value, item.optionSet));
      /*   .setLegend(
                legendValueProvider?.provideLegendValue(item.uid, value))*/
    }
  }

  Future<List<FieldUiModel>> _mergeListWithErrorFields(
      List<FieldUiModel> list, List<RowAction> fieldsWithError) async {
    _mandatoryItemsWithoutValue.clear();
    final List<FieldUiModel> mergedList =
        await Future.wait<FieldUiModel>(list.map((item) async {
      if (item.mandatory && item.value == null) {
        _mandatoryItemsWithoutValue[item.label] =
            item.programStageSection ?? '';
      }
      final RowAction? action =
          fieldsWithError.firstOrNullWhere((action) => action.id == item.uid);

      if (action != null) {
        final String? error = action.error != null
            ? fieldErrorMessageProvider.getFriendlyErrorMessage(action.error!)
            : null;

        var displayName = await displayNameProvider.provideDisplayName(
            action.valueType, action.value);
        return item
            .setValue(action.value)
            .setError(error)
            .setDisplayName(displayName);
      } else {
        return item;
      }
    }));
    return mergedList;
  }

  void _calculateCompletionPercentage(List<FieldUiModel> list) {
    const List<ValueType> unsupportedValueTypes = [
      ValueType.FILE_RESOURCE,
      ValueType.TRACKER_ASSOCIATE,
      ValueType.USERNAME
    ];

    final Iterable<FieldUiModel> fields = list.filter((it) =>
        it.valueType != null && !unsupportedValueTypes.contains(it.valueType));

    final int totalFields = fields.length;
    final int fieldsWithValue = fields.filter((it) => it.value != null).length;
    if (totalFields == 0) {
      _completionPercentage = 0;
    } else {
      _completionPercentage =
          fieldsWithValue.toDouble() / totalFields.toDouble();
    }
  }

  Future<List<FieldUiModel>> _setOpenedSection(List<FieldUiModel> list) async {
    final List<FieldUiModel> fields = List.empty();
    for (final field in list) {
      if (field.isSection()) {
        fields.add(_updateSection(field, list));
      } else {
        final FieldUiModel item = await _updateField(field);
        fields.add(item);
      }
    }

    return fields
        .filter((field) =>
            field.isSectionWithFields() ||
            field.programStageSection == _openedSectionUid)
        .toList();
  }

  FieldUiModel _updateSection(
      FieldUiModel sectionFieldUiModel, List<FieldUiModel> fields) {
    var total = 0;
    var values = 0;
    final bool isOpen = sectionFieldUiModel.uid == _openedSectionUid;
    fields
        .filter((item) =>
            item.programStageSection == sectionFieldUiModel.uid &&
            item.valueType != null)
        .forEach((item) {
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
            .filter((mandatory) => mandatory.value == sectionFieldUiModel.uid)
            .length
        : 0;

    final int errorCount = _getFieldsWithError()
        .associate((it) => MapEntry<String, String>(it.fieldUid, it.message))
        .filter((error) =>
            fields.firstOrNullWhere((field) =>
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
    return _itemsWithError.mapNotNull((errorItem) {
      final FieldUiModel? item =
          _itemList.firstOrNullWhere((item) => item.uid == errorItem.id);
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

  List<FieldUiModel> _setFocusedItem(List<FieldUiModel> list) {
    if (_focusedItemId != null) {
      final FieldUiModel? item =
          list.firstOrNullWhere((item) => item.uid == _focusedItemId);
      if (item != null) {
        list[list.indexOf(item)] = item.setFocus();
      }
    }
    return list;
  }

  List<FieldUiModel> _setLastItem(List<FieldUiModel> list) {
    if (list.isEmpty) {
      return list;
    }
    if (list.all((it) => it is SectionUiModelImpl)) {
      final FieldUiModel lastItem = _getLastSectionItem(list);
      if (_usesKeyboard(lastItem.valueType) &&
          lastItem.valueType != ValueType.LONG_TEXT) {
        list[list.indexOf(lastItem)] = lastItem.setKeyBoardActionDone();
        return list;
      }
    }
    return list;
  }

  FieldUiModel _getLastSectionItem(List<FieldUiModel> list) {
    if (list.all((item) => item is SectionUiModelImpl)) {
      return list.reversed.first;
    }
    return list.reversed.firstWhere((item) => item.valueType != null);
  }

  bool _usesKeyboard(ValueType? valueType) {
    return valueType != null
        ? valueType.isText || valueType.isNumeric || valueType.isInteger
        : false;
  }

  String? _getNextItem(String currentItemUid) {
    _itemList.let((fields) {
      // final oldItem = fields.firstOrNullWhere((item) => item.uid == currentItemUid);
      final pos = fields.indexWhere((oldItem) => oldItem.uid == currentItemUid);
      if (pos < fields.length - 1) {
        return fields[pos + 1].uid;
      }
    });
    return null;
  }
}
