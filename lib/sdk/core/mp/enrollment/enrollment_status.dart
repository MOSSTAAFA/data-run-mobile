enum EnrollmentStatus {
  ACTIVE,
  COMPLETED,
  CANCELLED;

  static EnrollmentStatus? valueOf(String? str) =>
      EnrollmentStatus.values.firstWhere(
          (EnrollmentStatus e) => e.toString() == 'EnrollmentStatus.' '$str',
          orElse: () => ACTIVE);
}

extension ToEnrollmentStatusExtension on String? {
  EnrollmentStatus? get toEnrollmentStatus {
    try {
      // ignore: dead_code
      return EnrollmentStatus.values.firstWhere(
          (EnrollmentStatus status) => status.name == this,
          orElse: throw ArgumentError(
              'The EnrollmentStatus $this does not match any Status type'));
    } catch (e) {
      return null;
    }
  }
}
