import 'dart:async';

import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/form/entities/dynamic_form.entity.dart';
import 'package:d2_remote/modules/datarun_shared/entities/syncable.entity.dart';
import 'package:expressions/expressions.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/constants.dart';
import 'package:mass_pro/commons/extensions/standard_extensions.dart';
import 'package:mass_pro/commons/helpers/iterable.dart';
import 'package:mass_pro/data_run/engine/rule_engine.dart';
import 'package:mass_pro/data_run/form/database_syncable_query.dart';
import 'package:mass_pro/data_run/form/display_name_provider.dart';
import 'package:mass_pro/data_run/form/org_unit_d_configuration.dart';
import 'package:mass_pro/data_run/form/syncable_entity_mapping_repository.dart';
import 'package:mass_pro/data_run/screens/form/form_state/q_field.model.dart';
import 'package:mass_pro/form/model/action_type.dart';
import 'package:mass_pro/form/model/row_action.dart';
import 'package:mass_pro/form/model/store_result.dart';
import 'package:mass_pro/form/ui/validation/field_error_message_provider.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';
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
DatabaseSyncableQuery databaseSyncableQuery(
    DatabaseSyncableQueryRef ref, String formCode) {
  return DatabaseSyncableQuery(formCode);
}

@riverpod
Future<FormFieldsRepository> formFieldsRepository(
    FormFieldsRepositoryRef ref) async {
  final Bundle eventBundle = Get.arguments as Bundle;
  final syncableUid = eventBundle.getString(SYNCABLE_UID)!;
  final formCode = eventBundle.getString(FORM_CODE)!;
  final DynamicForm? form = await D2Remote.formModule.form
      .where(attribute: 'code', value: formCode)
      .getOne();

  final d2SyncableQuery =
      ref.watch(databaseSyncableQueryProvider(formCode)).provideQuery();
  final SyncableEntity? syncableEntity =
      await d2SyncableQuery.byId(syncableUid).getOne();

  return FormFieldsRepository(
      syncableEntityMappingRepository: ref.watch(
          syncableEntityMappingRepositoryProvider(
              form: form!,
              syncableEntity: syncableEntity!,
              d2SyncableQuery: d2SyncableQuery)),
      displayNameProvider: ref.watch(displayNameProviderProvider),
      fieldErrorMessageProvider: ref.watch(fieldErrorMessageProviderProvider));
}

/// Maps Database entity fields key, value map to List<FormFieldModels>,
/// that [FormStateNotifier] will use and update
class FormFieldsRepository {
  FormFieldsRepository({
    required this.syncableEntityMappingRepository,
    required this.fieldErrorMessageProvider,
    required this.displayNameProvider,
  });

  IList<QFieldModel> _pendingUpdates = IList([]);
  List<QFieldModel> _pendingUpdatesList = [];
  IList<QFieldModel> _backupList = IList([]);
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

  /// updates the field model in _itemList with the value based on the uid
  Future<void> updateValueOnList(
      String uid, String? value, ValueType? valueType) async {
    Map<String, dynamic> pendingFieldDataMap = <String, dynamic>{
      for (final field in _pendingUpdates) field.uid: field.value
    };
    // /// check if field exist or throw an error
    // _pendingUpdates.firstWhere((field) => field.uid == uid,
    //     orElse: () =>
    //     throw Exception('field: $uid, with value: $value does not exist!'));

    final displayName =
        await displayNameProvider.provideDisplayName(valueType, value);
    //
    // _pendingUpdates = _pendingUpdates.replaceFirstWhere(
    //     (field) => field.uid == uid,
    //     (field) =>
    //         field!.copyWith(value: value).copyWith(displayName: displayName));

    final toUpdatedItem = _pendingUpdates.unlock
        .firstWhere((t) => t.uid == uid)
        .builder()
        .setValue(value)
        .setDisplayName(displayName)
        .build();

    _pendingUpdates =
        _pendingUpdates.updateById([toUpdatedItem], (id) => id.uid);

    pendingFieldDataMap = <String, dynamic>{
      for (final field in _pendingUpdates) field.uid: field.value
    };
  }

  // save(String id, String? value, String? extraData) {}
  Future<StoreResult> batchUpdateValues(Map<String, dynamic>? formData) async {
    // Implement logic to update all values in the list in a single call
    // This could involve iterating through the list and performing bulk updates
    // based on your data storage mechanism (e.g., SQL queries)
    final map = formData;
    return syncableEntityMappingRepository.saveFormData(_pendingUpdates);
  }

  FutureOr<IList<QFieldModel>> fetchFieldsList() async {
    _pendingUpdates = await syncableEntityMappingRepository.list();
    _pendingUpdatesList = _pendingUpdates.unlock;
    _backupList = _pendingUpdates;
    return composeFieldsList();
  }

  FutureOr<IList<QFieldModel>> composeFieldsList() async {
    final composedList = await applyRuleEffects(_pendingUpdates)
        .then((IList<QFieldModel> listOfItems) =>
            _mergeListWithErrorFields(listOfItems, _itemsWithError))
        .then((IList<QFieldModel> listOfItems) => _setFocusedItem(listOfItems))
        .then((IList<QFieldModel> listOfItems) =>
            _setLastItemKeyboardAction(listOfItems));
    _pendingUpdatesList = composedList.unlock;
    return composedList;
  }

  FutureOr<IMap<String, QFieldModel>> composeFieldsMap() async {
    final fieldList = await applyRuleEffects(_pendingUpdates)
        // .then((IList<QFieldModel> listOfItems) =>
        //     _mergeListWithErrorFields(listOfItems, _itemsWithError))
        // .then((IList<QFieldModel> listOfItems) => _setFocusedItem(listOfItems))
        .then((IList<QFieldModel> listOfItems) =>
            _setLastItemKeyboardAction(listOfItems));

    return IMap.fromIterable<String, QFieldModel, QFieldModel>(fieldList,
        keyMapper: (field) => field.uid, valueMapper: (field) => field);
  }

  Future<IList<QFieldModel>> applyRuleEffects(IList<QFieldModel> list) async {
    return ruleEngine.applyRules(list);
  }

  Future<IList<QFieldModel>> _mergeListWithErrorFields(
      IList<QFieldModel> list, IList<RowAction> fieldsWithError) async {
    _mandatoryItemsWithoutValue = _mandatoryItemsWithoutValue.clear();
    final List<QFieldModel> mergedList =
        // await Future.wait<FormFieldModel>(
        list.map((QFieldModel item) /*async*/ {
      if (item.isMandatory && item.value == null) {
        _mandatoryItemsWithoutValue =
            _mandatoryItemsWithoutValue.add(item.label, 'sectionName');
      }

      return fieldsWithError
              .firstOrNullWhere((RowAction action) => action.id == item.uid)
              ?.takeIf((RowAction action) => action.error != null)
              ?.also((RowAction action) => item.setValue(action.value))
              .let((RowAction action) => fieldErrorMessageProvider
                  .getFriendlyErrorMessage(action.error!))
              .also((String y) {})
              .let((String friendlyError) => item.setError(friendlyError)) ??
          item;

      /// if field has error in fieldsWithError
      // if (action != null) {
      //   final String? error = action.error != null
      //       ? fieldErrorMessageProvider.getFriendlyErrorMessage(action.error!)
      //       : null;
      //
      //   /// if orgunit returns its name
      //   // final String? displayName = await displayNameProvider
      //   //     .provideDisplayName(action.valueType, action.value);
      //   return item
      //       .setValue(action.value)
      //       .setError(error) /*.setDisplayName(displayName)*/;
      // } else {
      //   return item;
      // }
    }).toList();
    // );
    return mergedList.lock;
  }

  IList<QFieldModel> _setLastItemKeyboardAction(IList<QFieldModel> list) {
    if (list.isEmpty) {
      return list;
    }

    final QFieldModel lastItem = _getLastSectionItem(list);
    if (_usesKeyboard(lastItem.valueType) &&
        lastItem.valueType != ValueType.LongText) {
      return list.replace(
          list.indexOf(lastItem), lastItem.setKeyBoardActionDone());
    }
    return list;
  }

  IList<QFieldModel> _setFocusedItem(IList<QFieldModel> list) {
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
  IList<QFieldModel> backupOfChangedItems() {
    // return backupList.minus(itemList.applyRuleEffects());
    return _backupList;
  }

  void removeAllValues() {
    _pendingUpdates = _pendingUpdates
        .map((QFieldModel fieldUiModel) =>
            fieldUiModel.setValue(null).setDisplayName(null))
        .toIList();
  }

  QFieldModel? currentFocusedItem() {
    return _pendingUpdates
        .firstOrNullWhere((QFieldModel item) => _focusedItemId == item.uid);
  }

  void clearFocusItem() {
    _focusedItemId = null;
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
    final itemIndex =
        _itemsWithError.indexWhere((RowAction item) => item.id == action!.id);

    /// if action has error
    if (action?.error != null) {
      /// if item is not in _itemsWithError
      if (itemIndex == -1) {
        _itemsWithError = _itemsWithError.add(action!);
      }
    } else {
      /// if item is not in _itemsWithError
      if (itemIndex != -1) {
        _itemsWithError = _itemsWithError.removeAt(itemIndex);
      }
    }
  }

  QFieldModel _getLastSectionItem(IList<QFieldModel> list) {
    return list.reversed
        .firstWhere((QFieldModel item) => item.valueType != null);
  }

  bool _usesKeyboard(ValueType? valueType) {
    if (valueType != null) {
      return valueType.isText || valueType.isNumeric || valueType.isInteger;
    } else {
      return false;
    }
  }

  String? _getNextItem(String currentItemUid) {
    _pendingUpdates.let((IList<QFieldModel> fields) {
      // final oldItem = fields.firstOrNullWhere((item) => item.uid == currentItemUid);
      final int pos = fields
          .indexWhere((QFieldModel oldItem) => oldItem.uid == currentItemUid);
      if (pos < fields.length - 1) {
        return fields[pos + 1].uid;
      }
    });
    return null;
  }

  IList<QFieldModel> getFields() {
    return _pendingUpdates;
  }
}
