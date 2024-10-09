import 'package:flutter/material.dart';
import 'package:jbox/responsiveness/responsive_widget.dart';
import 'package:jbox/screens/homescreen/screensizes/largescreen.dart';
import 'package:jbox/screens/homescreen/screensizes/mediumscreen.dart';
import 'package:jbox/screens/homescreen/screensizes/smallscreen.dart';

//! HomeScreen has 3 versions (large,medium,small)

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWidget(
        largeScreen: LargeScreen(),
        mediumScreen: MediumScreen(),
        smallScreen: SmallScreen(),
      ),
    );
  }
}
