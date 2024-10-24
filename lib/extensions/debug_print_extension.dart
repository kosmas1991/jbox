import 'package:flutter/foundation.dart';

extension DebugPrintExtension on String {
  printWarning() {
    return debugPrint('\x1B[33m$this\x1B[0m');
  }

  printError() {
    return debugPrint('\x1B[31m$this\x1B[0m');
  }

  printGreen() {
    return debugPrint('\x1B[32m$this\x1B[0m');
  }

  printWhite() {
    return debugPrint('\x1B[37m$this\x1B[0m');
  }
}
