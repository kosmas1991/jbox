import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
            Text('Third (profile) Screen'),
            SizedBox(
              height: 10,
            ),
            Image.asset(
              'assets/images/avatar.png',
              width: 200,
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
