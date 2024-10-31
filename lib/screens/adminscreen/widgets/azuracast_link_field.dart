import 'package:flutter/material.dart';
import 'package:jbox/firestore/firestore_functios.dart';
import 'package:jbox/global%20widgets/mytextfield.dart';
import 'package:jbox/main.dart';

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
    textEditingController.text = 'test';
    return StreamBuilder<String>(
        stream: FirestoreProvider.getAzuracastLinkData(
            uid: auth.currentUser?.uid ?? ''),
        builder: (context, snapshot) {
          updateTextController(textEditingController, snapshot.data ?? '');
          if (!snapshot.hasData) {}
          return MyTextField(
            onChanged: (String value) async {
              await FirestoreProvider.updateParameterToFirestore(
                  collectionName: 'parameters',
                  user: auth.currentUser!,
                  key: 'azuracastURL',
                  value: value);
            },
            textEditingController: textEditingController,
            hintText: 'https://radioserver.gr',
          );
        });
  }

  void updateTextController(TextEditingController controller, String newText) {
    final previousText = controller.text;
    final previousSelection = controller.selection;

    // Update the text only if it has changed
    if (previousText != newText) {
      controller.value = TextEditingValue(
        text: newText,
        selection: previousSelection.copyWith(
          baseOffset: newText.length, // Or adjust as needed
          extentOffset: newText.length,
        ),
      );
    }
  }
}
