import 'package:flutter/material.dart';
import 'package:jbox/firestore/firestore_functions.dart';
import 'package:jbox/screens/displayscreen/display_screen_contents.dart';

class DisplayScreen extends StatelessWidget {
  final String terminal;
  final double scale;
  const DisplayScreen({super.key, this.terminal = '', required this.scale});

  static final String routeName = '/display';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Map<String, dynamic>?>(
          stream:
              FirestoreProvider.getAllDataFromParameters(username: terminal),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }
            var data = snapshot.data;
            if (data == null) {
              return Center(
                child: Text(
                    'Σφάλμα, βρέθηκε διπλή εγγραφή (username) στην βάση δεδομένων'),
              );
            } else {
              return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(data['backgroundImage']),
                        fit: BoxFit.cover)),
                //! DISPLAY screen contents here
                child: DisplayScreenContents(
                  data: data,
                  scale: scale,
                ),
              );
            }
          }),
    );
  }
}
