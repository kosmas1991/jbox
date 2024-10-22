import 'package:flutter/material.dart';
import 'package:jbox/extensions/severity_color.dart';

enum Severity { success, error, warning, info }

SnackBar mySnackBar(String message,
    {Severity severity = Severity.success, Duration? duration}) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(999.0),
    ),
    width: 250,
    elevation: 0,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    backgroundColor: SeverityColors.fromSeverity(severity),
    content: Text(
      message,
      textAlign: TextAlign.center,
    ),
    duration: duration!,
  );
}
