import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jbox/blocs/user/user_bloc.dart';
import 'package:jbox/global%20widgets/myglobalbutton.dart';
import 'package:jbox/main.dart';
import 'package:jbox/screens/homescreen/homescreen.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(left: BorderSide(color: Colors.black, width: 0.2))),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(auth.currentUser?.displayName?? 'user logged off'),
            SizedBox(
              height: 10,
            ),
            ClipOval(
              child: Image.network(
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return CircularProgressIndicator(
                      color: Colors.black,
                    );
                  }
                },
                context.watch<UserBloc>().state.user!.photoURL!,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MyGlobalButton(
              buttonText: 'Αποσύνδεση',
              fun: () {
                auth.signOut();
                GoRouter.of(context).goNamed(HomeScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
