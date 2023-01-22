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
              Color.fromARGB(255, 13, 148, 215),
              Color.fromARGB(255, 100, 190, 246),
              // Colors.blue.shade100,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      ),
      Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Container(
              child: Image.asset(
                "lib/assets/logo1new2.png",
                height: 180,
                width: 180,
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
                child: Text("More than just a DIGITAL",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500))),
            Padding(padding: EdgeInsets.only(top: 20)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ]))
    ]));
  }
}
