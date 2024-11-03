import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.data,
    required this.scale,
  });

  final Map<String, dynamic> data;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.black54),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'AZU URL: ${data['azuracastURL'] ?? ''}',
          ),
          Text(
            'terminal name: ${data['displayName'] ?? ''}',
          ),
        ],
      ),
    );
  }
}
