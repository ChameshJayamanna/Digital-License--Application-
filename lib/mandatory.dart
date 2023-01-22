import 'package:flutter/material.dart';
import 'package:flutter_application_2/roadrules.dart';

class Mandatory extends StatefulWidget {
  const Mandatory({Key? key}) : super(key: key);

  @override
  State<Mandatory> createState() => _MandatoryState();
}

const Color backgroundColor = Colors.white10;

class _MandatoryState extends State<Mandatory> {
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
                    MaterialPageRoute(builder: (context) => const Roadrules()));
              },
            );
          },
        ),
        title: Text('Mandatory signs'),
        titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
            fontWeight: FontWeight.bold),
        centerTitle: true,
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor])),
        ),
      ),
      backgroundColor: backgroundColor,
      body: ListView(children: <Widget>[
        SizedBox(
          height: 40,
        ),
        Card(
          color: Color.fromARGB(255, 167, 215, 255),
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          child: ListTile(
            leading: Image.asset("lib/assets/image39.png"),
            title: Text("turn Left"),
            dense: false,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Card(
          color: Color.fromARGB(255, 167, 215, 255),
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          child: ListTile(
            leading: Image.asset("lib/assets/image40.png"),
            title: Text("Turn Right"),
            dense: false,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Card(
          color: Color.fromARGB(255, 167, 215, 255),
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          child: ListTile(
            leading: Image.asset("lib/assets/image41.png"),
            title: Text("Straighgt Ahead"),
            dense: false,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Card(
          color: Color.fromARGB(255, 167, 215, 255),
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          child: ListTile(
            leading: Image.asset("lib/assets/image42.png"),
            title: Text("Turn Left Ahead"),
            dense: false,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Card(
          color: Color.fromARGB(255, 167, 215, 255),
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          child: ListTile(
            leading: Image.asset("lib/assets/image43.png"),
            title: Text("Turn Right Ahead"),
            dense: false,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Card(
          color: Color.fromARGB(255, 167, 215, 255),
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          child: ListTile(
            leading: Image.asset("lib/assets/image44.png"),
            title: Text("Pass Left Side"),
            dense: false,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Card(
          color: Color.fromARGB(255, 167, 215, 255),
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          child: ListTile(
            leading: Image.asset("lib/assets/image45.png"),
            title: Text("Pass Right Side"),
            dense: false,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Card(
          color: Color.fromARGB(255, 167, 215, 255),
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          child: ListTile(
            leading: Image.asset("lib/assets/image46.png"),
            title: Text("Complusory Roundabout"),
            dense: false,
          ),
        ),
      ]),
    );
  }
}
