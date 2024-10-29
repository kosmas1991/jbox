import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jbox/blocs/user/user_bloc.dart';
import 'package:jbox/global%20widgets/mainlogo.dart';
import 'package:jbox/go_router/go_router.dart';
import 'package:jbox/main.dart';
import 'package:jbox/screens/adminscreen/adminscreen.dart';
import 'package:jbox/screens/homescreen/constants.dart';
import 'package:jbox/screens/loginscreen/loginscreen.dart';

class MediumScreen extends StatelessWidget {
  const MediumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, top: 24.0, right: 20.0, bottom: 40.0),
            child: Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainLogo(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Text(
                          HomeScreenConstants.menu1Text,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      // checks if user logged in in order to show photURL or Είσοδος
                      auth.currentUser?.photoURL != null
                          ? InkWell(
                              onTap: () => GoRouterProvider.router
                                  .goNamed(AdminScreen.routeName),
                              child: ClipOval(
                                child: Image.network(
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return CircularProgressIndicator(
                                        color: Colors.black,
                                      );
                                    }
                                  },
                                  context
                                      .watch<UserBloc>()
                                      .state
                                      .user!
                                      .photoURL!,
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : ElevatedButton(
                              style: HomeScreenConstants.buttonStyleSmall,
                              onPressed: () {
                                GoRouter.of(context)
                                    .goNamed(LoginScreen.routeName);
                              },
                              child: const Text(
                                HomeScreenConstants.logInText,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    HomeScreenConstants.imagePath,
                    height: MediaQuery.sizeOf(context).height /
                        2, //half of screen height
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 24.0,
                    ),
                    const Center(
                      child: Text(
                        HomeScreenConstants.mainText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 1,
                          letterSpacing: 0.5,
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    HomeScreenConstants.richTextSection,
                    const SizedBox(
                      height: 28.0,
                    ),
                    ElevatedButton(
                      style: HomeScreenConstants.buttonStyleBig,
                      onPressed: () {},
                      child: const Text(
                        HomeScreenConstants.buttonText,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
