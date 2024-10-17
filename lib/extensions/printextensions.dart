extension PrintExtension on String {
  printWarning() {
    return print('\x1B[33m$this\x1B[0m');
  }

  printError() {
    return print('\x1B[31m$this\x1B[0m');
  }
}
