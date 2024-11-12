import 'dart:convert';

import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/auth/user/entities/d_user.entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_session_manager.g.dart';

@riverpod
UserSessionManager userSessionManager(UserSessionManagerRef ref) {
  throw UnimplementedError('userSessionManagerProvider is not implemented');
}

@riverpod
Future<DUser?> userInfo(UserInfoRef ref) {
  return D2Remote.userModule.user.getOne();
}

class UserSessionManager {
  static List<String> ALL_USER_PREFERENCE = [
    IS_AUTHENTICATED,
    SECURE_SESSION,
    LAST_META_SYNC,
    LAST_DATA_SYNC,
    INITIAL_METADATA_SYNC_DONE,
    INITIAL_DATA_SYNC_DONE,
    TIME_META,
    TIME_DATA,
    // INITIAL_SYNC,
    META_NOW,
    META,
    DATA,
    SECURE_CREDENTIALS,
    SECURE_SERVER_URL,
    SECURE_USER_NAME,
    SECURE_PASS,
    METADATA_STATE,
    METADATA_MESSAGE
  ];
  static const METADATA_STATE = 'METADATA_STATE';
  static const METADATA_MESSAGE = 'METADATA_MESSAGE';

  static const IS_AUTHENTICATED = 'IS_AUTHENTICATED';
  static const SECURE_SESSION = 'SECURE_SESSION';
  static const LAST_META_SYNC = 'last_meta_sync';
  static const LAST_DATA_SYNC = 'last_data_sync';
  static const INITIAL_METADATA_SYNC_DONE = 'INITIAL_META_SYNC_DONE';
  static const INITIAL_DATA_SYNC_DONE = 'INITIAL_DATA_SYNC_DONE';

  static const TIME_META = 'timeMeta';
  static const TIME_DATA = 'timeData';
  // static const INITIAL_SYNC = 'INITIAL_SYNC';
  static const META_NOW = 'METADATA_NOW';
  static const META = 'METADATA';
  static const DATA = 'DATA';
  static const SECURE_CREDENTIALS = 'SECURE_CREDENTIALS';
  static const SECURE_SERVER_URL = 'SEURE_SERVER_URL';
  static const SECURE_USER_NAME = 'SECURE_USER_NAME';
  static const SECURE_PASS = 'SECURE_PASS';

  // PREFERENCES
  static const SHARE_PREFS = 'org.dhis2';
  static const PREFS_URLS = 'pref_urls';
  static const PREFS_USERS = 'pref_users';

  final SharedPreferences prefs;

  UserSessionManager(this.prefs);

  bool get isFirstSession {
    final session = sessionData;
    return sessionData == null;
  }

  String? get databaseName {
    if (sessionData == null) {
      return null;
    }
    final uri = Uri.parse(sessionData!.serverUrl!).host;
    return '${sessionData!.username!}_$uri';
  }

  /// After successful login, save user data
  Future<void> saveUserCredentials(
      {required String serverUrl,
      required String username,
      required String pass}) async {
    await prefs.setBool(IS_AUTHENTICATED, true);
    final sessionData =
        SessionData(username: username, password: pass, serverUrl: serverUrl);
    await prefs.setString(SECURE_SESSION, jsonEncode(sessionData.toJson()));
    // Add the database name to the set of known databases
    final urls = prefs.getStringList(PREFS_URLS) ?? [];
    if (!urls.contains(serverUrl)) {
      urls.add(serverUrl);
      await prefs.setStringList(PREFS_URLS, urls);
    }

    // Add the username to the set of known usernames
    final usernames = prefs.getStringList(PREFS_USERS) ?? [];
    if (!usernames.contains(username)) {
      usernames.add(username);
      await prefs.setStringList(PREFS_USERS, usernames);
    }
  }

  Future<List<String>> getKnownUserNames() async {
    return prefs.getStringList(PREFS_USERS) ?? [];
  }

  bool get isAuthenticated {
    final isAuthenticated = prefs.getBool(IS_AUTHENTICATED) ?? false;
    return isAuthenticated;
  }

  SessionData? get sessionData {
    SessionData? sessionData;
    final sessionDataPrefs = prefs.getString(SECURE_SESSION) ?? '';
    if (sessionDataPrefs.isNotEmpty) {
      sessionData = SessionData.fromJson(jsonDecode(sessionDataPrefs));
    }
    return sessionData;
  }

  // Clear user data from SharedPreferences
  Future<void> clearSessionFromPreferences() async {
    prefs.remove(D2Remote.currentDatabaseNameKey);
    prefs.remove(IS_AUTHENTICATED);
    prefs.remove(SECURE_SESSION);
    // prefs.
  }

  Future<void> clearAllPreferences() async {
    prefs.remove(INITIAL_METADATA_SYNC_DONE);
    prefs.remove(INITIAL_DATA_SYNC_DONE);
    // prefs.remove(INITIAL_SYNC);
    prefs.remove(LAST_META_SYNC);
    prefs.remove(LAST_DATA_SYNC);
    prefs.remove(META);
    prefs.remove(DATA);

    prefs.remove(D2Remote.currentDatabaseNameKey);
    prefs.remove(IS_AUTHENTICATED);
    prefs.remove(SECURE_SESSION);
    prefs.remove(SECURE_CREDENTIALS);
    prefs.remove(SECURE_SERVER_URL);
    prefs.remove(SECURE_USER_NAME);
    prefs.remove(SECURE_PASS);
  }
}

class SessionData {
  final String? username;
  final String? password;
  final String? serverUrl;
  final String? token;
  final DateTime? expirationDate;

  SessionData({
    required this.username,
    required this.password,
    required this.serverUrl,
    this.token,
    this.expirationDate,
  });

  factory SessionData.fromJson(Map<String, dynamic> json) {
    return SessionData(
      username: json['username'],
      password: json['password'],
      serverUrl: json['serverUrl'],
      token: json['token'],
      expirationDate: json['expirationDate'] != null
          ? DateTime.parse(json['expirationDate'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'serverUrl': serverUrl,
      'token': token,
      'expirationDate': expirationDate?.toIso8601String(),
    };
  }
}
