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
}
