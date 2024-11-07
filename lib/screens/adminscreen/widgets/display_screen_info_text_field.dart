import 'package:flutter/material.dart';
import 'package:jbox/firestore/firestore_functions.dart';
import 'package:jbox/global%20widgets/myglobalbutton.dart';
import 'package:jbox/main.dart';

class DisplayScreenInfoTextField extends StatefulWidget {
  const DisplayScreenInfoTextField({
    super.key,
  });

  @override
  State<DisplayScreenInfoTextField> createState() =>
      _DisplayScreenInfoTextFieldState();
}

class _DisplayScreenInfoTextFieldState
    extends State<DisplayScreenInfoTextField> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    textEditingController.text = 'test';
    return StreamBuilder<String>(
        stream: FirestoreProvider.getDisplayScreenInfoTextData(
            uid: auth.currentUser?.uid ?? ''),
        builder: (context, snapshot) {
          updateTextController(textEditingController, snapshot.data ?? '');
          if (!snapshot.hasData) {}
          return Container(
            height: 200,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),
                        hintText:
                            'Συμπλήρωσε το κείμενο που θες να εμφανίζεται στην οθόνη προβολής'),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    expands: true,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MyGlobalButton(
                    buttonText: 'Υποβολή',
                    fun: () async {
                      await FirestoreProvider.updateParameterToFirestore(
                          collectionName: 'parameters',
                          user: auth.currentUser!,
                          key: 'infoTextField',
                          value: textEditingController.text);
                    })
              ],
            ),
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
