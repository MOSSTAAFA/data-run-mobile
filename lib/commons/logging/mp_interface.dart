import 'package:flutter/foundation.dart';

import '../logging/logging.dart';

abstract class MpInterface {
  bool isLogEnable = kDebugMode;
  LogWriterCallback log = defaultLogWriterCallback;
}
