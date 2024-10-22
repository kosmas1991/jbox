import 'package:flutter/material.dart';
import 'package:jbox/global%20widgets/mytextfield.dart';

class AzuracastLinkField extends StatefulWidget {
  const AzuracastLinkField({
    super.key,
  });

  @override
  State<AzuracastLinkField> createState() => _AzuracastLinkFieldState();
}

class _AzuracastLinkFieldState extends State<AzuracastLinkField> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MyTextField(
      textEditingController: textEditingController,
      hintText: 'https://radioserver.gr',
    );
  }
}
