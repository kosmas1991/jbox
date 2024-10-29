import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jbox/blocs/user/user_bloc.dart';
import 'package:jbox/firebaseconfig/firebase_options.dart';
import 'package:jbox/go_router/go_router.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:jbox/translations/translation.dart';

//? G L O B A L S
var auth = FirebaseAuth.instance;
var storage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

//! flutter run -d chrome --web-renderer html
//! flutter build web --web-renderer html --release

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  usePathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final snackbarKey = GlobalKey<ScaffoldMessengerState>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => UserBloc(),
        ),
      ],
      child: MaterialApp.router(
        scaffoldMessengerKey: snackbarKey,
        localizationsDelegates: [
          FirebaseUILocalizations.withDefaultOverrides(const LabelOverrides()),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          FirebaseUILocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        title: 'JBox',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: GoRouterProvider.router,
      ),
    );
  }
}
