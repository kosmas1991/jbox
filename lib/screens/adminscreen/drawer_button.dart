import 'package:flutter/material.dart';
import 'package:jbox/screens/adminscreen/adminscreen.dart';

class MyDrawerButton extends StatelessWidget {
  final bool isEndDrawer;
  const MyDrawerButton({super.key, required this.isEndDrawer});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: isEndDrawer ? Icon(Icons.person) : Icon(Icons.settings),
      onPressed: () {
        if (isEndDrawer) {
          scaffoldKey.currentState
              ?.openEndDrawer(); // Open the end drawer (right)
        } else {
          scaffoldKey.currentState?.openDrawer(); // Open the left drawer
        }
      },
    );
  }
}
