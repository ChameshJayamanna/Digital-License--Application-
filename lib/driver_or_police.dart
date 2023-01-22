import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/login_screen.dart';
import 'package:flutter_application_2/nativity.dart';
import 'package:flutter_application_2/police_signup.dart';

//import 'package:flutter/services.dart';

class Driverpolice extends StatefulWidget {
  const Driverpolice({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DriverpoliceState();
  }
}

class _DriverpoliceState extends State<Driverpolice> {
  Widget builddriverBtn() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: 150,
        height: 90,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Nativity()));
          },
          // padding:const EdgeInsets.all(15),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.blue.shade400),
          ),
          child: const Text(
            'Driver ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ));
  }

  Widget buildpoliceBtn() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: 150,
        height: 90,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const policesignup()));
          },
          // padding:const EdgeInsets.all(15),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.blue.shade400),
          ),
          child: const Text(
            'Police',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            );
          },
        ),
        title: Text('DEMOCRATIC SOCIALIST REPUBLIC OF SRI LANKA'),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 253, 252, 252)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor])),
        ),
        //  backgroundColor: Color.fromARGB(206, 93, 209, 255),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(children: <Widget>[
            Container(
                height: double.infinity,
                width: double.infinity,
                /*decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0x66a9c3f9),
                      Color.fromARGB(153, 73, 123, 231),
                      Color.fromARGB(204, 37, 89, 201),
                      Color.fromARGB(255, 10, 43, 112),
                    ])),*/
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(begin: Alignment.topCenter, colors: [
                  Color.fromARGB(255, 73, 161, 205),
                  Color.fromARGB(255, 102, 183, 215),
                  Color.fromARGB(255, 72, 205, 192),
                ])),
                // color:const Color.fromRGBO(174, 198, 207,20),
                child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 150),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'SIGN IN',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'AS',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          builddriverBtn(),
                          buildpoliceBtn(),
                        ])))
          ]),
        ),
      ),
    );
  }
}
