import 'dart:async';
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/auth/user/entities/d_user.entity.dart';
import 'package:d2_remote/modules/auth/user/models/login-response.model.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/commons/extensions/standard_extensions.dart';
import 'package:mass_pro/commons/logging/logging.dart';
import 'package:mass_pro/core/network/connectivy_service.dart';
import 'package:mass_pro/core/user/authenticated_user.model.dart';
import 'package:mass_pro/core/user/internal/log_in_exceptions.dart';
import 'package:mass_pro/data_run/errors_management/error_management.dart';
import 'package:mass_pro/data_run/screens/home_screen/home_screen.widget.dart';
import 'package:mass_pro/utils/navigator_key.dart';

class UserService {
  static final UserService _instance = UserService._internal();

  UserService._internal();

  static UserService get instance => _instance;

  final StreamController<AuthenticatedUser?> _authUserController =
      StreamController<AuthenticatedUser?>.broadcast();

  Stream<AuthenticatedUser?> get authStateUser => _authUserController.stream;

  AuthenticatedUser? _user;

  AuthenticatedUser? get user => _user;

  bool get isLoggedIn => _user?.isLoggedIn ?? false;

  bool get isActivated => _user?.activated ?? false;

  bool get isAuthenticated => isLoggedIn;

  Future<void> checkAuthStatus() async {
    final localUser = await D2Remote.authenticatedUser();
    final authenticatedUser = localUser != null
        ? AuthenticatedUser.fromMap(localUser.toJson())
        : null;

    _updateAuthenticatedUser(authenticatedUser);
  }

  void _updateAuthenticatedUser(AuthenticatedUser? user) {
    // if (user != _user) {
    _user = user;
    _authUserController.add(user);
    // }
  }

  Future<LoginResponseStatus> logIn(
      String username, String password, String serverUrl) async {
    LoginResponseStatus? responseStatus;
    DUser? currentUser;

    if (ConnectivityService.instance.isOnline) {
      logDebug(
          info: 'Performing online authentication ...',
          runtimeType: this.runtimeType);
      responseStatus = await D2Remote.logInDataRun(
          username: username, password: password, url: serverUrl);
    } else {
      logDebug(
          info: 'Performing Offline Authenticate...',
          runtimeType: this.runtimeType);
      currentUser = await D2Remote.userModule.user.getOne();

      // getLastLoggedInUserDbName
      final dbName = await D2Remote.getDatabaseName();

      if (dbName != null) {
        currentUser = await D2Remote.userModule.user
            .where(attribute: 'username', value: username)
            .where(attribute: 'password', value: password)
            .getOne();

        currentUser?.isLoggedIn = false;
        currentUser?.dirty = true;
        await D2Remote.userModule.user.setData(currentUser).save();
        final authenticatedUser =
            AuthenticatedUser.fromMap(currentUser!.toJson());
        _updateAuthenticatedUser(authenticatedUser);
      }

      responseStatus = currentUser != null
          ? LoginResponseStatus.OFFLINE_LOGIN_SUCCESS
          : LoginResponseStatus.OFFLINE_LOGIN_ERROR;
    }
    return responseStatus;
    switch (responseStatus) {
      case LoginResponseStatus.ONLINE_LOGIN_SUCCESS:
      case LoginResponseStatus.OFFLINE_LOGIN_SUCCESS:
        final authenticatedUser =
            AuthenticatedUser.fromMap(currentUser!.toJson());
        _updateAuthenticatedUser(authenticatedUser);
        pushUniqueScreen(navigatorKey.currentContext!, HomeScreen.routeName);
        logDebug(
            info: 'Authentication Success: ${responseStatus?.name}!',
            runtimeType: this.runtimeType);
        return responseStatus;
      case LoginResponseStatus.OFFLINE_LOGIN_ERROR:
        _updateAuthenticatedUser(null);
        throw AuthenticationException();
      case LoginResponseStatus.WRONG_CREDENTIALS:
        _updateAuthenticatedUser(null);
        logDebug(
            info: 'Online Authentication Failed: WRONG_CREDENTIALS!',
            runtimeType: this.runtimeType);
        throw badCredentialsError();
      case LoginResponseStatus.SERVER_ERROR:
        logDebug(
            info: 'Online Authentication Failed: SERVER_ERROR!',
            runtimeType: this.runtimeType);
        _updateAuthenticatedUser(null);
        throw serverError();
    }
  }

  Future<void> logOut() async {
    WidgetsFlutterBinding.ensureInitialized();
    DUser? currentUser;
    try {
      currentUser = await D2Remote.userModule.user.getOne();

      currentUser?.isLoggedIn = false;
      currentUser?.dirty = true;

      await D2Remote.userModule.user.setData(currentUser).save();
    } catch (e) {
      logError(info: 'Error logging out');
    } finally {
      _updateAuthenticatedUser(null);
    }
  }

  void dispose() {
    _authUserController.close();
  }
}

class AuthenticationException extends DException {}
