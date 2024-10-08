import 'package:go_router/go_router.dart';
import 'package:jbox/screens/homescreen.dart';
import 'package:jbox/screens/loginscreen.dart/loginscreen.dart';

class GoRouterProvider {
  static final GoRouter router = GoRouter(
    initialLocation: HomeScreen.routeName,
    routes: [
      GoRoute(
        name: '/',
        path: HomeScreen.routeName,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        name: '/login',
        path: LoginScreen.routeName + '/:test',
        builder: (context, state) => LoginScreen(
          name: state.matchedLocation,
        ),
      ),
    ],
  );
}
