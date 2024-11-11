// import 'package:d2_remote/d2_remote.dart';
// import 'package:d2_remote/modules/auth/user/entities/d_user.entity.dart';
// import 'package:d2_remote/modules/auth/user/models/login-response.model.dart';
// import 'package:datarun/commons/logging/logging.dart';
// import 'package:datarun/commons/prefs/preference_provider.dart';
// import 'package:datarun/core/network/connectivy_service.dart';
// import 'package:datarun/core/user/authenticated_user.model.dart';
// import 'package:datarun/utils/user_preferences/preference.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:shared_preferences/src/shared_preferences_legacy.dart';
//
// part 'auth_state.g.dart';
//
// @riverpod
// class AuthManager extends _$AuthManager {
//   // final SharedPreferences sharedPreferences;
//
//   // AuthNotifier(this.sharedPreferences) : super(AuthState());
//
//   Future<AuthState> build() async {
//     // final SharedPreferences preference = ref.watch(preferenceNotifierProvider);
//
//     final username = ref.watch(preferenceNotifierProvider(Preference.username));
//     final serverUrl = ref.watch(preferenceNotifierProvider(Preference.serverUrl));
//     final credentialsSet = ref.watch(preferenceNotifierProvider(Preference.credentialsSet));
//
//     // incrementCounter() => ref
//     //     .read(preferenceNotifierProvider(Preference.counter).notifier)
//     //     .update(counter + 1);
//
//
//     final uri = Uri.parse(serverUrl).host;
//     final String databaseName = '${username}_$uri';
//
//     final isLoggedIn = await D2Remote.isAuthenticated(
//         sharedPreferenceInstance: Future.value(preference));
//
//     // final authenticatedUser = localUser != null
//     //     ? AuthenticatedUser.fromMap(localUser.toJson())
//     //     : null;
//
//     if (isLoggedIn) {
//       final user = await D2Remote.userModule.user.getOne();
//       final userData = preferenceProvider.getUserCredentials();
//       state = state.copyWith(
//         serverUrl: userData.serverUrl,
//         userName: userData.userName,
//       );
//     }
//     final isLoggedIn = await userManager.isUserLoggedIn();
//     if (isLoggedIn) {
//       final userData = preferenceProvider.getUserCredentials();
//       state = state.copyWith(
//         serverUrl: userData.serverUrl,
//         userName: userData.userName,
//       );
//     }
//
//     // @override
//     // Future<bool> isUserLoggedIn(
//     //     {Future<SharedPreferences>? sharedPreferenceInstance, bool? inMemory}) {
//     //
//     // }
//     return D2Remote.isAuthenticated(
//         sharedPreferenceInstance: sharedPreferenceInstance, inMemory: inMemory);
//     final submissions =
//         await ref.watch(formSubmissionRepositoryProvider).getSubmissions(form);
//     return submissions;
//   }
//
//   Future<LoginResponseStatus> logIn(
//       String username, String password, String serverUrl) async {
//     LoginResponseStatus? responseStatus;
//     DUser? currentUser;
//
//     if (ConnectivityService.instance.isOnline) {
//       logDebug(
//           info: 'Performing online authentication ...',
//           runtimeType: this.runtimeType);
//       responseStatus = await D2Remote.logInDataRun(
//           username: username, password: password, url: serverUrl);
//     } else {
//       logDebug(
//           info: 'Performing Offline Authenticate...',
//           runtimeType: this.runtimeType);
//       currentUser = await D2Remote.userModule.user.getOne();
//
//       // getLastLoggedInUserDbName
//       final dbName = await D2Remote.getDatabaseName();
//
//       if (dbName != null) {
//         currentUser = await D2Remote.userModule.user
//             .where(attribute: 'username', value: username)
//             .where(attribute: 'password', value: password)
//             .getOne();
//
//         currentUser?.isLoggedIn = false;
//         currentUser?.dirty = true;
//         await D2Remote.userModule.user.setData(currentUser).save();
//         final authenticatedUser =
//             AuthenticatedUser.fromMap(currentUser!.toJson());
//         _updateAuthenticatedUser(authenticatedUser);
//       }
//
//       responseStatus = currentUser != null
//           ? LoginResponseStatus.OFFLINE_LOGIN_SUCCESS
//           : LoginResponseStatus.OFFLINE_LOGIN_ERROR;
//     }
//     return responseStatus;
//   }
//
//   // Login method: After successful login, save user data and set auth state to true
//   Future<void> login(DUser user) async {
//     state = AuthState(isAuthenticated: true, user: user);
//     await _saveUserToPreferences(user);
//   }
//
//   Future<void> logout() async {
//     await D2Remote.logOut();
//     await _clearUserFromPreferences();
//
//     final previousState = await future;
//
//     state = AsyncData(previousState.copyWith(isAuthenticated: false));
//
//     // Get.offAll(() => const LoginScreen());
//
//     // Navigator.push(
//     //   navigatorKey.currentContext!,
//     //   MaterialPageRoute(builder: (context) => const LoginScreen()),
//     // );
//   }
//
//   // Load user data from SharedPreferences on app startup
//   Future<void> loadUserFromPreferences() async {
//     final prefs = await sharedPreferences;
//     final isAuthenticated = prefs.getBool('isAuthenticated') ?? false;
//
//     if (isAuthenticated) {
//       final userData = prefs.getString('user') ?? '';
//       if (userData.isNotEmpty) {
//         final user =
//             User.fromMap(Map<String, String>.from(prefs.getKeys().toList()));
//         state = AuthState(isAuthenticated: true, user: user);
//       }
//     }
//   }
//
//   // Save user data to SharedPreferences
//   Future<void> _saveUserToPreferences(User user) async {
//     final prefs = await sharedPreferences;
//     prefs.setBool('isAuthenticated', true);
//     prefs.setString('user',
//         user.toMap().toString()); // For example, save user as JSON string
//   }
//
//   // Clear user data from SharedPreferences
//   Future<void> _clearUserFromPreferences() async {
//     final prefs = await sharedPreferences;
//     prefs.remove('isAuthenticated');
//     prefs.remove('user');
//   }
// }
//
// class AuthState {
//   final bool isAuthenticated;
//   final AuthenticatedUser? user;
//
//   AuthState({this.isAuthenticated = false, this.user});
//
//   AuthState copyWith({bool? isAuthenticated, AuthenticatedUser? user}) {
//     return AuthState(
//       isAuthenticated: isAuthenticated ?? this.isAuthenticated,
//       user: user ?? this.user,
//     );
//   }
// }
