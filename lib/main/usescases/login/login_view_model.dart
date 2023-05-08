import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../commons/extensions/dynamic_extensions.dart';
import '../../../commons/extensions/string_extension.dart';
import '../../../commons/helpers/collections.dart';

part 'login_view_model.g.dart';

@riverpod
class LoginModel extends _$LoginModel {
  @override
  LoginViewModel build() {
    logInfo(info: 'LoginModel created');

    ref.onDispose(() => logInfo(info: 'dispose: LoginModel'));
    return LoginViewModel();
  }

  void onServerChanged(String serverUrl) {
    if (serverUrl != state.serverUrl) {
      state = state.copyWith(serverUrl: serverUrl);
      _checkData();
      if (state.serverUrl != null) {
        _checkTestingEnvironment(state.serverUrl!);
      }
    }
  }

  void onUserChanged(String userName) {
    if (userName != state.userName) {
      state = state.copyWith(userName: userName);
      _checkData();
    }
  }

  void onPassChanged(String password) {
    if (password != state.password) {
      state = state.copyWith(password: password);
      _checkData();
    }
  }

  void _checkData() {
    final newValue = !state.serverUrl.isNullOrEmpty &&
        !state.userName.isNullOrEmpty &&
        !state.password.isNullOrEmpty;
    if (state.isDataComplete == null || state.isDataComplete != newValue) {
      state = state.copyWith(isDataComplete: newValue);
    }
  }

  void _checkTestingEnvironment(String serverUrl) {
    if (state.testingCredentials?.containsKey(serverUrl) == true &&
        state.testingCredentials!.get(serverUrl) != null) {
      state = state.copyWith(
          isTestingEnvironment: Trio<String, String, String>(
              serverUrl,
              state.testingCredentials!.get(serverUrl)!.username,
              state.testingCredentials!.get(serverUrl)!.userPass));
    }
  }

  void setTestingCredentials(List<TestingCredential> testingCredentials) {
    state = state.copyWith(
        testingCredentials:
            IMap.fromIterable<String, TestingCredential?, TestingCredential>(
      testingCredentials,
      keyMapper: (credential) => credential.serverUrl,
      valueMapper: (credential) => credential,
    ));
  }

  void setAccountInfo(String? serverUrl, String? userName) {
    state = state.copyWith(serverUrl: serverUrl, userName: userName);
  }
}

class LoginViewModel with EquatableMixin {
  LoginViewModel(
      {this.serverUrl,
      this.userName,
      this.password,
      this.isDataComplete,
      this.writePermission = true,
      this.recreationActivity = true,
      this.isTestingEnvironment,
      this.testingCredentials});

  final String? serverUrl;
  final String? userName;
  final String? password;
  final bool? isDataComplete;
  final bool writePermission;
  final bool recreationActivity;

  final Trio<String, String, String>? isTestingEnvironment;

  final IMap<String, TestingCredential?>? testingCredentials;

  LoginViewModel copyWith(
          {String? serverUrl,
          String? userName,
          String? password,
          bool? isDataComplete,
          bool? writePermission,
          bool? recreationActivity,
          Trio<String, String, String>? isTestingEnvironment,
          IMap<String, TestingCredential?>? testingCredentials}) =>
      LoginViewModel(
          serverUrl: serverUrl ?? this.serverUrl,
          userName: userName ?? this.userName,
          password: password ?? this.password,
          isDataComplete: isDataComplete ?? this.isDataComplete,
          writePermission: writePermission ?? this.writePermission,
          recreationActivity: recreationActivity ?? this.recreationActivity,
          isTestingEnvironment:
              isTestingEnvironment ?? this.isTestingEnvironment,
          testingCredentials: IMap.orNull(testingCredentials?.unlock) ??
              this.testingCredentials);

  @override
  List<Object?> get props => [
        serverUrl,
        userName,
        password,
        isDataComplete,
        writePermission,
        recreationActivity,
        isTestingEnvironment,
        testingCredentials
      ];
}

class TestingCredential with EquatableMixin {
  TestingCredential(
      {required this.serverUrl,
      required this.username,
      required this.userPass,
      this.serverVersion});

  final String serverUrl;
  final String username;
  final String userPass;
  final String? serverVersion;

  TestingCredential copyWith({
    String? serverUrl,
    String? username,
    String? userPass,
    String? serverVersion,
  }) =>
      TestingCredential(
          serverUrl: serverUrl ?? this.serverUrl,
          username: username ?? this.username,
          userPass: userPass ?? this.userPass,
          serverVersion: serverVersion ?? this.serverVersion);

  @override
  List<Object?> get props => [serverUrl, username, userPass, serverVersion];
}
