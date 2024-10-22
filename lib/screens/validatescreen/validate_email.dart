import 'package:flutter/material.dart';
import 'package:jbox/blocs/user/user_bloc.dart';
import 'package:jbox/extensions/printextensions.dart';
import 'package:jbox/global%20widgets/myglobalbutton.dart';
import 'package:jbox/global%20widgets/mysnackbar.dart';
import 'package:jbox/main.dart';

class ValidateEmail extends StatelessWidget {
  const ValidateEmail({super.key});

  static final String routeName = '/validate';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Το email δεν έχει επαληθευτεί'),
            SizedBox(
              height: 10,
            ),
            MyGlobalButton(
                width: 300,
                buttonText: 'Αποστολή email επαλήθευσης',
                fun: () {
                  try {
                    if (auth.currentUser != null) {
                      'user not null'.printWarning();
                      auth.currentUser!.sendEmailVerification();
                    }

                    MyApp.snackbarKey.currentState?.showSnackBar(mySnackBar(
                        'Το email εστάλη',
                        severity: Severity.success));
                  } catch (e) {
                    MyApp.snackbarKey.currentState?.showSnackBar(
                        mySnackBar(e.toString(), severity: Severity.success));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
