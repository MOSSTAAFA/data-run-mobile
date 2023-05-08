import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/auth/user/entities/user.entity.dart';
import 'package:d2_remote/modules/auth/user/models/login-response.model.dart';
import 'package:dartlin/control_flow.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/user/internal/log_in_exceptions.dart';
import '../../usescases/bundle/bundle.dart';
import 'user_manager.dart';

part 'user_manager_impl.g.dart';

@riverpod
UserManager userManager(UserManagerRef ref) {
  return const UserManagerImpl();
}

class UserManagerImpl implements UserManager {
  const UserManagerImpl();

  @override
  Future<LoginResponseStatus> logIn(
      String username, String password, String serverUrl,
      {Future<SharedPreferences>? sharedPreferenceInstance,
      bool? inMemory,
      Dio? dioTestClient}) async {
    throwExceptionIfUsernameNull(username);
    throwExceptionIfPasswordNull(password);
    await throwExceptionIfAlreadyAuthenticated(username);

    final LoginResponseStatus responseStatus = await D2Remote.logIn(
        username: username,
        password: password,
        url: serverUrl,
        sharedPreferenceInstance: sharedPreferenceInstance,
        inMemory: inMemory,
        dioTestClient: dioTestClient);

    when(responseStatus, {
      LoginResponseStatus.WRONG_CREDENTIALS: () => throw badCredentialsError(),
      LoginResponseStatus.SERVER_ERROR: () => throw serverError()
    });

    return responseStatus;
  }

  @override
  Future<User?> handleAuthData(
      {String serverUrl = '', Bundle? data, int? requestCode}) {
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
      return '${user?.firstName[0] ?? ''}${user?.surname?[0] ?? ''}';
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
    return D2Remote.logOut();
  }

  @override
  Future<bool> allowScreenShare() {
    return Future.value(true);
  }
}
