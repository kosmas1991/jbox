import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jbox/blocs/user/user_bloc.dart';
import 'package:jbox/extensions/printextensions.dart';
import 'package:jbox/global%20widgets/mainlogo.dart';
import 'package:jbox/go_router/go_router.dart';
import 'package:jbox/main.dart';
import 'package:jbox/screens/adminscreen/adminscreen.dart';
import 'package:jbox/screens/homescreen/homescreen.dart';
import 'package:jbox/global%20widgets/myglobalbutton.dart';
import 'package:jbox/screens/loginscreen/logged_in_user_info_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen();

  static final String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    bool isUserLoggedIn = context.watch<UserBloc>().state.loggedIn;
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state.loggedIn) {
          GoRouterProvider.router.goNamed(AdminScreen.routeName);
        }
      },
      child: Scaffold(
        body: Center(
          child: isUserLoggedIn
              //! user logged in -- N O T    U S E D      anymore as added BlocLister above
              ? LoggedInUserInfoScreen()
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
                              GoRouter.of(context)
                                  .goNamed(HomeScreen.routeName);
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
                        'called'.printWarning(); //! DEAD code . maybe do not need AuthStateChangeAction<SignedIn> at all and delete actions
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
