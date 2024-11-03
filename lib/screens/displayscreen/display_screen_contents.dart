import 'package:flutter/material.dart';
import 'package:jbox/screens/displayscreen/info_widget.dart';
import 'package:jbox/screens/displayscreen/q_r_widget.dart';

class DisplayScreenContents extends StatelessWidget {
  const DisplayScreenContents({
    super.key,
    required this.data,
    required this.scale,
  });

  final Map<String, dynamic> data;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            flex: 2,
            //! INFO widget
            child: InfoWidget(
              data: data,
              scale: scale,
            ),
          ),
          Flexible(
            flex: 1,
            //! QR widget
            child: QRWidget(
              data: data,
              scale: scale,
            ),
          ),
        ],
      ),
    );
  }
}
