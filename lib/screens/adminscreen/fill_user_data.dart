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
                height: 10,
              ),
              Text('Όνομα (username)'),
              MyTextField(textEditingController: usernameTextEditingController),
              SizedBox(
                height: 10,
              ),
              Text('Εικόνα προφίλ (Default)'),
              MyGlobalButton(
                  buttonText: 'Επιλογή εικόνας',
                  fun: () {
                    auth.currentUser?.updatePhotoURL(
                        'https://firebasestorage.googleapis.com/v0/b/jboxserver.appspot.com/o/pngwing.com.png?alt=media&token=469dc118-3465-4368-b04e-4c6cc806b3d0');
                    // 'https://i.pravatar.cc/250?u=${context.read<UserBloc>().state.user!.email}');
                  }),
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
