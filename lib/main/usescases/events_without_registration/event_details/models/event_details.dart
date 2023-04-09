import 'package:equatable/equatable.dart';

/// data class
class EventDetails with EquatableMixin {
  const EventDetails(
      {this.name,
      this.description,
      this.enabled = true,
      this.isEditable = true,
      this.editableReason,
      this.temCreate,
      this.selectedDate,
      this.selectedOrgUnit,
      this.selectedActivity,
      this.coordinates,
      this.isCompleted = false,
      this.isActionButtonVisible = false,
      this.actionButtonText,
      this.canReopen = false});

  final String? name;
  final String? description;

  // final ObjectStyle? style;
  final bool enabled;
  final bool isEditable;
  final String? editableReason;
  final String? temCreate;
  final DateTime? selectedDate;
  final String? selectedOrgUnit;
  final String? selectedActivity;
  final String? coordinates;
  final bool isCompleted;
  final bool isActionButtonVisible;
  final String? actionButtonText;
  final bool canReopen;

  /// copyWith
  EventDetails copyWith(
          {final String? name,
          final String? description,
          // final ObjectStyle? style,
          final bool? enabled,
          final bool? isEditable,
          final String? editableReason,
          final String? temCreate,
          final DateTime? selectedDate,
          final String? selectedOrgUnit,
          final String? selectedActivity,
          final String? coordinates,
          final bool? isCompleted,
          final bool? isActionButtonVisible,
          final String? actionButtonText,
          final bool? canReopen}) =>
      EventDetails(
          name: name ?? this.name,
          description: description ?? this.description,
          enabled: enabled ?? this.enabled,
          isEditable: isEditable ?? this.isEditable,
          editableReason: editableReason ?? this.editableReason,
          temCreate: temCreate ?? this.temCreate,
          selectedDate: selectedDate ?? this.selectedDate,
          selectedOrgUnit: selectedOrgUnit ?? this.selectedOrgUnit,
          selectedActivity: selectedActivity ?? this.selectedActivity,
          coordinates: coordinates ?? this.coordinates,
          isCompleted: isCompleted ?? this.isCompleted,
          isActionButtonVisible:
              isActionButtonVisible ?? this.isActionButtonVisible,
          actionButtonText: actionButtonText ?? this.actionButtonText,
          canReopen: canReopen ?? this.canReopen);

  @override
  List<Object?> get props => [
        name,
        description,
        enabled,
        isEditable,
        editableReason,
        temCreate,
        selectedDate,
        selectedOrgUnit,
        selectedActivity,
        coordinates,
        isCompleted,
        isActionButtonVisible,
        actionButtonText,
        canReopen
      ];
}
