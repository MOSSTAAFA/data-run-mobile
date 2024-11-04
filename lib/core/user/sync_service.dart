// import 'package:mass_pro/commons/constants.dart';
// import 'package:mass_pro/core/network/connectivy_service.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SyncService {
//
//   Future<void> initialize() {
//     ConnectivityService.instance.connectivityStatusStream.listen((isOnline) {
//       if (isOnline) {
//         _checkSyncStatus();
//       }
//     });
//     return _checkSyncStatus();
//   }
//
//   Future<void> _checkSyncStatus() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     int? lastSyncTime = prefs.getInt(LAST_META_SYNC);
//     int syncingCheckPeriod = prefs.getInt('syncingCheckPeriod') ?? 6;
//
//     if (lastSyncTime != null) {
//       DateTime lastSyncDate = DateTime.fromMillisecondsSinceEpoch(lastSyncTime);
//       DateTime currentDate = DateTime.now();
//       if (currentDate.difference(lastSyncDate).inDays > syncingCheckPeriod) {
//         // Show loading and sync
//         await _performSync();
//       }
//     } else {
//       // No sync data, perform initial sync
//       await _performSync();
//     }
//   }
//
//   Future<void> _performSync() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setInt(LAST_META_SYNC, DateTime.now().millisecondsSinceEpoch);
//   }
// }
