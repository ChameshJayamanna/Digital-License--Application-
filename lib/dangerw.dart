import 'package:flutter/material.dart';
import 'package:flutter_application_2/roadrules.dart';

class Dangerw extends StatefulWidget {
  const Dangerw({super.key});

  @override
  State<Dangerw> createState() => _DangerwState();
}

const Color backgroundColor = Colors.white10;
const Color buttonColor = Color.fromARGB(255, 30, 160, 241);

class _DangerwState extends State<Dangerw> {
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
        title: const Text('Danger warning signs'),
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
            leading: Image.asset("lib/assets/image01.png"),
            title: const Text("Left Bend Ahead"),
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
            leading: Image.asset("lib/assets/image02.png"),
            title: const Text("Right Bend Ahead"),
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
            leading: Image.asset("lib/assets/image03.png"),
            title: const Text("Double Bend to Left Ahead"),
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
            leading: Image.asset("lib/assets/image04.png"),
            title: const Text("Double Bend to Right Ahead"),
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
            leading: Image.asset("lib/assets/image05.png"),
            title: const Text("Hair Pin Bend to Right Ahead"),
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
            leading: Image.asset("lib/assets/image06.png"),
            title: const Text("Dual Carriage-way Ends"),
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
            leading: Image.asset("lib/assets/image07.png"),
            title: const Text("Dual Carriage-way Starts Ahead"),
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
            leading: Image.asset("lib/assets/image08.png"),
            title: const Text("Cross Roads Ahead"),
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
            leading: Image.asset("lib/assets/image09.png"),
            title: const Text("'T' Junction Ahead"),
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
            leading: Image.asset("lib/assets/image10.png"),
            title: const Text("Traffic From Left Merges Ahead"),
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
            leading: Image.asset("lib/assets/image11.png"),
            title: const Text("Narrow Bridge or Culvert Ahead"),
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
            leading: Image.asset("lib/assets/image12.png"),
            title: const Text("Give Way Ahead"),
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
            leading: Image.asset("lib/assets/image13.png"),
            title: const Text("Roundabout Ahead"),
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
            leading: Image.asset("lib/assets/image14.png"),
            title: const Text("Light Signals Ahead"),
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
            leading: Image.asset("lib/assets/image15.png"),
            title: const Text("Dangerous Descent Ahead"),
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
            leading: Image.asset("lib/assets/image16.png"),
            title: const Text("Dangerous Ascent Ahead"),
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
            leading: Image.asset("lib/assets/image17.png"),
            title: const Text("Slippery Road Ahead"),
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
            leading: Image.asset("lib/assets/image18.png"),
            title: const Text("Falling Rocks Ahead"),
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
            leading: Image.asset("lib/assets/image19.png"),
            title: const Text("Pedestrian Crossing Ahead"),
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
            leading: Image.asset("lib/assets/image20.png"),
            title: const Text("Children present/ crossing Ahead"),
            dense: false,
          ),
        ),
        Card(
          color: const Color.fromARGB(255, 167, 215, 255),
          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          child: ListTile(
            leading: Image.asset("lib/assets/image21.png"),
            title: const Text("Level Crossing with Gates Ahead"),
            dense: false,
          ),
        ),
        Card(
          color: const Color.fromARGB(255, 167, 215, 255),
          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          child: ListTile(
            leading: Image.asset("lib/assets/image22.png"),
            title: const Text("Unprotected Level Crossing Ahead"),
            dense: false,
          ),
        ),
        Card(
          color: const Color.fromARGB(255, 167, 215, 255),
          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          child: ListTile(
            leading: Image.asset("lib/assets/image23.png"),
            title: const Text("Road Hump Ahead"),
            dense: false,
          ),
        ),
      ]),
    );
  }
}
