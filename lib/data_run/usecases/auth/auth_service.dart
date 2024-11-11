import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/auth/user/entities/d_user.entity.dart';
import 'package:d2_remote/core/datarun/utilities/date_utils.dart' as sdk;

import 'package:datarun/commons/logging/logging.dart';
import 'package:datarun/data_run/usecases/network_manager/network_manager.dart';
import 'package:datarun/data_run/usecases/auth/user_session_manager.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service.g.dart';

@riverpod
AuthService authService(AuthServiceRef ref) {
  throw UnimplementedError('authenticationServiceProvider is not implemented');
}

class AuthService {
  final UserSessionManager _sessionManager;
  final NetworkManager _networkManager;

  AuthService(this._sessionManager, this._networkManager);

  Future<bool> _isFirstTime() async {
    final databaseName = await D2Remote.getDatabaseName(
        sharedPreferenceInstance: Future.sync(() => _sessionManager.prefs));

    return databaseName == null;
  }

  Future<bool> isAuthenticated() async {
    WidgetsFlutterBinding.ensureInitialized();
    final isFirstTime = await _isFirstTime();
    final networkAvailable = await _networkManager.isNetworkAvailable();
    if(isFirstTime && !networkAvailable) {
      logDebug(info: 'First time authenticate and network is not available');
      return false;
    }

    if(networkAvailable) {
      logDebug(info: 'First time authenticate and network is not available');
      return false;
    }

    final currentAuthenticatedUser =
        await _sessionManager.getCurrentSessionData();
    logDebug(
        info:
            'Check if already authenticate: , ${currentAuthenticatedUser?.username}, ${currentAuthenticatedUser?.baseUrl}');
    if (currentAuthenticatedUser != null &&
        currentAuthenticatedUser.isLoggedIn) {
      if (await _networkManager.isNetworkAvailable()) {
        logDebug(
            info:
                'attemptNetworkAuthentication and update user session data: , ${currentAuthenticatedUser.username}, ${currentAuthenticatedUser?.baseUrl}');
        return await _attemptNetworkAuthentication(currentAuthenticatedUser);
      } else {
        /// Allow offline access with valid session
        return D2Remote.isAuthenticated();
        ;
      }
    }
    return false;
  }

  Future<bool> _attemptNetworkAuthentication(DUser sessionData) async {
    try {
      final result = await _networkManager.authenticate(
        sessionData.username!,
        sessionData.password!,
        sessionData.baseUrl,
      );

      if (result.success) {
        await _sessionManager.saveSessionData(result.sessionUser!);
        return true;
      }
    } catch (e) {
      await logout();
      return false;
    }
    return false;
  }

  Future<bool> login(String username, String password,
      [String? serverUrl]) async {
    WidgetsFlutterBinding.ensureInitialized();
    if (await _networkManager.isNetworkAvailable()) {
      final result =
          await _networkManager.authenticate(username, password, serverUrl);
      if (result.success) {
        result.sessionUser!.lastModifiedDate =
            sdk.DateUtils.databaseDateFormat().format(DateTime.now().toUtc());
        await _sessionManager.saveSessionData(result.sessionUser!);
        return true;
      }
    } else {
      // logDebug(info: 'Network is not available, fallback to offline authentication');
      // if (await _sessionManager.hasLocalDatabase(username, serverUrl)) {
      //
      //   // Perform local authentication here
      //   // For now, we'll just create a session without network authentication
      //   final sessionData = SessionData(username: username, password: password);
      //   await _sessionManager.saveSessionData(sessionData, serverUrl);
      //   return true;
      // }

      logDebug(info: 'network is required for first-time login, cannot login');
    }
    return false;
  }

  Future<void> logout() async {
    await D2Remote.logOut();
    await _sessionManager.clearCurrentSessionData();
    // Additional logout logic (e.g., informing the server)
  }
}
