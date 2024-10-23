import 'package:flutter/material.dart';
import 'package:jbox/global%20widgets/mainlogo.dart';
import 'package:jbox/global%20widgets/myglobalbutton.dart';
import 'package:jbox/global%20widgets/mytextfield.dart';
import 'package:jbox/main.dart';

class FillUserData extends StatelessWidget {
  const FillUserData({
    super.key,
    required this.usernameTextEditingController,
  });

  final TextEditingController usernameTextEditingController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
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
              Text('Εικόνα προφίλ (Default)'),
              MyGlobalButton(buttonText: 'Επιλογή εικόνας', fun: () {}),
              SizedBox(
                height: 10,
              ),
              Text('Όνομα (username)'),
              MyTextField(textEditingController: usernameTextEditingController),
              SizedBox(
                height: 30,
              ),
              MyGlobalButton(
                  buttonText: 'Αποθήκευση',
                  fun: () {
                    auth.currentUser
                        ?.updateDisplayName(usernameTextEditingController.text);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
