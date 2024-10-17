import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jbox/blocs/user/user_bloc.dart';
import 'package:jbox/widgets%20(global)/widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen();

  static final String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    bool isUserLoggedIn = context.watch<UserBloc>().state.loggedIn;
    return Scaffold(
      body: Center(
        child: isUserLoggedIn
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/avatar.png'),
                  Text('Already signed in'),
                  MyGlobalButton(),
                ],
              )
            : SignInScreen(
                footerBuilder: (context, action) =>
                    Image.asset('assets/images/mainlogo.png'),
                sideBuilder: (context, constraints) =>
                    Image.asset('assets/images/image.jpg'),
                providers: [EmailAuthProvider()],
                actions: [
                  AuthStateChangeAction<SignedIn>(
                    (context, state) {
                      GoRouter.of(context).goNamed('/admin');
                    },
                  )
                ],
              ),
      ),
    );
  }
}
