import 'dart:convert';

import 'package:datarun/data_run/usecases/auth/user_session_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Define the AuthState that includes authentication info and user info
class AuthState {
  final bool isAuthenticated;
  final SessionData? sessionData;

  static final IS_AUTHENTICATED = 'IS_AUTHENTICATED';
  static final SECURE_SESSION = 'SECURE_CREDENTIALS';

  AuthState({this.isAuthenticated = false, this.sessionData});

  AuthState copyWith({bool? isAuthenticated, SessionData? sessionData}) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      sessionData: sessionData ?? this.sessionData,
    );
  }
}

// StateNotifier to manage authentication state
class AuthPreferences {
  final SharedPreferences prefs;

  AuthPreferences(this.prefs);

  // Login method: After successful login, save user data and set auth state to true
  Future<void> setNewAuthenticatedSessionData(SessionData sessionData) async {
    await setIsAuthenticated();
    await setSessionData(sessionData);
  }

  // Load user data from SharedPreferences on app startup
  Future<AuthState> loadAuthStateFromPreference() async {
    return AuthState(
        isAuthenticated: isAuthenticated, sessionData: sessionData);
  }

  Future<bool> setIsAuthenticated() {
    return prefs.setBool(AuthState.IS_AUTHENTICATED, isAuthenticated);
  }

  Future<bool> setSessionData(SessionData sessionData) {
    return prefs.setString(
        AuthState.SECURE_SESSION, jsonEncode(sessionData.toJson()));
  }

  bool get isAuthenticated {
    final isAuthenticated = prefs.getBool(AuthState.IS_AUTHENTICATED) ?? false;
    return isAuthenticated;
  }

  SessionData? get sessionData {
    SessionData? sessionData;
    final sessionDataPrefs = prefs.getString(AuthState.SECURE_SESSION) ?? '';
    if (sessionDataPrefs.isNotEmpty) {
      sessionData = SessionData.fromJson(jsonDecode(sessionDataPrefs));
    }
    return sessionData;
  }

  // Clear user data from SharedPreferences
  Future<void> clearSessionFromPreferences() async {
    prefs.remove(AuthState.IS_AUTHENTICATED);
    prefs.remove(AuthState.SECURE_SESSION);
  }

  Future<void> clearAllPreferences() {
    return prefs.clear();
  }
}
