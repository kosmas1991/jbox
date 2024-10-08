import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jbox/screens/loginscreen.dart/loginscreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            GoRouter.of(context).goNamed(LoginScreen.routeName,
                pathParameters: {'test': 'kosmas'});
          },
          child: Text('Log in'),
        ),
      ),
    );
  }
}
