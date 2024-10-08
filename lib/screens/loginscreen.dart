import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jbox/screens/adminscreen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen();

  static final String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login page '),
            ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).goNamed(
                    AdminScreen.routeName,
                    pathParameters: {'user': 'kosmas'},
                    // queryParameters: {'variable2': 'var2'},
                  );
                },
                child: Text('Go to admin screen'))
          ],
        ),
      ),
    );
  }
}
