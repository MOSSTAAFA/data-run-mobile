enum State {
  TO_POST,
  TO_UPDATE,
  ERROR,
  SYNCED,
  WARNING,
  UPLOADING,
  SYNCED_VIA_SMS,
  SENT_VIA_SMS;

  static List<State> get uploadableStatesIncludingError => [
        TO_POST,
        TO_UPDATE,
        SENT_VIA_SMS,
        SYNCED_VIA_SMS,
        UPLOADING,
        ERROR,
        WARNING
      ];

  static List<State> get uploadableStates =>
      [TO_POST, TO_UPDATE, SENT_VIA_SMS, SYNCED_VIA_SMS, UPLOADING];
}
