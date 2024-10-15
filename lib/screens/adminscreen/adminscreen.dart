import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jbox/screens/displayscreen/displayscreen.dart';

class AdminScreen extends StatelessWidget {
  final String user;
  const AdminScreen({
    super.key,
    this.user = '',
  });

  static final String routeName = '/admin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('data received: ${user} '),
            ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).goNamed(DisplayScreen.routeName,
                      queryParameters: {'terminal': '5thAvenue'});
                },
                child: Text('go to display 5thAvenue'))
          ],
        ),
      ),
    );
  }
}
