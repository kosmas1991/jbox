import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jbox/global%20widgets/myglobalbutton.dart';
import 'package:jbox/screens/displayscreen/displayscreen.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Second (Main) Screen'),
            SizedBox(
              height: 10,
            ),
            //TODO add here a preview of display screen
            SizedBox(
              height: 10,
            ),
            MyGlobalButton(
              fun: () {
                GoRouter.of(context).goNamed(DisplayScreen.routeName,
                    queryParameters: {'terminal': '5thAvenue'});
              },
              buttonText: 'go to display',
            ),
          ],
        ),
      ),
    );
  }
}
