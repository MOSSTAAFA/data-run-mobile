enum SyncStatus {
  TO_POST,
  TO_UPDATE,
  ERROR,
  SYNCED,
  WARNING,
  UPLOADING,
  SYNCED_VIA_SMS,
  SENT_VIA_SMS;

  static List<SyncStatus> get uploadableStatesIncludingError => <SyncStatus>[
        TO_POST,
        TO_UPDATE,
        SENT_VIA_SMS,
        SYNCED_VIA_SMS,
        UPLOADING,
        ERROR,
        WARNING
      ];
}
