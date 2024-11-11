// import 'dart:async';
//
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:d2_remote/core/datarun/exception/d_error_code.dart';
// import 'package:d2_remote/core/datarun/exception/exception.dart';
// import 'package:d2_remote/modules/auth/user/entities/d_user.entity.dart';
// import 'package:d2_remote/modules/datarun_shared/utilities/authenticated_user.dart';
// import 'package:d2_remote/shared/utilities/http_client.util.dart';
// import 'package:datarun/commons/constants.dart';
// import 'package:datarun/data_run/usecases/auth/sync_interactor.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// part 'network_manager.g.dart';
//
// @riverpod
// NetworkManager networkManager(NetworkManagerRef ref) {
//   throw UnimplementedError('networkManagerProvider is not implemented');
// }
//
// class NetworkManager {
//   NetworkManager(this.syncInteractor);
//
//   final String _baseUrl = kApiBaseUrl;
//   final SyncInteractor syncInteractor;
//
//   Future<bool> isNetworkAvailable() async {
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.none) {
//       return false;
//     }
//
//     return connectivityResult == ConnectivityResult.wifi ||
//         connectivityResult == ConnectivityResult.mobile;
//   }
//
//   Future<AuthenticationResult> authenticate(String username, String password,
//       [String? serverUrl]) async {
//     // try {
//     final url = (serverUrl ?? '').isNotEmpty ? serverUrl : _baseUrl;
//     HttpResponse userResponse = await HttpClient.get('me',
//             baseUrl: url, username: username, password: password)
//         .timeout(Duration(seconds: 40), onTimeout: () {
//       throw NetworkException('timeout connecting to $url',
//           url: url, errorCode: DErrorCode.networkTimeout);
//     });
//
//     if (userResponse.statusCode == 401) {
//       throw AuthenticationException('Invalid Credentials',
//           url: url,
//           errorCode: DErrorCode.authInvalidCredentials,
//           httpErrorCode: 401);
//     }
//
//     if (userResponse.statusCode == 200) {
//       Map<String, dynamic> userData = userResponse.body;
//       userData['password'] = password;
//       userData['isLoggedIn'] = true;
//       userData['username'] = username;
//       userData['baseUrl'] = url;
//       userData['authTye'] = 'basic';
//       userData['dirty'] = true;
//
//       final user = DUser.fromApi(userData);
//       return AuthenticationResult(
//         success: true,
//         sessionUser: user,
//       );
//     }
//     throw InternalServerError(
//         url: url,
//         message: userResponse.body,
//         httpErrorCode: userResponse.statusCode);
//
//     // } catch (e) {
//     //   DExceptionReporter().report(e, showToUser: true);
//     //   return AuthenticationResult(success: false);
//     // }
//   }
//
//   Future<bool> syncData() async {
//     // Simulate syncing data (for example, sync user data with a remote server)
//     try {
//       // Perform your sync logic here...
//       // Once sync is complete, mark it in shared preferences
//       await syncInteractor.markSyncDone();
//
//       // Update the state and notify that the sync is done
//       // isDataComplete true
//       return true;
//     } catch (e) {
//       await syncInteractor.resetSync();
//     }
//
//     return false;
//   }
// }
//
// //  network-related methods here, data synchronization
// // final expirationDate = DateTime.now().add(Duration(hours: 24));
// // expirationDate.toIso8601String(),
// // expirationDate: DateTime.parse(json['expirationDate']),
// // Sync data method
