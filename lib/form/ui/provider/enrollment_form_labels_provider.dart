import '../../../commons/resources/resource_manager.dart';

class EnrollmentFormLabelsProvider {
  const EnrollmentFormLabelsProvider(this.resourceManager);

  final ResourceManager resourceManager;

  String get provideEnrollmentDataSectionLabel =>
      resourceManager.getString('enrollment_data_section_label');

  String get provideSingleSectionLabel =>
      resourceManager.getString('enrollment_single_section_label');

  String get provideEnrollmentOrgUnitLabel =>
      resourceManager.getString('enrolling_ou');

  String get provideTeiCoordinatesLabel =>
      resourceManager.getString('tei_coordinates');

  String get provideEnrollmentCoordinatesLabel =>
      resourceManager.getString('enrollment_coordinates');

  String get provideReservedValueWarning =>
      resourceManager.getString('no_reserved_values');

  String get provideEnrollmentDateDefaultLabel =>
      resourceManager.getString('enrollment_date');

  String get provideIncidentDateDefaultLabel =>
      resourceManager.getString('incident_date');
}
