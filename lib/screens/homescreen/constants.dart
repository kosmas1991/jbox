import 'package:flutter/material.dart';

class HomeScreenConstants {
  static const siteName = 'JBox';
  static const mainText = 'Αναβάθμισε την επιχείρηση σου με το JBox';
  static const menu1Text = 'Τιμές';
  static const logInText = 'Είσοδος';
  static const buttonText = 'Μάθε περισσότερα';
  static final richTextSection = RichText(
    text: const TextSpan(
      children: <TextSpan>[
        TextSpan(
          text: 'Πλέον οι πελάτες επιλέγουν ',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        TextSpan(
            text: 'την μουσική ',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
        TextSpan(
          text: 'που θα ακούσουν.',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ],
    ),
  );
  static final buttonStyleBig = ElevatedButton.styleFrom(
      backgroundColor: Colors.black, // background
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        6,
      )));
  static final buttonStyleSmall = ElevatedButton.styleFrom(
      backgroundColor: Colors.black, // background
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        6,
      )));
}
