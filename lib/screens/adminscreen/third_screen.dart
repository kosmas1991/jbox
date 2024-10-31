import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jbox/extensions/debug_print_extension.dart';
import 'package:jbox/firestore/firestore_functios.dart';
import 'package:jbox/global%20widgets/myglobalbutton.dart';
import 'package:jbox/main.dart';
import 'package:jbox/screens/homescreen/homescreen.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(left: BorderSide(color: Colors.black, width: 0.2))),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(auth.currentUser?.displayName ?? 'user logged off'),
            SizedBox(
              height: 10,
            ),
            ClipOval(
              child: StreamBuilder(
                stream: FirestoreProvider.getUsersProfilePictureData(
                    uid: auth.currentUser?.uid ?? ''),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator(
                      color: Colors.black,
                    );
                  }

                  if (snapshot.hasError) {
                    'nothing important -> ${snapshot.error.toString()}'
                        .printError();
                  }

                  return Image.network(
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return CircularProgressIndicator(
                          color: Colors.black,
                        );
                      }
                    },
                    snapshot.data!,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MyGlobalButton(
              buttonText: 'Αποσύνδεση',
              fun: () {
                auth.signOut();
                GoRouter.of(context).goNamed(HomeScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
