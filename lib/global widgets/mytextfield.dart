import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool allowSpaces;
  const MyTextField(
      {super.key,
      this.hintText = '',
      required this.textEditingController,
      this.allowSpaces = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [
        //no spaces allowed, only characters
        if (true) FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
      ],
      controller: textEditingController,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontSize: 15,
          fontStyle: FontStyle.italic,
        ),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
