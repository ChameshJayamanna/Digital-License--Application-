import 'package:flutter/material.dart';
import 'package:flutter_application_2/roadrules.dart';

class Priority extends StatefulWidget {
  const Priority({super.key});

  @override
  State<Priority> createState() => _PriorityState();
}

const Color backgroundColor = Colors.white10;

class _PriorityState extends State<Priority> {
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
        title: const Text('Priority signs'),
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
            leading: Image.asset("lib/assets/image47.png"),
            title:
                const Text("Stop to give priority to vehicles on the adjacent road"),
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
            leading: Image.asset("lib/assets/image48.png"),
            title: const Text("Give Way to vehicles on the adjacent road"),
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
            leading: Image.asset("lib/assets/image49.png"),
            title: const Text("Priority Road to vehicles on the major road"),
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
            leading: Image.asset("lib/assets/image50.png"),
            title: const Text("Priority for the Oncoming Traffic"),
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
            leading: Image.asset("lib/assets/image51.png"),
            title: const Text("Priority over Oncoming Traffic Vehicles"),
            dense: false,
          ),
        ),
      ]),
    );
  }
}
