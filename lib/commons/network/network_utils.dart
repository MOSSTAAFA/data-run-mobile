import 'package:flutter/cupertino.dart';

class NetworkUtils {
  const NetworkUtils(BuildContext context);

  bool isOnline() {
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
