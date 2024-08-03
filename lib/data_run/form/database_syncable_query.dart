import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun_shared/entities/syncable.entity.dart';
import 'package:d2_remote/modules/datarun_shared/queries/syncable.query.dart';
import 'package:mass_pro/commons/extensions/standard_extensions.dart';

class DatabaseSyncableQuery {
  DatabaseSyncableQuery(this.formCode);

  final String formCode;

  /// Getting the Query, latter we need to make it more Dynamic depending on the
  /// form and permissions, now we need to provide one of the
  /// following available forms:
  /// ['CHV_PATIENTS_FORM', 'CHV_SESSIONS_FORM', 'ITN_DISTRIBUTION_FORM']
  SyncableQuery provideQuery() {
    final SyncableQuery query = when<String?, SyncableQuery>(formCode, {
      'CHV_PATIENTS_FORM': () => D2Remote.iccmModule.chvRegister,
      'CHV_SESSIONS_FORM': () => D2Remote.iccmModule.chvSession,
      'CHV_SUPPLY_FORM': () => D2Remote.iccmModule.chvSupply,
      'ITN_DISTRIBUTION_FORM': () => D2Remote.itnsVillageModule.itnsVillage,
    }).orElse(() => throw Exception('UnAvailable Entity for Form: $formCode'));
    return query;
  }
}
