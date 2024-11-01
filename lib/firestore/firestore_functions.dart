import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jbox/extensions/debug_print_extension.dart';
import 'package:jbox/main.dart';

class FirestoreProvider {
  static Future<void> addNewUserToFirestore(User user) async {
    // Prepare user data
    Map<String, dynamic> userData = {
      'uid': user.uid,
      'email': user.email,
      'displayName': user.displayName ?? 'Anonymous',
      'photoURL': user.photoURL,
      'createdAt': Timestamp.now(),
    };

    // Add data to Firestore in 'users' collection with UID as the document ID
    await firestore.collection('users').doc(user.uid).set(userData);
    'added user to firestore with data ${userData}'.printWhite();

    //also set a default background image at parameters collection  //also add the display name at parameters collection
    // TODO create an initial map with all the parameters like azuracast URL etc
    await setParametersToFirestore(
        collectionName: 'parameters',
        user: user,
        mapToSet: {
          'backgroundImage':
              'https://firebasestorage.googleapis.com/v0/b/jboxserver.appspot.com/o/background_picture.png?alt=media&token=7d2fcfad-fac4-45e3-9a87-d45003985a62',
          'displayName': auth.currentUser!.displayName ?? 'Anonymous',
          'azuracastURL': 'https://radioserver.gr',
        });
  }

  static Future<void> modifyUserToFirestore(User user) async {
    // Prepare user data
    Map<String, dynamic> userData = {
      'uid': user.uid,
      'email': user.email,
      'displayName': user.displayName ?? 'Anonymous',
      'photoURL': user.photoURL,
    };

    // Add data to Firestore in 'users' collection with UID as the document ID
    await firestore.collection('users').doc(user.uid).update(userData);
    'modified user to firestore with data ${userData}'.printWhite();
  }

  static Future<void> setParametersToFirestore(
      {required String collectionName,
      required User user,
      required Map<String, dynamic> mapToSet}) async {
    // Prepare user data
    Map<String, dynamic> userData = mapToSet;

    // Add data to Firestore in 'users' collection with UID as the document ID
    await firestore.collection(collectionName).doc(user.uid).set(userData);
  }

  static Future<void> updateParameterToFirestore(
      {required String collectionName,
      required User user,
      required String key,
      required String value}) async {
    // Prepare user data
    Map<String, dynamic> userData = {key: value};

    // Add data to Firestore in 'users' collection with UID as the document ID
    await firestore.collection(collectionName).doc(user.uid).update(userData);
  }

  static Stream<String> getUsersBackgroundPictureData({required String uid}) {
    if (auth.currentUser != null) {
      return firestore
          .collection('parameters')
          .doc(uid)
          .snapshots()
          .map((snapshot) => snapshot.data()?['backgroundImage'] ?? '');
    } else {
      return Stream.empty();
    }
  }

  static Stream<String> getUsersProfilePictureData({required String uid}) {
    if (auth.currentUser != null) {
      return firestore
          .collection('users')
          .doc(uid)
          .snapshots()
          .map((snapshot) => snapshot.data()?['photoURL'] ?? '');
    } else {
      return Stream.empty();
    }
  }

  static Stream<String> getAzuracastLinkData({required String uid}) {
    if (auth.currentUser != null) {
      return firestore
          .collection('parameters')
          .doc(uid)
          .snapshots()
          .map((snapshot) => snapshot.data()?['azuracastURL'] ?? '');
    } else {
      return Stream.empty();
    }
  }
}
