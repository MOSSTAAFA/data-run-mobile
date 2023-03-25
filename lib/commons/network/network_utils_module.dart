import 'package:flutter/material.dart';
import 'network_utils.dart';

// TODO NMC, @Singleton
// @Module
// open class NetworkUtilsModule {
//
//   @Provides
//   @Singleton
//   open fun networkUtilsProvider(context: Context): NetworkUtils {
//   return NetworkUtils(context)
//   }
// }

class NetworkUtilsModule {
  NetworkUtils networkUtilsProvider(BuildContext context) {
    return NetworkUtils(context);
  }
}


