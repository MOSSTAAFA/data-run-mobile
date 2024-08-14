import 'package:d2_remote/modules/datarun/form/entities/form_definition.entity.dart';
import 'package:d2_remote/modules/metadatarun/activity/entities/d_activity.entity.dart';
import 'package:d2_remote/modules/metadatarun/teams/entities/d_team.entity.dart';
import 'package:equatable/equatable.dart';
import 'package:mass_pro/commons/ui/metadata_icon_data.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';
import 'package:mass_pro/data_run/screens/project_details/model/entity_count.dart';

class FormListItemModel with EquatableMixin {
  FormListItemModel({
    required this.form,
    this.team,
    EntityCountByStatus? entityCount,
    this.canAddNewEvent = true,
    // this.fields
  }) : this.entityCountByStatus = entityCount ?? EntityCountByStatus();

  final FormDefinition form;
  final String? team;
  final EntityCountByStatus entityCountByStatus;
  final bool canAddNewEvent;

  // final IList<QFieldModel>? fields;

  FormListItemModel setFields(List<QFieldModel>? fields) {
    return copyWith(fields: fields);
  }

  FormListItemModel copyWith(
          {FormDefinition? form,
          String? formCode,
          String? formName,
          String? team,
          String? activity,
          String? description,
          int? version,
          EntityCountByStatus? entityCount,
          bool? canAddNewEvent,
          List<QFieldModel>? fields,
          SyncableEntityState? state}) =>
      FormListItemModel(
        form: form ?? this.form,
        team: team ?? this.team,
        entityCount: entityCount ?? this.entityCountByStatus,
        canAddNewEvent: canAddNewEvent ?? this.canAddNewEvent,
        // fields: IList.orNull(fields) ?? this.fields,
      );

  @override
  List<Object?> get props => <Object?>[
        form,
        team,
        entityCountByStatus,
        canAddNewEvent,
        // fields,
      ];
}

class ProjectDetailItemModel with EquatableMixin {
  ProjectDetailItemModel(
      {
      /// activity uid
      required this.activity,
      this.team,
      this.activityForms = 0,
      this.isSelected = false,
      this.valueListIsOpen = true,
      this.description,
      this.metadataIconData});

  final DActivity activity;
  final DTeam? team;

  final int activityForms;

  final bool isSelected;
  final bool valueListIsOpen;
  final String? description;
  final MetadataIconData? metadataIconData;

  ProjectDetailItemModel copyWith(
          {DActivity? activity,
          DTeam? team,
          int? activityForms,
          bool? isSelected,
          bool? valueListIsOpen,
          String? description,
          MetadataIconData? metadataIconData}) =>
      ProjectDetailItemModel(
          activity: activity ?? this.activity,
          team: team ?? this.team,
          description: description ?? this.description,
          metadataIconData: metadataIconData ?? this.metadataIconData,
          activityForms: activityForms ?? this.activityForms,
          isSelected: isSelected ?? this.isSelected,
          valueListIsOpen: valueListIsOpen ?? this.valueListIsOpen);

  @override
  List<Object?> get props => <Object?>[
        activity,
        team,
        activityForms,
        isSelected,
        valueListIsOpen,
        metadataIconData,
        description,
        activityForms
      ];
}
