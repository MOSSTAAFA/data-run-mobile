abstract class EnrollmentService {
  ///
  /// Checks if the enrollment status is ACTIVE.
  ///
  Future<bool> isOpen(String enrollmentUid);

  // ///
  // /// Blocking version of [getEnrollmentAccess].
  // ///
  // /// @see getEnrollmentAccess
  // ///
  // Future<EnrollmentAccess> getEnrollmentAccess(
  //     String trackedEntityInstanceUid, String programUid);

  // ///
  // /// Evaluates the access level of the user to this program and trackedEntityInstance.
  // ///
  // /// It checks the data access level to the program, the program access level (OPEN, PROTECTED,...)
  // /// and the enrollment orgunit scope (SEARCH or CAPTURE).
  // ///
  // Future<EnrollmentAccess> getEnrollmentAccess(
  //     String trackedEntityInstanceUid, String programUid);

  Future<bool> getAllowEventCreation(
      String enrollmentUid, List<String> stagesToHide);

  Future<bool> allowEventCreation(
      String enrollmentUid, List<String> stagesToHide);
}
