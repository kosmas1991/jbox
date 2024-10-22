import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jbox/global%20widgets/myglobalbutton.dart';
import 'package:jbox/main.dart';
import 'package:jbox/screens/adminscreen/adminscreen.dart';

class LoggedInUserInfoScreen extends StatelessWidget {
  const LoggedInUserInfoScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/avatar.png',
            width: 200,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Ήδη συνδεδεμένος χρήστης',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 100,
          ),
          MyGlobalButton(
            buttonText: 'Σελίδα διαχείρισης',
            fun: () {
              GoRouter.of(context).goNamed(AdminScreen.routeName);
            },
          ),
          SizedBox(
            height: 20,
          ),
          MyGlobalButton(
            buttonText: 'Αποσύνδεση',
            fun: () {
              auth.signOut();
            },
          ),
        ],
      );
  }
}
