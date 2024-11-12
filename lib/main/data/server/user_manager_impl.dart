import 'package:d2_remote/core/datarun/exception/authentication_exceptions.dart';
import 'package:d2_remote/core/datarun/exception/d_error_code.dart';
import 'package:d2_remote/core/datarun/exception/exception.dart';
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/auth/user/entities/d_user.entity.dart';
import 'package:d2_remote/modules/auth/user/models/login-response.model.dart';
import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:datarun/main/usescases/login/login_screen.widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:datarun/main/data/server/user_manager.dart';

import '../../../utils/navigator_key.dart';

part 'user_manager_impl.g.dart';

@riverpod
UserManager userManager(UserManagerRef ref) {
  return UserManagerImpl();
}

class UserManagerImpl implements UserManager {
  const UserManagerImpl();

  @override
  Future<LoginResponseStatus> logIn(
      String username, String password, String serverUrl,
      {Future<SharedPreferences>? sharedPreferenceInstance,
      bool? inMemory,
      Dio? dioTestClient}) async {
    final responseStatus = LoginResponseStatus.WRONG_CREDENTIALS;
    // throwExceptionIfUsernameNull(username);
    // throwExceptionIfPasswordNull(password);
    // await throwExceptionIfAlreadyAuthenticated(username);

    // final LoginResponseStatus responseStatus = await D2Remote.logInDataRun(
    //     username: username,
    //     password: password,
    //     url: serverUrl,
    //     sharedPreferenceInstance: sharedPreferenceInstance,
    //     inMemory: inMemory,
    //     dioTestClient: dioTestClient);

    when(responseStatus, {
      LoginResponseStatus.WRONG_CREDENTIALS: () =>
          throw AuthenticationException('authInvalidCredentials',
              errorCode: DErrorCode.authInvalidCredentials),
      LoginResponseStatus.SERVER_ERROR: () => throw InternalServerError()
    });

    return responseStatus;
  }

  @override
  Future<DUser?> handleAuthData({String serverUrl = '', int? requestCode}) {
    return Future.value();
  }

  @override
  Future<bool> isUserLoggedIn(
      {Future<SharedPreferences>? sharedPreferenceInstance, bool? inMemory}) {
    return D2Remote.isAuthenticated(
        sharedPreferenceInstance: sharedPreferenceInstance, inMemory: inMemory);
  }

  @override
  Future<String> userInitials() {
    return D2Remote.userModule.user.getOne().then((user) {
      return '${user?.firstName?[0] ?? ''}${user?.surname?[0] ?? ''}';
    });
  }

  @override
  Future<String> userFullName() {
    return D2Remote.userModule.user.getOne().then((user) {
      return '${user?.firstName ?? ''} ${user?.surname ?? ''}';
    });
  }

  @override
  Future<String> userName() {
    return D2Remote.userModule.user.getOne().then((user) {
      return user?.username ?? '';
    });
  }

  // D2 getD2(){}

  @override
  Future<bool> hasMultipleAccounts() {
    return Future.value(false);
  }

  // Future<Pair<String, Integer>> getTheme(){}

  @override
  Future<bool> logOut() {
    // Get.offAll(() => const LoginScreen());
    // Navigator.push(
    //   navigatorKey.currentContext!,
    //   MaterialPageRoute(builder: (context) => const LoginScreen()),
    // );
    return D2Remote.logOut();
  }

  @override
  Future<bool> allowScreenShare() {
    return Future.value(true);
  }
}
