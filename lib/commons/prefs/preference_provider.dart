import 'package:dartx/dartx_io.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../date/date_utils.dart';
import '../extensions/standard_extensions.dart';

class PreferenceProvider {
  static late final SharedPreferences _instance;

  static const String LAST_META_SYNC = 'last_meta_sync';
  static const String LAST_DATA_SYNC = 'last_data_sync';

  static const String SECURE_CREDENTIALS = 'SECURE_CREDENTIALS';
  static const String SECURE_SERVER_URL = 'SECURE_SERVER_URL';
  static const String SECURE_USER_NAME = 'SECURE_USER_NAME';
  static const String SECURE_PASS = 'SECURE_PASS';
  static const String SHARE_PREFS = 'org.dhis2';
  static const String JIRA_AUTH = 'JIRA_AUTH';
  static const String JIRA_USER = 'JIRA_USER';

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async =>
      _instance = await SharedPreferences.getInstance();

  Future<bool> setValue(String key, dynamic value) async {
    if (value != null) {
      if (value is String) {
        return _instance.setString(key, value);
      }

      if (value is bool) {
        return _instance.setBool(key, value);
      }

      if (value is int) {
        return _instance.setInt(key, value);
      }
      if (value is double) {
        return _instance.setDouble(key, value);
      }
      if (value is List<String>) {
        return _instance.setStringList(key, value);
      }
    }
    return Future<bool>.value(false);
  }

  Future<bool> removeValue(String key) {
    return _instance.remove(key);
  }

  String? getString(String key, [String? defaultValue]) {
    return _instance.getString(key) ?? defaultValue;
  }

  int getInt(String key, int defaultValue) {
    return _instance.getInt(key) ?? defaultValue;
  }

  bool getBoolean(String key, bool defaultValue) {
    return _instance.getBool(key) ?? defaultValue;
  }

  double? getDouble(String key, [double? defaultValue]) {
    return _instance.getDouble(key) ?? defaultValue;
  }

  Iterable<String>? getList(String key, [List<String>? defaultValue]) {
    return _instance.getStringList(key) ?? defaultValue;
  }

  bool contains(Iterable<String> keys) {
    // return _instance.getKeys().containsAny(keys);
    return _instance.getKeys().containsAll(keys);
  }

  Future<bool> clear() async {
    return _instance.clear();
  }

  DateTime? lastMetadataSync() {
    return getString(LAST_META_SYNC)?.let((String lastMetadataSyncString) =>
        DateUtils.dateTimeFormat().parse(lastMetadataSyncString));
  }

  DateTime? lastDataSync() {
    return getString(LAST_DATA_SYNC)?.let((String lastDataSyncString) =>
        DateUtils.dateTimeFormat().parse(lastDataSyncString));
  }

  DateTime? lastSync() {
    final List<DateTime> dateSync = [];
    lastMetadataSync()?.let((DateTime it) => dateSync.add(it));
    lastDataSync()?.let((DateTime it) => dateSync.add(it));
    return dateSync.min();
  }

  T getObjectFromJson<T>(String key, Type typeToken, [T? defaultValue]) {
    // TODO: implement getObjectFromJson
    throw UnimplementedError();
  }

  void saveAsJson<T>(String key, T objectToSave) {
    // TODO: implement saveAsJson
  }

  static Future<bool> saveUserCredentials(
      String serverUrl, String userName, String pass) async {
    // TODO(NMC):  encrypted
    await _instance.setBool(SECURE_CREDENTIALS, true);
    await _instance.setString(SECURE_SERVER_URL, serverUrl);
    await _instance.setString(SECURE_USER_NAME, userName);
    if (pass.isNotEmpty) {
      await _instance.setString(SECURE_PASS, pass);
    }
    return Future<bool>.value(true);
  }

  static bool areCredentialsSet() {
    // TODO: implement areCredentialsSet
    throw UnimplementedError();
  }

  static bool areSameCredentials(
      String serverUrl, String userName, String pass) {
    // TODO: implement areSameCredentials
    throw UnimplementedError();
  }

  String saveJiraCredentials(String jiraAuth) {
    // TODO: implement saveJiraCredentials
    throw UnimplementedError();
  }

  void saveJiraUser(String jiraUser) {
    // TODO: implement saveJiraUser
  }

  void closeJiraSession() {
    // TODO: implement closeJiraSession
  }

// SharedPreferences sharedPreferences();
// void saveUserCredentials(String serverUrl, String userName, String pass);
// bool areCredentialsSet();
// bool areSameCredentials(String serverUrl, String userName, String pass);
// String saveJiraCredentials(String jiraAuth);
// void saveJiraUser(String jiraUser);
// void closeJiraSession();
// void clear();
// void setValue(String key, dynamic value);
// void removeValue(String key);
// bool contains(/*vararg*/ List<String> keys);
// String? getString(String key, String? defaultValue);
// int getInt(String key, int defaultValue);
// // long? getLong(String key, long defaultValue);
// bool getBoolean(String key, bool defaultValue);
// double? getDouble(String key, double defaultValue);
// Set<String>? getSet(String key, Set<String> defaultValue);
// T getObjectFromJson<T>(
//     String key, /*TypeToken<T>*/ Type typeToken, T defaultValue);
// void saveAsJson<T>(String key, T objectToSave);
// DateTime? lastMetadataSync();
// DateTime? lastDataSync();
// DateTime? lastSync();
}
