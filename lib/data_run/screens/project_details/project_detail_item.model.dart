import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/commons/ui/metadata_icon_data.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/screens/form/fields_widgets/q_field.model.dart';

class FormListItemModel with EquatableMixin {
  FormListItemModel(
      {
      /// form uid
      required this.form,
      required this.formCode,
      this.formName,
      this.team,
      this.activity,
      this.entitiesToPost = 0,
      this.entitiesToUpdate = 0,
      this.entitiesSynced = 0,
      this.entitiesWithError = 0,
      this.canAddNewEvent = true,
      this.description,
      this.fields,
      required this.state});

  final String form;
  final String formCode;
  final String? formName;
  final String? team;
  final String? activity;
  final String? description;
  final int entitiesToPost;
  final int entitiesToUpdate;
  final int entitiesSynced;
  final int entitiesWithError;
  final bool canAddNewEvent;
  final SyncableEntityState state;
  final IList<QFieldModel>? fields;

  FormListItemModel setFields(List<QFieldModel>? fields) {
    return copyWith(fields: fields);
  }

  FormListItemModel copyWith(
          {String? form,
          String? formCode,
          String? formName,
          String? team,
          String? activity,
          String? description,
          int? entitiesToPost,
          int? entitiesToUpdate,
          int? entitiesSynced,
          int? entitiesWithError,
          bool? canAddNewEvent,
          List<QFieldModel>? fields,
          SyncableEntityState? state}) =>
      FormListItemModel(
        form: form ?? this.form,
        formCode: formCode ?? this.formCode,
        formName: formName ?? this.formName,
        team: team ?? this.team,
        activity: activity ?? this.activity,
        description: description ?? this.description,
        entitiesToPost: entitiesToPost ?? this.entitiesToPost,
        entitiesToUpdate: entitiesToUpdate ?? this.entitiesToUpdate,
        entitiesSynced: entitiesSynced ?? this.entitiesSynced,
        entitiesWithError: entitiesWithError ?? this.entitiesWithError,
        canAddNewEvent: canAddNewEvent ?? this.canAddNewEvent,
        fields: IList.orNull(fields),
        state: state ?? this.state,
      );

  @override
  List<Object?> get props => [
        form,
        formCode,
        formName,
        team,
        activity,
        entitiesToPost,
        entitiesToUpdate,
        entitiesSynced,
        entitiesWithError,
        canAddNewEvent,
        description,
        fields,
        state
      ];
}

class ProjectDetailItemModel with EquatableMixin {
  ProjectDetailItemModel(
      {
      /// activity uid
      required this.activity,
      required this.activityName,
      this.team,
      this.activeFormCount = 0,
      this.isSelected = false,
      this.valueListIsOpen = true,
      this.metadataIconData,
      this.description,
      required this.syncablesState});

  final String activity;
  final String activityName;

  final String? team;

  final int activeFormCount;
  final String? description;

  final bool isSelected;
  final bool valueListIsOpen;
  final MetadataIconData? metadataIconData;
  final SyncableEntityState syncablesState;

  ProjectDetailItemModel copyWith(
          {String? activity,
          String? activityName,
          String? team,
          int? activeFormCount,
          bool? isSelected,
          bool? valueListIsOpen,
          MetadataIconData? metadataIconData,
          String? description,
          SyncableEntityState? state}) =>
      ProjectDetailItemModel(
          activity: activity ?? this.activity,
          activityName: activityName ?? this.activityName,
          team: team ?? this.team,
          metadataIconData: metadataIconData ?? this.metadataIconData,
          activeFormCount: activeFormCount ?? this.activeFormCount,
          syncablesState: syncablesState ?? this.syncablesState,
          description: description ?? this.description,
          isSelected: isSelected ?? this.isSelected,
          valueListIsOpen: valueListIsOpen ?? this.valueListIsOpen);

  @override
  List<Object?> get props => [
        activity,
        activityName,
        team,
        activeFormCount,
        description,
        isSelected,
        valueListIsOpen,
        metadataIconData,
        activeFormCount,
        syncablesState,
        description,
      ];
}
