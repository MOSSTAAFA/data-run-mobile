import 'package:d2_remote/modules/datarun/form/entities/form_definition.entity.dart';
import 'package:d2_remote/modules/metadatarun/activity/entities/d_activity.entity.dart';
import 'package:d2_remote/modules/metadatarun/teams/entities/d_team.entity.dart';
import 'package:equatable/equatable.dart';
import 'package:mass_pro/commons/ui/metadata_icon_data.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/screens/form_submission_list/model/submission_status_count.model.dart';

class FormListItemModel with EquatableMixin {
  FormListItemModel({
    required this.form,
    this.team,
    SubmissionStatusModel? submissionStatusModel,
    this.canAddNewEvent = true,
    // this.fields
  }) : this.entityCountByStatus =
            submissionStatusModel ?? SubmissionStatusModel();

  final FormTemplateV form;
  final String? team;
  final SubmissionStatusModel entityCountByStatus;
  final bool canAddNewEvent;

  FormListItemModel copyWith(
          {FormTemplateV? form,
          String? formCode,
          String? formName,
          String? team,
          String? activity,
          String? description,
          int? version,
          SubmissionStatusModel? entityCount,
          bool? canAddNewEvent,
          SyncStatus? state}) =>
      FormListItemModel(
        form: form ?? this.form,
        team: team ?? this.team,
        submissionStatusModel: entityCount ?? this.entityCountByStatus,
        canAddNewEvent: canAddNewEvent ?? this.canAddNewEvent,
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
