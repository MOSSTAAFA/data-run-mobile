import 'package:flutter/foundation.dart';

import 'package:datarun/commons/logging/logging.dart';

abstract class MpInterface {
  bool isLogEnable = kDebugMode;
  LogWriterCallback log = defaultLogWriterCallback;
}
