import 'package:flutter/material.dart';
import 'package:jbox/screens/adminscreen/widgets/azuracast_link_field.dart';
import 'package:jbox/screens/adminscreen/widgets/username_field.dart';

//!TODO add a wallpaper upload image

class FirstScreen extends StatelessWidget {
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
          ],
        ),
      ),
    );
  }
}
