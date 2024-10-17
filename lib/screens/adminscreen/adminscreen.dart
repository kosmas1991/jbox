import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jbox/blocs/user/user_bloc.dart';
import 'package:jbox/screens/displayscreen/displayscreen.dart';
import 'package:jbox/screens/homescreen/homescreen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({
    super.key,
  });

  static final String routeName = '/admin';

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (!state.loggedIn) {
          GoRouter.of(context).goNamed(HomeScreen.routeName);
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('data received:  '),
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).goNamed(DisplayScreen.routeName,
                      queryParameters: {'terminal': '5thAvenue'});
                },
                child: Text('go to display 5thAvenue'),
              ),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Text('Log out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
