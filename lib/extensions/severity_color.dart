import 'package:flutter/material.dart';
import 'package:jbox/global%20widgets/mysnackbar.dart';

extension SeverityColors on Color {
  static Color fromSeverity(Severity severity) {
    switch (severity) {
      case Severity.success:
        return Colors.green.shade400;
      case Severity.error:
        return Colors.red.shade400;
      case Severity.warning:
        return const Color.fromARGB(255, 235, 176, 22);
      case Severity.info:
        return Colors.blue.shade400;
    }
  }

  Color get success => Colors.green.shade400;
  Color get error => Colors.red.shade400;
  Color get warning => Colors.yellow.shade400;
  Color get info => Colors.blue.shade400;
}
