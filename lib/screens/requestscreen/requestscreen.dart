import 'package:flutter/material.dart';
import 'package:jbox/firestore/firestore_functions.dart';

class RequestScreen extends StatelessWidget {
  final String terminal;
  const RequestScreen({super.key, this.terminal = ''});

  static final String routeName = '/request';

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
                //! REQUEST screen contents here
                child: Container(
                  width: 300,
                  height: 300,
                  color: Colors.amber,
                  child: Text('terminal found ${terminal} and image URL fetched ${data['backgroundImage']}'),
                ),
              );
            }
          }),
    );
  }
}
