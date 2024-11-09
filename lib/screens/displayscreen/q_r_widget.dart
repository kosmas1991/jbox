import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRWidget extends StatelessWidget {
  const QRWidget({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return QrImageView(
      backgroundColor: Colors.white,
      data: 'http://jbox.gr/#/request?terminal=${data['displayName'] ?? ''}',
      version: QrVersions.auto,
    );
  }
}
