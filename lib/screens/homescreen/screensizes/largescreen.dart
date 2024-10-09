import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jbox/screens/homescreen/constants.dart';
import 'package:jbox/screens/loginscreen.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, top: 24.0, right: 20.0, bottom: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  HomeScreenConstants.siteName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
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
                    ElevatedButton(
                      style: HomeScreenConstants.buttonStyleSmall,
                      onPressed: () {
                        GoRouter.of(context).goNamed(LoginScreen.routeName);
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
          Padding(
            padding: const EdgeInsets.only(
                left: 190.0, bottom: 80.0, right: 115.0, top: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        HomeScreenConstants.mainText,
                        style: TextStyle(
                          height: 1,
                          letterSpacing: 0.5,
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      HomeScreenConstants.richTextSection,
                      const SizedBox(
                        height: 48.0,
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
                ),
                const SizedBox(
                  width: 80.0,
                ),
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      HomeScreenConstants.imagePath,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
