import 'package:flutter/material.dart';
import 'package:jbox/screens/adminscreen/first_screen.dart';

class DrawerContent extends StatelessWidget {
  final String label;

  DrawerContent({required this.label});

  @override
  Widget build(BuildContext context) {
    return FirstScreen();
  }
}
