import 'dart:async';

import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SplashScreen> {
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 7);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(204, 37, 89, 201),
            gradient: LinearGradient(colors: [
              (Color.fromARGB(204, 37, 89, 201)),
              (Color.fromARGB(204, 16, 16, 17))
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      ),
      Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Container(
              child: Image.asset("lib/assets/logo4.jpg"),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ]))
    ]));
  }
}
