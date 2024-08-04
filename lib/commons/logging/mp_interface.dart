import 'package:flutter/foundation.dart';

import 'package:mass_pro/commons/logging/logging.dart';

abstract class MpInterface {
  bool isLogEnable = kDebugMode;
  LogWriterCallback log = defaultLogWriterCallback;
}
