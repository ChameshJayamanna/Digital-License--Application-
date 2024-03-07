import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_2/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  MyApp({super.key});

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
                return const SplashScreen();
              } else {
                return const SplashScreen();
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
