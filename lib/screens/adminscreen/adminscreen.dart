import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbox/blocs/user/user_bloc.dart';
import 'package:jbox/global%20widgets/mainlogo.dart';
import 'package:jbox/go_router/go_router.dart';
import 'package:jbox/main.dart';
import 'package:jbox/responsiveness/responsive_widget.dart';
import 'package:jbox/screens/adminscreen/drawer_button.dart';
import 'package:jbox/screens/adminscreen/drawer_content.dart';
import 'package:jbox/screens/adminscreen/end_drawer_content.dart';
import 'package:jbox/screens/adminscreen/fill_user_data.dart';
import 'package:jbox/screens/adminscreen/first_screen.dart';
import 'package:jbox/screens/adminscreen/loggedoutadmin.dart';
import 'package:jbox/screens/adminscreen/second_screen.dart';
import 'package:jbox/screens/adminscreen/third_screen.dart';
import 'package:jbox/screens/homescreen/homescreen.dart';

//? Admin screen is a 3 vertical screen combination. 1st: parameters, 2nd: display screen preview, 3rd: not sure (maybe profile pic image, log out button etc)
//? with desktop mode all three are visible, with tablet first two, mobile only second screen
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class AdminScreen extends StatefulWidget {
  AdminScreen({
    super.key,
  });

  static final String routeName = '/admin';

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  TextEditingController usernameTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //? checking if logged in
    return auth.currentUser == null
        ? LoggedOutAdmin()
        : BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (checkUserDataFilled(state.user)) {
                return Scaffold(
                  key: scaffoldKey,
                  drawer: Drawer(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.zero)),
                    child: DrawerContent(label: 'Left Drawer (First Screen)'),
                  ),
                  endDrawer: Drawer(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.zero)),
                    child:
                        EndDrawerContent(label: 'Right Drawer (Third Screen)'),
                  ),
                  body: Column(
                    children: [
                      Container(
                        height: 40,
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () => GoRouterProvider.router
                                    .goNamed(HomeScreen.routeName),
                                child: MainLogo()),
                            SizedBox(
                              width: 20,
                            ),
                            Text('Σελίδα διαχείρισης'),
                          ],
                        ),
                      ),
                      Expanded(
                          child: ResponsiveWidget(
                        largeScreen: Row(
                          children: [
                            Expanded(flex: 2, child: FirstScreen()),
                            Expanded(flex: 3, child: SecondScreen()),
                            Expanded(flex: 2, child: ThirdScreen()),
                          ],
                        ),
                        mediumScreen: Row(
                          children: [
                            Expanded(flex: 2, child: FirstScreen()),
                            Expanded(flex: 3, child: SecondScreen()),
                            Builder(
                              builder: (context) => MyDrawerButton(
                                isEndDrawer: true,
                              ),
                            ),
                          ],
                        ),
                        smallScreen: Row(
                          children: [
                            Builder(
                              builder: (context) =>
                                  MyDrawerButton(isEndDrawer: false),
                            ),
                            Expanded(flex: 3, child: SecondScreen()),
                            Builder(
                              builder: (context) =>
                                  MyDrawerButton(isEndDrawer: true),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                );
              } else {
                return FillUserData(
                  usernameTextEditingController: usernameTextEditingController,
                );
              }
            },
          );
  }

  bool checkUserDataFilled(User? user) {
    if (user == null) {
      return false;
    }
    return user.displayName != null &&
        user.email != null &&
        user.photoURL != null;
  }
}
