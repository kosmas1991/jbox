import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen();

  static final String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SignInScreen(
          providers: [EmailAuthProvider()],
          actions: [
            AuthStateChangeAction<SignedIn>(
              (context, state) {
                GoRouter.of(context).goNamed('/admin');
              },
            )
          ],
        ),
        // Text('Login page '),
        // ElevatedButton(
        //     onPressed: () {
        //       GoRouter.of(context).goNamed(
        //         AdminScreen.routeName,
        //         pathParameters: {'user': 'kosmas'},
        //         // queryParameters: {'variable2': 'var2'},
        //       );
        //     },
        //     child: Text('Go to admin screen')),
      ),
    );
  }
}
