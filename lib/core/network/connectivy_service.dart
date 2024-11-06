import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:datarun/commons/logging/logging.dart';

class ConnectivityService {
  static final ConnectivityService _instance = ConnectivityService._internal();

  ConnectivityService._internal();

  static ConnectivityService get instance => _instance;

  final StreamController<bool> _connectivityStatusController =
      StreamController<bool>.broadcast();

  Stream<bool> get connectivityStatusStream =>
      _connectivityStatusController.stream;

  ConnectivityResult _lastConnectivityCheckResult = ConnectivityResult.none;

  bool _isOnline = false;

  bool get isOnline =>
      _lastConnectivityCheckResult != ConnectivityResult.none && _isOnline;

  Future<void> initialize() {
    logDebug(info: 'initializing: ', runtimeType: this.runtimeType);
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result != _lastConnectivityCheckResult) {
        _checkInternetConnection();
        _lastConnectivityCheckResult = result;
      }
    });
    return _checkInternetConnection();
  }

  Future<bool> _checkInternetConnection() async {
    try {
      logDebug(info: 'checkInternetConnection: ping https://google.com ...', runtimeType: this.runtimeType);
      final response = await http
          .get(Uri.parse('https://google.com'))
          .timeout(Duration(seconds: 5));
      if (response.statusCode == 200) {
        logDebug(info: 'Device is online!', runtimeType: this.runtimeType);
        _isOnline = true;
        _connectivityStatusController.add(true);
      } else {
        logDebug(info: 'Device is offline!', runtimeType: this.runtimeType);
        _isOnline = false;
        _connectivityStatusController.add(false);
      }
    } catch (_) {
      logDebug(info: 'Error checking internet Access, setting the status to offline!', runtimeType: this.runtimeType);
      _isOnline = false;
      _connectivityStatusController.add(false);
    }

    return _isOnline;
  }

  void dispose() {
    _connectivityStatusController.close();
  }
}
