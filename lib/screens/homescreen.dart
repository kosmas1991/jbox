import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jbox/responsiveness/responsive_widget.dart';
import 'package:jbox/screens/loginscreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWidget(
        largeScreen: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, top: 24.0, right: 20.0, bottom: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Workster',
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
                            'Pricing',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black, // background
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                6,
                              ))),
                          onPressed: () {
                            GoRouter.of(context).goNamed(LoginScreen.routeName);
                          },
                          child: const Text(
                            'Log In',
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
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'The best way to discover remote jobs in the US',
                            style: TextStyle(
                              height: 1,
                              letterSpacing: 0.5,
                              fontSize: 72,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      'Browse jobs from companies who are looking to hire ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                                TextSpan(
                                    text: 'Us employees ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18)),
                                TextSpan(
                                  text: 'in remote roles.',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 48.0,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black, // background
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 24),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                  6,
                                ))),
                            onPressed: () {},
                            child: const Text(
                              'Join Today',
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
                      child: Image.asset('assets/images/image.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        mediumScreen: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, top: 24.0, right: 20.0, bottom: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Workster',
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
                            'Pricing',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black, // background
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                6,
                              ))),
                          onPressed: () {},
                          child: const Text(
                            'Sign In',
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
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/images/image_3.png'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 24.0,
                        ),
                        const Center(
                          child: Text(
                            'The best way to discover remote jobs in the US',
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
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    'Browse jobs from companies who are looking to hire ',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              TextSpan(
                                  text: 'Us employees ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18)),
                              TextSpan(
                                text: 'in remote roles.',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 28.0,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black, // background
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 24),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                6,
                              ))),
                          onPressed: () {},
                          child: const Text(
                            'Join Today',
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
        ),
        smallScreen: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, top: 24.0, right: 20.0, bottom: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Workster',
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
                            'Pricing',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black, // background
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                6,
                              ))),
                          onPressed: () {},
                          child: const Text(
                            'Sign In',
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
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/images/image_3.png'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 24.0,
                        ),
                        const Center(
                          child: Text(
                            'The best way to discover remote jobs in the US',
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
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    'Browse jobs from companies who are looking to hire ',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              TextSpan(
                                  text: 'Us employees ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18)),
                              TextSpan(
                                text: 'in remote roles.',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 28.0,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black, // background
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 24),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                6,
                              ))),
                          onPressed: () {},
                          child: const Text(
                            'Join Today',
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
        ),
      ),
    );
  }
}
