// NMC created
// ignore_for_file: always_specify_types

import 'package:d2_remote/core/common/value_type.dart';
import 'package:dartx/dartx_io.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../commons/date/field_with_issue.dart';
import '../../../commons/extensions/dynamic_extensions.dart';
import '../../../commons/extensions/standard_extensions.dart';
import '../../model/action_type.dart';
import '../../model/field_ui_model.dart';
import '../../model/row_action.dart';
import '../../model/section_ui_model_impl.dart';
import '../../ui/provider/display_name_provider.dart';
import '../../ui/validation/field_error_message_provider.dart';
import '../data_entry_repository.dart';
import '../form_value_store.dart';
import 'form_fields_model.dart';

part 'form_fields_model_repository.g.dart';

@riverpod
class FormFieldsModelRepository extends _$FormFieldsModelRepository {
  @override
  FormFieldsModel build({
    FormValueStore? formValueStore,
    required FieldErrorMessageProvider fieldErrorMessageProvider,
    required DisplayNameProvider displayNameProvider,
    DataEntryRepository? dataEntryRepository,
  }) {
    return FormFieldsModel();
  }

  @override
  bool updateShouldNotify(FormFieldsModel previous, FormFieldsModel next) {
    logInfo(
        info:
            'FormFieldsModelRepository: updateShouldNotify(previous,next): previous: $previous, next: $next');
    return next.itemList != previous.itemList;
  }

  Future<void> fetchFormItems() async {
    final IList<String>? sectionUids =
        (await dataEntryRepository?.sectionUids())?.lock;

    final openedSectionUid = sectionUids != null && sectionUids.isNotEmpty
        ? sectionUids.first
        : null;

    final IList<FieldUiModel>? items =
        (await dataEntryRepository?.list())?.lock;
    final itemList = items ?? const IListConst([]);

    final backupList = itemList;

    state.copyWith(
        itemList: itemList,
        backupList: backupList,
        openedSectionUid: openedSectionUid);

    return composeList();
  }

  Future<void> composeList() async {
    state = (await _mergeListWithErrorFields(
                state.itemList, state.itemsWithError)
            .then((FormFieldsModel item) {
              return _calculateCompletionPercentage(item.itemList);
            })
            .then((FormFieldsModel item) => _setOpenedSection(item.itemList))
            .then((FormFieldsModel item) => _setFocusedItem(item.itemList))
            .then((FormFieldsModel item) => _setLastItem(item.itemList)))
        .copyWith(calculationLoop: 0);
  }

  void setFocusedItem(RowAction action) {
    when(action.type, {
      ActionType.ON_NEXT: () =>
          state = state.copyWith(focusedItemId: _getNextItem(action.id)),
      ActionType.ON_FINISH: () => state = state.copyWith(focusedItemId: null),
    }).orElse(() => state = state.copyWith(focusedItemId: action.id));
  }

  void updateSectionOpened(RowAction action) {
    state.copyWith(openedSectionUid: action.id);
  }

  /// only this methods needs to not notify sometimes
  Future<void> updateValueOnList(
      String uid, String? value, ValueType? valueType) async {
    final int itemIndex =
        state.itemList.indexWhere((FieldUiModel item) => item.uid == uid);
    if (itemIndex >= 0) {
      // TODO(NMC): improve
      final FieldUiModel item = state.itemList[itemIndex];
      // _itemList = _itemList.replace(
      //     itemIndex,
      //     item.setValue(value).setDisplayName(await displayNameProvider
      //         .provideDisplayName(valueType, value, item.optionSet)));
      // /*   .setLegend(
      //           legendValueProvider?.provideLegendValue(item.uid, value))*/
      final displayName = await displayNameProvider.provideDisplayName(
          valueType, value, item.optionSet);
      state.copyWith(
          itemList: state.itemList.replace(
              itemIndex, item.setValue(value).setDisplayName(displayName)));
    }
  }

  Future<FormFieldsModel> _mergeListWithErrorFields(
      IList<FieldUiModel> list, IList<RowAction> fieldsWithError) async {
    FormFieldsModel newState = state.copyWith();

    /// _mandatoryItemsWithoutValue.clear();
    newState = state.copyWith(
        mandatoryItemsWithoutValue: state.mandatoryItemsWithoutValue.clear());

    final List<FieldUiModel> mergedList =
        await Future.wait<FieldUiModel>(list.map((FieldUiModel item) async {
      if (item.mandatory && item.value == null) {
        /// _mandatoryItemsWithoutValue[item.label] =
        ///     item.programStageSection ?? '';
        newState = state.copyWith(
            mandatoryItemsWithoutValue: state.mandatoryItemsWithoutValue
                .update(item.label, (value) => item.programStageSection ?? ''));
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
    return newState.copyWith(itemList: mergedList.lock);
    // return mergedList.lock;
  }

  Future<FormFieldsModel> _setOpenedSection(IList<FieldUiModel> list) async {
    final List<FieldUiModel> fields = [];
    for (final FieldUiModel field in list) {
      if (field.isSection()) {
        fields.add(_updateSection(field, list));
      } else {
        final FieldUiModel item = await _updateField(field);
        fields.add(item);
      }
    }

    return state.copyWith(
        itemList: fields
            .where((FieldUiModel field) =>
                field.isSectionWithFields() ||
                field.programStageSection == state.openedSectionUid)
            .toIList());
  }

  FieldUiModel _updateSection(
      FieldUiModel sectionFieldUiModel, IList<FieldUiModel> fields) {
    int total = 0;
    int values = 0;
    final bool isOpen = sectionFieldUiModel.uid == state.openedSectionUid;
    fields
        .where((FieldUiModel item) =>
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

    final int mandatoryCount = state.runDataIntegrity
        ? state.mandatoryItemsWithoutValue
            .where((_, mandatory) => mandatory == sectionFieldUiModel.uid)
            // .filter((MapEntry<String, String> mandatory) =>
            //     mandatory.value == sectionFieldUiModel.uid)
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

    if (dataEntryRepository != null) {
      return dataEntryRepository!.updateSection(sectionFieldUiModel, isOpen,
          total, values, errorCount + mandatoryCount, warningCount);
    }

    return sectionFieldUiModel;
  }

  Future<FieldUiModel> _updateField(FieldUiModel fieldUiModel) async {
    final bool needsMandatoryWarning =
        fieldUiModel.mandatory && fieldUiModel.value == null;

    if (needsMandatoryWarning) {
      // _mandatoryItemsWithoutValue[fieldUiModel.label] =
      //     fieldUiModel.programStageSection ?? '';
      state.copyWith(
          mandatoryItemsWithoutValue: state.mandatoryItemsWithoutValue.update(
              fieldUiModel.label,
              (value) => fieldUiModel.programStageSection ?? ''));
    }

    if (dataEntryRepository != null) {
      return dataEntryRepository!.updateField(
          fieldUiModel,
          fieldErrorMessageProvider
              .mandatoryWarning()
              .takeIf((_) => needsMandatoryWarning && state.runDataIntegrity),
          /*ruleEffectsResult?.optionsToHide(fieldUiModel.uid) ?:*/ [],
          /*ruleEffectsResult?.optionGroupsToHide(fieldUiModel.uid) ?:*/ [],
          /*ruleEffectsResult?.optionGroupsToShow(fieldUiModel.uid) ?:*/ []);
    }

    return fieldUiModel;
    // return await dataEntryRepository?.updateField(
    //         fieldUiModel,
    //         fieldErrorMessageProvider
    //             .mandatoryWarning()
    //             .takeIf((_) => needsMandatoryWarning && _runDataIntegrity),
    //         /*ruleEffectsResult?.optionsToHide(fieldUiModel.uid) ?:*/ [],
    //         /*ruleEffectsResult?.optionGroupsToHide(fieldUiModel.uid) ?:*/ [],
    //         /*ruleEffectsResult?.optionGroupsToShow(fieldUiModel.uid) ?:*/ []) ??
    //     fieldUiModel;
  }

  List<FieldWithIssue> _getFieldsWithError() {
    // state.itemsWithError.mapNotNull((e) => null);
    return state.itemsWithError
        .mapNotNull<FieldWithIssue>((RowAction? errorItem) {
      final FieldUiModel? item = state.itemList
          .firstOrNullWhere((FieldUiModel item) => item.uid == errorItem?.id);
      if (item != null) {
        return FieldWithIssue(
            fieldUid: item.uid,
            fieldName: item.label,
            issueType: IssueType.ERROR,
            message: errorItem?.error != null
                ? fieldErrorMessageProvider
                    .getFriendlyErrorMessage(errorItem!.error!)
                : '');
      }
      return null;
    }).toList();
  }

  FormFieldsModel _setFocusedItem(IList<FieldUiModel> list) {
    if (state.focusedItemId != null) {
      final FieldUiModel? item = list.firstOrNullWhere(
          (FieldUiModel item) => item.uid == state.focusedItemId);
      if (item != null) {
        list = list.replace(list.indexOf(item), item.setFocus());
      }
    }
    return state.copyWith(itemList: list);
  }

  FormFieldsModel _setLastItem(IList<FieldUiModel> list) {
    if (list.isEmpty) {
      return state;
    }
    if (list.all((FieldUiModel it) => it is SectionUiModelImpl)) {
      final FieldUiModel lastItem = _getLastSectionItem(list);
      if (_usesKeyboard(lastItem.valueType) &&
          lastItem.valueType != ValueType.LONG_TEXT) {
        return state.copyWith(
            itemList: list.replace(
                list.indexOf(lastItem), lastItem.setKeyBoardActionDone()));
      }
    }
    return state.copyWith(itemList: list);
  }

  FormFieldsModel _calculateCompletionPercentage(IList<FieldUiModel> list) {
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
      // _completionPercentage = 0;
      return state.copyWith(completionPercentage: 0);
    } else {
      // _completionPercentage =
      //     fieldsWithValue.toDouble() / totalFields.toDouble();
      return state.copyWith(
          completionPercentage:
              fieldsWithValue.toDouble() / totalFields.toDouble());
    }
  }

  FieldUiModel _getLastSectionItem(IList<FieldUiModel> list) {
    if (list.all((FieldUiModel item) => item is SectionUiModelImpl)) {
      return list.reversed.first;
    }
    return list.reversed
        .firstWhere((FieldUiModel item) => item.valueType != null);
  }

  bool _usesKeyboard(ValueType? valueType) {
    return valueType != null &&
        (valueType.isText || valueType.isNumeric || valueType.isInteger);
  }

  String? _getNextItem(String currentItemUid) {
    state.itemList.let((IList<FieldUiModel> fields) {
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
