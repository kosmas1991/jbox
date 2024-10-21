import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jbox/screens/loginscreen/loginscreen.dart';

class LoggedOutAdmin extends StatelessWidget {
  const LoggedOutAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Δεν είσαι συνδεδεμένος."),
        TextButton(
            onPressed: () {
              GoRouter.of(context).goNamed(LoginScreen.routeName);
            },
            child: Text('Σύνδεση')),
      ],
    )));
  }
}
