import 'package:d2_remote/modules/auth/user/entities/user.entity.dart';
import 'package:d2_remote/modules/auth/user/models/login-response.model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../usescases/bundle/bundle.dart';

abstract class UserManager {
  Future<LoginResponseStatus> logIn(
      String username, String password, String serverUrl,
      {Future<SharedPreferences>? sharedPreferenceInstance,
      bool? inMemory,
      Dio? dioTestClient});

  Future<User?> handleAuthData(
      {String serverUrl, Bundle? data, int? requestCode});

  Future<bool> isUserLoggedIn(
      {Future<SharedPreferences>? sharedPreferenceInstance, bool? inMemory});

  Future<String> userInitials();

  Future<String> userFullName();

  Future<String> userName();

  // D2 getD2();

  Future<bool> hasMultipleAccounts();

  // Future<Pair<String, Integer>> getTheme();

  Future<bool> logOut();

  Future<bool> allowScreenShare();
}
