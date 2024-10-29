import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jbox/blocs/user/user_bloc.dart';
import 'package:jbox/firestore/firestore_functios.dart';
import 'package:jbox/global%20widgets/mainlogo.dart';
import 'package:jbox/global%20widgets/myglobalbutton.dart';
import 'package:jbox/global%20widgets/mytextfield.dart';
import 'package:jbox/main.dart';

class FillUserData extends StatefulWidget {
  const FillUserData({
    super.key,
    required this.usernameTextEditingController,
  });

  final TextEditingController usernameTextEditingController;

  @override
  State<FillUserData> createState() => _FillUserDataState();
}

class _FillUserDataState extends State<FillUserData> {
  Uint8List? _imageBytes;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Container(
              width: 450,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MainLogo(),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Συμπλήρωσε τα παρακάτω για να συνεχίσεις'),
                  SizedBox(
                    height: 30,
                  ),
                  //?image visibility
                  Visibility(
                    visible: state.user?.photoURL == null,
                    child: Column(
                      children: [
                        Text('Εικόνα προφίλ'),
                        Row(
                          children: [
                            MyGlobalButton(
                                buttonText: 'Επιλογή εικόνας',
                                fun: () async {
                                  await _pickProfileImage();
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            MyGlobalButton(
                                buttonText: 'Χρήση προεπιλεγμένης',
                                fun: () async {
                                  await auth.currentUser?.updatePhotoURL(
                                      //! uses profile_picture.jpg from firebase storage (JBOX logo)
                                      'https://firebasestorage.googleapis.com/v0/b/jboxserver.appspot.com/o/profile_picture.jpg?alt=media&token=955a8aff-830b-4f9f-a2fd-4dfab7d42c92');
                                  await FirestoreProvider.modifyUserToFirestore(
                                      auth.currentUser!);
                                }),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        _imageBytes != null
                            ? Image.memory(
                                _imageBytes!,
                                height: 200,
                                width: 200,
                                fit: BoxFit.cover,
                              )
                            : Text('No image selected.'),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),

                  //TODO check if username already exist at firebase
                  //? username visibility
                  Visibility(
                    visible: state.user?.displayName == null,
                    child: Column(
                      children: [
                        Text('Όνομα χρήστη'),
                        MyTextField(
                            textEditingController:
                                widget.usernameTextEditingController),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  MyGlobalButton(
                      buttonText: 'Αποθήκευση',
                      fun: () async {
                        await auth.currentUser?.updateDisplayName(
                            widget.usernameTextEditingController.text);
                        await FirestoreProvider.modifyUserToFirestore(
                            auth.currentUser!);
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickProfileImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // Read image bytes asynchronously
      final Uint8List imageBytes = await image.readAsBytes();

      setState(() {
        _imageBytes = imageBytes;
      });
      await uploadProfilePicture(imageBytes, auth.currentUser?.uid ?? '');
    }
  }

  Future<void> uploadProfilePicture(
      Uint8List? imageBytes, String userId) async {
    if (imageBytes == null) {
      print("No image selected");
      return;
    }

    // Create a reference to Firebase Storage
    Reference ref =
        storage.ref().child('profile_pictures/$userId/profile_picture.jpg');

    try {
      // Upload the image
      UploadTask uploadTask = ref.putData(imageBytes);
      TaskSnapshot snapshot = await uploadTask;

      // Get the download URL after the upload completes
      String downloadUrl = await snapshot.ref.getDownloadURL();
      print('Uploaded successfully! Download URL: $downloadUrl');
      await setAsUsersProfilePic(downloadUrl);
      await FirestoreProvider.modifyUserToFirestore(auth.currentUser!);
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  Future<void> setAsUsersProfilePic(String downloadUrl) async {
    await auth.currentUser?.updatePhotoURL(downloadUrl);
  }
}
