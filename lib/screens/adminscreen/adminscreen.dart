import 'package:flutter/material.dart';
import 'package:jbox/global%20widgets/mainlogo.dart';
import 'package:jbox/main.dart';
import 'package:jbox/responsiveness/responsive_widget.dart';
import 'package:jbox/screens/adminscreen/loggedoutadmin.dart';

//? Admin screen will be a 3 vertical screen combination. 1st: parameters, 2nd: display screen preview, 3rd: not sure (maybe profile pic image, log out button etc)
//? with desktop mode all three are visible, with tablet first two, mobile only second screen
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class AdminScreen extends StatelessWidget {
  AdminScreen({
    super.key,
  });

  static final String routeName = '/admin';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return auth.currentUser == null
        ? LoggedOutAdmin()
        : Scaffold(
            key: _scaffoldKey,
            // Assign key to Scaffold
            // appBar: AppBar(title: Text('Responsive Layout')),

            // Define both left-side drawer and right-side endDrawer
            drawer: Drawer(
              child: DrawerContent(label: 'Left Drawer (First Screen)'),
            ),
            endDrawer: Drawer(
              child: DrawerContent(label: 'Right Drawer (Third Screen)'),
            ),

            body: Column(
              children: [
                Container(
                  height: 40,
                  child: Row(
                    children: [
                      MainLogo(),
                      SizedBox(
                        width: 20,
                      ),
                      Text('Σελίδα διαχείρισης'),
                    ],
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      // Desktop Mode - all three screens visible
                      if (constraints.maxWidth >= 1024) {
                        return Row(
                          children: [
                            Expanded(
                                flex: 2, child: FirstScreen()), // Flex size 2
                            Expanded(
                                flex: 3, child: SecondScreen()), // Flex size 3
                            Expanded(
                                flex: 2, child: ThirdScreen()), // Flex size 2
                          ],
                        );
                      }
                      // Tablet Mode - first and second screens visible, third as endDrawer
                      else if (constraints.maxWidth >= 600) {
                        return Row(
                          children: [
                            Expanded(
                                flex: 2, child: FirstScreen()), // Flex size 2
                            Expanded(
                                flex: 3, child: SecondScreen()), // Flex size 3
                            // Button to open right-side endDrawer (Third Screen)
                            Builder(
                              builder: (context) =>
                                  DrawerButton(context, isEndDrawer: true),
                            ),
                          ],
                        );
                      }
                      // Mobile Mode - second screen visible, others as drawers
                      else {
                        return Row(
                          children: [
                            Builder(
                              builder: (context) => DrawerButton(context,
                                  isEndDrawer:
                                      false), // Button for left drawer (First Screen)
                            ),
                            Expanded(
                                flex: 3, child: SecondScreen()), // Flex size 3
                            Builder(
                              builder: (context) => DrawerButton(context,
                                  isEndDrawer:
                                      true), // Button for right drawer (Third Screen)
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          );
  }
}

// Drawer button widget
Widget DrawerButton(BuildContext context, {required bool isEndDrawer}) {
  return IconButton(
    icon: Icon(Icons.menu),
    onPressed: () {
      if (isEndDrawer) {
        _scaffoldKey.currentState
            ?.openEndDrawer(); // Open the end drawer (right)
      } else {
        _scaffoldKey.currentState?.openDrawer(); // Open the left drawer
      }
    },
  );
}

// Placeholder for first, second, and third screens
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(child: Text('First Screen')),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(child: Text('Second Screen')),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(child: Text('Third Screen')),
    );
  }
}

// Content for the drawer
class DrawerContent extends StatelessWidget {
  final String label;

  DrawerContent({required this.label});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text(label),
          onTap: () {
            Navigator.pop(context); // Close the drawer on tap
          },
        ),
      ],
    );
  }
}
  // BlocListener<UserBloc, UserState>(
  //     listener: (context, state) {
  //       if (!state.loggedIn) {
  //         GoRouter.of(context).goNamed(HomeScreen.routeName);
  //       }
  //     },
  //     child: Scaffold(
  //       body: Center(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Text('data received:  '),
  //             MyGlobalButton(
  //               fun: () {
  //                 GoRouter.of(context).goNamed(DisplayScreen.routeName,
  //                     queryParameters: {'terminal': '5thAvenue'});
  //               },
  //               buttonText: 'go to display',
  //             ),
  //             MyGlobalButton(
  //               fun: () {
  //                 FirebaseAuth.instance.signOut();
  //               },
  //               buttonText: 'Log out',
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );

