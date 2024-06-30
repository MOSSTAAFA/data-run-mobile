import 'package:expressions/expressions.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/commons/extensions/standard_extensions.dart';
import 'package:mass_pro/commons/helpers/iterable.dart';
import 'package:mass_pro/data_run/engine/rule_engine.dart';
import 'package:mass_pro/data_run/form/display_name_provider.dart';
import 'package:mass_pro/data_run/form/org_unit_d_configuration.dart';
import 'package:mass_pro/data_run/form/syncable_entity_mapping_repository.dart';
import 'package:mass_pro/data_run/screens/form/form_input_field.model.dart';
import 'package:mass_pro/form/model/action_type.dart';
import 'package:mass_pro/form/model/row_action.dart';
import 'package:mass_pro/form/ui/validation/field_error_message_provider.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_fields_repository.g.dart';

@riverpod
DisplayNameProvider displayNameProvider(DisplayNameProviderRef ref) {
  return const DisplayNameProvider(OrgUnitDConfiguration());
}

@riverpod
FieldErrorMessageProvider fieldErrorMessageProvider(
    FieldErrorMessageProviderRef ref) {
  return const FieldErrorMessageProvider();
}

@riverpod
FormFieldsRepository formFieldsRepository(FormFieldsRepositoryRef ref) {
  return FormFieldsRepository(
      syncableEntityMappingRepository:
          ref.watch(syncableEntityMappingRepositoryProvider),
      displayNameProvider: ref.watch(displayNameProviderProvider),
      fieldErrorMessageProvider: ref.watch(fieldErrorMessageProviderProvider));
}

/// Maps Database entity fields key, value map to List<FormFieldModels>,
/// that [FormStateNotifier] will use and update
class FormFieldsRepository {
  FormFieldsRepository(
      {required this.syncableEntityMappingRepository,
      required this.fieldErrorMessageProvider,
      required this.displayNameProvider});

  IList<FormFieldModel> _itemList = IList([]);
  IList<FormFieldModel> _backupList = IList([]);
  IList<RowAction> _itemsWithError = IList([]);
  final RuleEngine ruleEngine = RuleEngine(const ExpressionEvaluator());

  /// used to convert the action field on the database entities into the List of
  /// List<FieldUiModel> of fields model representing each field
  final SyncableEntityMappingRepository syncableEntityMappingRepository;

  final DisplayNameProvider displayNameProvider;

  // /// used to save each value to the database and gets the response
  // final FormValueStore? formValueStore;

  /// encapsulate error messages returnint a localized user friendly
  /// message representing the an error message if there are any
  final FieldErrorMessageProvider fieldErrorMessageProvider;

  /// map of mandatory Fields Without Value
  IMap<String, String> _mandatoryItemsWithoutValue = IMap({});

  /// current focused item
  String? _focusedItemId;

  /// Data Integrity is checking and validating the form entries
  /// when Data Integrity is run this field is set to true
  bool _runDataIntegrity = false;

  Future<IList<FormFieldModel>> fetchFieldsList() async {
    _itemList = await syncableEntityMappingRepository.list();
    _backupList = _itemList;
    return composeFields();
  }

  Future<IList<FormFieldModel>> composeFields() {
    return applyRuleEffects(_itemList)
        .then((IList<FormFieldModel> listOfItems) =>
            _mergeListWithErrorFields(listOfItems, _itemsWithError))
        .then(
            (IList<FormFieldModel> listOfItems) => _setFocusedItem(listOfItems))
        .then((IList<FormFieldModel> listOfItems) => _setLastItem(listOfItems));
  }

  Future<IList<FormFieldModel>> applyRuleEffects(
      IList<FormFieldModel> list) async {
    return ruleEngine.applyRules(list);
  }

  Future<IList<FormFieldModel>> _mergeListWithErrorFields(
      IList<FormFieldModel> list, IList<RowAction> fieldsWithError) async {
    return list;
  }

  IList<FormFieldModel> _setLastItem(IList<FormFieldModel> list) {
    // if (list.isEmpty) {
    //   return list;
    // }
    // final FormFieldModel lastItem = _getLastSectionItem(list);
    // if (_usesKeyboard(lastItem.valueType) &&
    //     lastItem.valueType != ValueType.LongText) {
    //   return list.replace(
    //       list.indexOf(lastItem), lastItem.setKeyBoardActionDone());
    // }
    return list;
  }

  IList<FormFieldModel> _setFocusedItem(IList<FormFieldModel> list) {
    // if (_focusedItemId != null) {
    //   final FormFieldModel? item = list.firstOrNullWhere(
    //       (FormFieldModel item) => item.uid == _focusedItemId);
    //   if (item != null) {
    //     list = list.replace(list.indexOf(item), item.copyWith(focused: true));
    //   }
    // }
    return list;
  }

  /// when discharge changes take this and save override what was
  /// already saved during entry
  IList<FormFieldModel> backupOfChangedItems() {
    // return backupList.minus(itemList.applyRuleEffects());
    return _backupList;
  }

  void removeAllValues() {
    _itemList = _itemList
        .map((FormFieldModel fieldUiModel) =>
            fieldUiModel.setValue(null).setDisplayName(null))
        .toIList();
  }

  FormFieldModel? currentFocusedItem() {
    return _itemList
        .firstOrNullWhere((FormFieldModel item) => _focusedItemId == item.uid);
  }

  void clearFocusItem() {
    _focusedItemId = null;
  }

  /// updates the field model in _itemList with the value based on the uid
  Future<void> updateValueOnList(
      String uid, String? value, ValueType? valueType) async {
    final int itemIndex =
        _itemList.indexWhere((FormFieldModel item) => item.uid == uid);
    if (itemIndex >= 0) {
      // TODO(NMC): improve
      final FormFieldModel item = _itemList[itemIndex];
      _itemList = _itemList.replace(
          itemIndex,
          item.setValue(value).setDisplayName(
              await displayNameProvider.provideDisplayName(valueType, value)));
    }
  }

  void setFocusedItem(RowAction action) {
    when(action.type, {
      ActionType.ON_NEXT: () => _focusedItemId = _getNextItem(action.id),
      ActionType.ON_FINISH: () => _focusedItemId = null,
    }).orElse(() => _focusedItemId = action.id);
  }

  /// if action has error and its item is not yet in _itemsWithError, it adds
  /// it to it. Else which means it was _itemsWithError, it then removes it.
  void updateErrorList(RowAction? action) {
    /// if action has error
    if (action?.error != null) {
      /// if item is not in _itemsWithError
      if (_itemsWithError
              .firstOrNullWhere((RowAction item) => item.id == action!.id) ==
          null) {
        _itemsWithError = _itemsWithError.add(action!);
      }
    } else {
      _itemsWithError
          .firstOrNullWhere((RowAction item) => item.id == action!.id)
          ?.let((RowAction item) =>
              _itemsWithError = _itemsWithError.remove(item));
    }
  }

  FormFieldModel _getLastSectionItem(IList<FormFieldModel> list) {
    return list.reversed
        .firstWhere((FormFieldModel item) => item.valueType != null);
  }

  bool _usesKeyboard(ValueType? valueType) {
    return valueType != null
        ? valueType.isText || valueType.isNumeric || valueType.isInteger
        : false;
  }

  String? _getNextItem(String currentItemUid) {
    _itemList.let((IList<FormFieldModel> fields) {
      // final oldItem = fields.firstOrNullWhere((item) => item.uid == currentItemUid);
      final int pos = fields.indexWhere(
          (FormFieldModel oldItem) => oldItem.uid == currentItemUid);
      if (pos < fields.length - 1) {
        return fields[pos + 1].uid;
      }
    });
    return null;
  }

  save(String id, String? value, String? extraData) {}
}
