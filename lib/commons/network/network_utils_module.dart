import 'package:flutter/material.dart';
import 'package:mass_pro/commons/network/network_utils.dart';

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


