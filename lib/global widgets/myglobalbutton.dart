import 'package:flutter/material.dart';

class MyGlobalButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback fun;
  final double width;
  const MyGlobalButton(
      {super.key, required this.buttonText, required this.fun, this.width = 200});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fun,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.black,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              buttonText,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
