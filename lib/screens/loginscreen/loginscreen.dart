import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jbox/blocs/user/user_bloc.dart';
import 'package:jbox/global%20widgets/mainlogo.dart';
import 'package:jbox/main.dart';
import 'package:jbox/screens/adminscreen/adminscreen.dart';
import 'package:jbox/screens/homescreen/homescreen.dart';
import 'package:jbox/global%20widgets/myglobalbutton.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen();

  static final String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    bool isUserLoggedIn = context.watch<UserBloc>().state.loggedIn;
    return Scaffold(
      body: Center(
        child: isUserLoggedIn
            //! user logged in
            ? Column(
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
              )
            //! user logged out
            : SignInScreen(
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
                      GoRouter.of(context).goNamed('/admin');
                    },
                  )
                ],
              ),
      ),
    );
  }
}
