import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:equatable/equatable.dart';

/// data class
class EventOrgUnit with EquatableMixin {
  const EventOrgUnit(
      {this.visible = false,
      this.enable = false,
      this.fixed = false,
      this.selectedOrgUnit,
      this.orgUnits = const <OrganisationUnit>[],
      this.programUid});

  final bool visible;
  final bool enable;
  final bool fixed;
  final OrganisationUnit? selectedOrgUnit;
  final List<OrganisationUnit> orgUnits;

  final String? programUid;

  /// copyWith
  EventOrgUnit copyWith(
          {final bool? visible,
          final bool? enable,
          final bool? fixed,
          final OrganisationUnit? selectedOrgUnit,
          final List<OrganisationUnit>? orgUnits}) =>
      EventOrgUnit(
          visible: visible ?? this.visible,
          enable: enable ?? this.enable,
          fixed: fixed ?? this.fixed,
          selectedOrgUnit: selectedOrgUnit ?? this.selectedOrgUnit,
          orgUnits: orgUnits ?? this.orgUnits);

  @override
  List<Object?> get props =>
      [visible, enable, fixed, selectedOrgUnit, orgUnits, programUid];
}
