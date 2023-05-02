import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_utils.g.dart';

@Riverpod(keepAlive: true)
NetworkUtils networkUtils(NetworkUtilsRef ref) {
  return const NetworkUtils();
}

class NetworkUtils {
  const NetworkUtils();

  /// navigatorKey.currentContext!
  bool isOnline([BuildContext? context]) {
    final isOnline = true;
    // try {
    //   var manager = context.getSystemService(Context.CONNECTIVITY_SERVICE)
    //       as ConnectivityManager;
    //   if (manager != null) {
    //     var netInfo = manager.activeNetworkInfo;
    //     isOnline = netInfo != null && netInfo.isConnectedOrConnecting;
    //   }
    // } catch (e) {
    //   // Timber.e(ex)
    // }
    return isOnline;
  }
}
