// import 'package:d2_remote/d2_remote.dart';
// import 'package:d2_remote/modules/auth/user/entities/d_user.entity.dart';
// import 'package:d2_remote/modules/auth/user/queries/d_user.query.dart';
// import 'package:datarun/commons/constants.dart';
// import 'package:datarun/commons/logging/app_logger.dart';
// import 'package:datarun/commons/logging/logging.dart';
// import 'package:datarun/commons/prefs/preference.dart';
// import 'package:flutter/widgets.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// part 'user_session_manager.g.dart';
//
// @riverpod
// UserSessionManager userSessionManager(UserSessionManagerRef ref) {
//   throw UnimplementedError('userSessionManagerProvider is not implemented');
// }
//
// class UserSessionManager {
//   UserSessionManager(this.prefs);
//
//   final SharedPreferences prefs;
//
//   Future<DUser?> getCurrentSessionData() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     final databaseName = await getCurrentDatabaseName();
//
//     if (databaseName == null) {
//       return null;
//     }
//
//     await D2Remote.initialize(databaseName: databaseName);
//
//     DUser? user = await D2Remote.userModule.user.getOne();
//
//     if (user != null) {
//       return user;
//     }
//
//     return null;
//   }
//
//   /// if authenticate online success set the database name for the current
//   /// user, which the app will use to store data until the user logs out.
//   Future<void> saveSessionData(DUser user) async {
//     final databaseName = _generateDatabaseName(user.username!, user.baseUrl);
//
//
//     await D2Remote.initialize(databaseName: databaseName);
//
//     await D2Remote.setDatabaseName(
//         databaseName: databaseName,
//         sharedPreferenceInstance: Future.sync(() => prefs));
//
//     final userQuery = DUserQuery();
//     final savedCount = await userQuery
//         // .setData(user)
//         .save();
//
//     if (savedCount == 1) {
//       AppLogger.logInfo('User saved successfully: $user, databaseName: $databaseName');
//
//       await prefs.setBool(SECURE_CREDENTIALS, true);
//
//       // save the server URL for future authentication
//       await prefs.setString(SECURE_SERVER_URL, user.baseUrl);
//
//       // save the username and password for future authentication
//       await prefs.setString(SECURE_USER_NAME, user.username!);
//
//       // Add the database name to the set of known databases
//       final urls = prefs.getStringList(PREFS_URLS) ?? [];
//       if (!urls.contains(user.baseUrl)) {
//         urls.add(user.baseUrl);
//         await prefs.setStringList(PREFS_URLS, urls);
//       }
//
//       // Add the username to the set of known usernames
//       final usernames = prefs.getStringList(PREFS_USERS) ?? [];
//       if (!usernames.contains(user.username)) {
//         usernames.add(user.username!);
//         await prefs.setStringList(PREFS_USERS, usernames);
//       }
//     } else {
//       AppLogger.logWarning(
//           'Failed to save user data: $user, databaseName: $databaseName');
//     }
//
//
//   }
//
//   /// set the database name based on the user's username and server URL'
//   String _generateDatabaseName(String username, String serverUrl) {
//     final uri = Uri.parse(serverUrl).host;
//     return '${username}_$uri';
//   }
//
//   Future<void> clearCurrentSessionData() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(SECURE_SERVER_URL);
//     await prefs.remove(SECURE_USER_NAME);
//     await prefs.remove(SECURE_PASS);
//   }
//
//   Future<void> saveUserCredentials(
//       String serverUrl, String userName, String pass) async {
//     // TODO(NMC):  encrypted
//     await prefs.setBool(SECURE_CREDENTIALS, true);
//     await prefs.setString(SECURE_SERVER_URL, serverUrl);
//     await prefs.setString(SECURE_USER_NAME, userName);
//     await prefs.setString(SECURE_USER_NAME, userName);
//   }
//
//   Future<List<String>> getKnownUserNames() async {
//     return prefs.getStringList(PREFS_USERS) ?? [];
//   }
//
//   Future<String?> getCurrentDatabaseName() async {
//     return prefs.getString(D2Remote.currentDatabaseNameKey);
//   }
//
//   Future<String?> getLastLoggedInUser() async {
//     return prefs.getString(SECURE_USER_NAME);
//   }
//
//   Future<String?> getLastServerUrl() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString(SECURE_SERVER_URL);
//   }
//
//   bool isSessionExpired(SessionData sessionData) {
//     if (sessionData.expirationDate == null) return false;
//     final now = DateTime.now();
//     return now.isAfter(sessionData.expirationDate!);
//   }
//
//   Future<void> _clearUserFromPreferences() async {
//     prefs.remove('user');
//   }
// // // Method to check if a user has a local database (for offline login)
// // Future<bool> hasLocalDatabase(String username, String serverUrl) async {
// //   final databaseNames = await getKnownDatabaseNames();
// //   final databaseName = _generateDatabaseName(username, serverUrl);
// //   return databaseNames.contains(databaseName);
// // }
// }
//
