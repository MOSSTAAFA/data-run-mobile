import 'package:flutter/material.dart';

class NetworkUtils {
  BuildContext context;

  NetworkUtils(this.context);

  bool isOnline() {
    var isOnline = false;
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
