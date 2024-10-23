import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jbox/blocs/user/user_bloc.dart';
import 'package:jbox/global%20widgets/mainlogo.dart';
import 'package:jbox/go_router/go_router.dart';
import 'package:jbox/screens/adminscreen/adminscreen.dart';
import 'package:jbox/screens/homescreen/homescreen.dart';
import 'package:jbox/global%20widgets/myglobalbutton.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen();

  static final String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state.loggedIn) {
          GoRouterProvider.router.goNamed(AdminScreen.routeName);
        }
      },
      child: Scaffold(
        body: Center(
          child: SignInScreen(
            footerBuilder: (context, action) => Container(
              height: 300,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  MainLogo(),
                  SizedBox(
                    height: 20,
                  ),
                  MyGlobalButton(
                      buttonText: 'Αρχική',
                      fun: () {
                        GoRouter.of(context).goNamed(HomeScreen.routeName);
                      }),
                ],
              ),
            ),
            sideBuilder: (context, constraints) =>
                Image.asset('assets/images/image.jpg'),
            providers: [EmailAuthProvider()],
            actions: [
              AuthStateChangeAction<SignedIn>(
                (context, state) {
                  GoRouterProvider.router.goNamed(AdminScreen.routeName);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
