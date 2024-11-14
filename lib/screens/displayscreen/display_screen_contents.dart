import 'package:flutter/material.dart';
import 'package:jbox/firestore/firestore_functions.dart';
import 'package:jbox/main.dart';
import 'package:jbox/screens/displayscreen/info_widget.dart';
import 'package:jbox/screens/displayscreen/q_r_widget.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

class DisplayScreenContents extends StatelessWidget {
  const DisplayScreenContents({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var maxHeight = constraints.maxHeight;
        var maxWidth = constraints.maxWidth;
        return Stack(
          children: [
            Center(
              child: maxWidth < 400
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          flex: 2,
                          //! INFO widget
                          child: InfoWidget(
                            data: data,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          //! QR widget
                          child: QRWidget(
                            data: data,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          flex: 2,
                          //! INFO widget
                          child: InfoWidget(
                            data: data,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          //! QR widget
                          child: QRWidget(
                            data: data,
                          ),
                        ),
                      ],
                    ),
            ),
            //! scroll bottom bar
            StreamBuilder<String>(
                stream: FirestoreProvider.getInfoTextFieldFromParameters(
                    uid: auth.currentUser?.uid ?? ''),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      height: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            color: Colors.black87,
                            child: ScrollLoopAutoScroll(
                              child: Text(
                                snapshot.data ?? '',
                                style: TextStyle(
                                    fontSize: maxHeight / 30,
                                    color: Colors.white),
                              ),
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('error #7778787'),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    );
                  }
                })
          ],
        );
      },
    );
  }
}
