import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool allowSpaces;
  final bool readOnly;
  final bool locked;
  final void Function(String)? onChanged;
  final bool allowAnyCharacter;
  const MyTextField({
    super.key,
    this.hintText = '',
    required this.textEditingController,
    this.allowSpaces = false,
    this.readOnly = false,
    this.locked = false,
    this.onChanged,
    this.allowAnyCharacter = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      readOnly: readOnly,
      inputFormatters: allowAnyCharacter
          ? []
          : [
              //no spaces allowed, only characters
              if (true)
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
            ],
      controller: textEditingController,
      decoration: InputDecoration(
        suffixIcon: Visibility(visible: locked, child: Icon(Icons.lock)),
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
