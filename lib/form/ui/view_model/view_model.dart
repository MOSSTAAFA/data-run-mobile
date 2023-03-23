import 'package:flutter/material.dart';

abstract class ViewModel extends Listenable {
  // final Map<String, Object>? _mBagOfTags = {};
  //
  // /*volatile*/
  // bool _mCleared = false;
  //
  // void onCleared() {}
  //
  // void clear() {
  //   _mCleared = true;
  //   // Since clear() is final, this method is still called on mock objects
  //   // and in those cases, mBagOfTags is null. It'll always be empty though
  //   // because setTagIfAbsent and getTag are not final so we can skip
  //   // clearing it
  //   if (_mBagOfTags != null) {
  //     synchronized(mBagOfTags) {
  //       for (Object value in mBagOfTags.values()) {
  //         // see comment for the similar call in setTagIfAbsent
  //         closeWithRuntimeException(value);
  //       }
  //     }
  //   }
  //   onCleared();
  // }
  //
  // static void closeWithRuntimeException(Object obj) {
  //   //   if (obj is Closeable) {
  //   //     try {
  //   //       ((Closeable) obj).close();
  //   //     } on IOException catch (e) {
  //   //   throw Exception();
  //   //   }
  //   // }
  // }
}
