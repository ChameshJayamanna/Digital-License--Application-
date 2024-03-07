import 'package:flutter/material.dart';
import 'package:flutter_application_2/roadrules.dart';

class Prohibi extends StatefulWidget {
  const Prohibi({super.key});

  @override
  State<Prohibi> createState() => _ProhibiState();
}

const Color backgroundColor = Colors.white10;
const Color buttonColor = Color.fromARGB(255, 30, 160, 241);

class _ProhibiState extends State<Prohibi> {
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
        title: const Text('Prohibitory signs'),
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
            leading: Image.asset("lib/assets/image24.png"),
            title: const Text("No Entry"),
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
            leading: Image.asset("lib/assets/image25.png"),
            title: const Text("No Left Turn"),
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
            leading: Image.asset("lib/assets/image26.png"),
            title: const Text("No Right Turn"),
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
            leading: Image.asset("lib/assets/image27.png"),
            title: const Text("No U-turn"),
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
            leading: Image.asset("lib/assets/image28.png"),
            title: const Text("No Overtaking"),
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
            leading: Image.asset("lib/assets/image29.png"),
            title: const Text("Overtaking by Goods Vehicles Prohibited"),
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
            leading: Image.asset("lib/assets/image30.png"),
            title: const Text("No Horning"),
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
            leading: Image.asset("lib/assets/image31.png"),
            title: const Text("Road Closed for all vehicles"),
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
            leading: Image.asset("lib/assets/image32.png"),
            title: const Text("Road Closed for Motor vehicles"),
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
            leading: Image.asset("lib/assets/image33.png"),
            title: const Text("Road Closed for Buses"),
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
            leading: Image.asset("lib/assets/image35.png"),
            title: const Text("No Parking"),
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
            leading: Image.asset("lib/assets/image36.png"),
            title: const Text("No Parking and Standing"),
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
            leading: Image.asset("lib/assets/image34.png"),
            title: const Text("No Parking On Odd days"),
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
            leading: Image.asset("lib/assets/image37.png"),
            title: const Text("No Parking on Even days"),
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
            leading: Image.asset("lib/assets/image38.png"),
            title: const Text("Weight Limit"),
            dense: false,
          ),
        ),
      ]),
    );
  }
}
