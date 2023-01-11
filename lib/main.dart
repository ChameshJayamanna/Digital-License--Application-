import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/login_screen.dart';
import 'package:flutter_application_2/profile_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_2/splash_screen.dart';
import 'package:flutter_application_2/utils/firebase_user_preferences.dart';
import 'package:flutter_application_2/utils/user_preferences.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
            future: _fbApp,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('You have an error! ${snapshot.error.toString()}');
                return const Text('Something went wrong');
              } else if (snapshot.hasData) {
                return SplashScreen();
              } else {
                return SplashScreen();
              }
            }));
  }
}

Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('DEMOCRATIC SOCIALIST REPUBLIC OF SRI LANKA'),
      centerTitle: true,
      backgroundColor: const Color(0xff40cc99),
    ),
  );
}
