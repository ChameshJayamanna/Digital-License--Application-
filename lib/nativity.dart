import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/driver_or_police.dart';
import 'package:flutter_application_2/fine.dart';
import 'package:flutter_application_2/history_page.dart';
import 'package:flutter_application_2/login_screen.dart';
import 'package:flutter_application_2/police_signup.dart';
import 'package:flutter_application_2/foreign_signup.dart';
import 'package:flutter_application_2/sign_up.dart';

//import 'package:flutter/services.dart';

class Nativity extends StatefulWidget {
  const Nativity({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Nativity();
  }
}

class _Nativity extends State<Nativity> {
  Widget buildlocalBtn() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => sign()));
          },
          // padding:const EdgeInsets.all(15),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          child: const Text(
            'Local',
            style: TextStyle(color: Colors.white),
          ),
        ));
  }

  Widget buildforeignBtn() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => foreign()));
          },
          // padding:const EdgeInsets.all(15),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          child: const Text(
            'Foreign',
            style: TextStyle(color: Colors.white),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_left_sharp),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Driverpolice()));
              },
            );
          },
        ),
        title: Text('DEMOCRATIC SOCIALIST REPUBLIC OF SRI LANKA'),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 12.5, fontWeight: FontWeight.bold),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 253, 252, 252)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor])),
        ),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(children: <Widget>[
            Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0x66a9c3f9),
                      Color.fromARGB(153, 73, 123, 231),
                      Color.fromARGB(204, 37, 89, 201),
                      Color.fromARGB(255, 10, 43, 112),
                    ])),
                child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 120),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'SELECT',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'NATIVITY',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          buildlocalBtn(),
                          buildforeignBtn(),
                        ])))
          ]),
        ),
      ),
    );
  }
}
