import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jbox/firestore/firestore_functios.dart';
import 'package:jbox/global%20widgets/myglobalbutton.dart';
import 'package:jbox/main.dart';
import 'package:jbox/screens/adminscreen/widgets/azuracast_link_field.dart';
import 'package:jbox/screens/adminscreen/widgets/username_field.dart';

//!TODO add a wallpaper upload image

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(right: BorderSide(color: Colors.black, width: 0.2))),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text('Σύνδεσμος azuracast'),
            SizedBox(
              height: 10,
            ),
            AzuracastLinkField(),
            SizedBox(
              height: 20,
            ),
            Text('Όνομα χρήστη'),
            SizedBox(
              height: 10,
            ),
            UsernameField(),
            SizedBox(
              height: 20,
            ),
            Text('Εικόνα παρασκηνίου'),
            SizedBox(
              height: 10,
            ),
            MyGlobalButton(
                buttonText: 'Επιλογή εικόνας',
                fun: () async {
                  await _pickBackgroundImage();
                }),
            SizedBox(
              height: 10,
            ),
            // background image URL stream
            StreamBuilder<String>(
                stream: FirestoreProvider.getUsersBackgroundPictureData(
                    uid: auth.currentUser?.uid ?? ''),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator(
                      color: Colors.black,
                    );
                  }
                  return Image.network(
                    height: 200,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return CircularProgressIndicator(
                          color: Colors.black,
                        );
                      }
                    },
                    snapshot.data!,
                    fit: BoxFit.cover,
                  );
                }),
          ],
        ),
      ),
    );
  }

  Future<void> _pickBackgroundImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // Read image bytes asynchronously
      final Uint8List imageBytes = await image.readAsBytes();
      await uploadBackgroundPicture(imageBytes, auth.currentUser?.uid ?? '');
    }
  }

  Future<void> uploadBackgroundPicture(
      Uint8List? imageBytes, String userId) async {
    if (imageBytes == null) {
      print("No image selected");
      return;
    }

    // Create a reference to Firebase Storage
    Reference ref = storage
        .ref()
        .child('background_pictures/$userId/background_picture.jpg');

    try {
      // Upload the image
      UploadTask uploadTask = ref.putData(imageBytes);
      TaskSnapshot snapshot = await uploadTask;

      // Get the download URL after the upload completes
      String downloadUrl = await snapshot.ref.getDownloadURL();
      print('Uploaded successfully! Download URL: $downloadUrl');
      await FirestoreProvider.updateParameterToFirestore(
          collectionName: 'parameters',
          user: auth.currentUser!,
          key: 'backgroundImage',
          value: downloadUrl);
    } catch (e) {
      print('Error uploading image: $e');
    }
  }
}
