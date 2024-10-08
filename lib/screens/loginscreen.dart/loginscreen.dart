import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final String name;
  const LoginScreen({super.key, required this.name});

  static final String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('name passed is: ${name}'),
      ),
    );
  }
}
