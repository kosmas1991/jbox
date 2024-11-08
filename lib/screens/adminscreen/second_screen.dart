import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jbox/firestore/firestore_functions.dart';
import 'package:jbox/global%20widgets/myglobalbutton.dart';
import 'package:jbox/main.dart';
import 'package:jbox/screens/displayscreen/displayscreen.dart';
import 'dart:html';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyGlobalButton(
                buttonText: 'Προβολή σε πλήρη οθόνη',
                fun: () => goFullScreen(),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 400,
                  child: StreamBuilder<String>(
                      stream: FirestoreProvider.getUsernameDataFromParameters(
                          uid: auth.currentUser?.uid ?? ''),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          );
                        }
                        return DisplayScreen(
                          terminal: snapshot.data ?? '',
                          scale: 0.5,
                        );
                      })),
              SizedBox(
                height: 10,
              ),
              MyGlobalButton(
                fun: () {
                  GoRouter.of(context).goNamed(
                    DisplayScreen.routeName,
                    queryParameters: {
                      'terminal': auth.currentUser?.displayName
                    },
                  );
                },
                buttonText: 'Οθόνη προβολής',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void goFullScreen() {
    document.documentElement?.requestFullscreen();
  }
}
