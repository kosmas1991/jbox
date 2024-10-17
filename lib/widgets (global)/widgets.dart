import 'package:flutter/material.dart';

class MyGlobalButton extends StatelessWidget {
  const MyGlobalButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Go to profile',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
