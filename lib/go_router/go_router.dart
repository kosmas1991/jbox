import 'package:go_router/go_router.dart';
import 'package:jbox/screens/adminscreen.dart';
import 'package:jbox/screens/displayscreen.dart';
import 'package:jbox/screens/homescreen.dart';
import 'package:jbox/screens/loginscreen.dart';

class GoRouterProvider {
  static final GoRouter router = GoRouter(
    initialLocation: HomeScreen.routeName,
    routes: [
      GoRoute(
        name: HomeScreen.routeName,
        path: HomeScreen.routeName,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        name: LoginScreen.routeName,
        path: LoginScreen.routeName,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        name: AdminScreen.routeName,
        path: AdminScreen.routeName + '/:user',
        builder: (context, state) => AdminScreen(
          user: state.pathParameters['user'] ?? '',
        ),
      ),
      GoRoute(
        name: DisplayScreen.routeName,
        path: DisplayScreen.routeName,
        builder: (context, state) => DisplayScreen(
          terminal: state.uri.queryParameters['terminal'] ?? '',
        ),
      ),
    ],
  );
}
