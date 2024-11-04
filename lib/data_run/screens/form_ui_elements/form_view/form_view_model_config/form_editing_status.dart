abstract class FormEditingStatus {
  void editable();

  void nonEditable(final FormNonEditableReason reason);
}

enum FormNonEditableReason {
  EXPIRED,
  NO_DATA_WRITE_ACCESS,
}
