enum SubmissionStatus {
  ACTIVE,
  COMPLETED;

  static SubmissionStatus getEnumValue(String? status) {
    switch (status?.toLowerCase()) {
      case 'active':
        return ACTIVE;
      case 'completed':
        return COMPLETED;
      default:
        return ACTIVE;
    }
  }
}
