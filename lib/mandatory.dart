import 'package:flutter/material.dart';
import 'package:flutter_application_2/roadrules.dart';

class Mandatory extends StatefulWidget {
  const Mandatory({super.key});

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
        title: const Text('Mandatory signs'),
        titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
            fontWeight: FontWeight.bold),
        centerTitle: true,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.white),
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
        const SizedBox(
          height: 40,
        ),
        Card(
          color: const Color.fromARGB(255, 167, 215, 255),
          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          child: ListTile(
            leading: Image.asset("lib/assets/image39.png"),
            title: const Text("turn Left"),
            dense: false,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Card(
          color: const Color.fromARGB(255, 167, 215, 255),
          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          child: ListTile(
            leading: Image.asset("lib/assets/image40.png"),
            title: const Text("Turn Right"),
            dense: false,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Card(
          color: const Color.fromARGB(255, 167, 215, 255),
          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          child: ListTile(
            leading: Image.asset("lib/assets/image41.png"),
            title: const Text("Straighgt Ahead"),
            dense: false,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Card(
          color: const Color.fromARGB(255, 167, 215, 255),
          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          child: ListTile(
            leading: Image.asset("lib/assets/image42.png"),
            title: const Text("Turn Left Ahead"),
            dense: false,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Card(
          color: const Color.fromARGB(255, 167, 215, 255),
          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          child: ListTile(
            leading: Image.asset("lib/assets/image43.png"),
            title: const Text("Turn Right Ahead"),
            dense: false,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Card(
          color: const Color.fromARGB(255, 167, 215, 255),
          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          child: ListTile(
            leading: Image.asset("lib/assets/image44.png"),
            title: const Text("Pass Left Side"),
            dense: false,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Card(
          color: const Color.fromARGB(255, 167, 215, 255),
          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          child: ListTile(
            leading: Image.asset("lib/assets/image45.png"),
            title: const Text("Pass Right Side"),
            dense: false,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Card(
          color: const Color.fromARGB(255, 167, 215, 255),
          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          child: ListTile(
            leading: Image.asset("lib/assets/image46.png"),
            title: const Text("Complusory Roundabout"),
            dense: false,
          ),
        ),
      ]),
    );
  }
}
