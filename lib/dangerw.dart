import 'package:flutter/material.dart';
import 'package:flutter_application_2/roadrules.dart';

class Dangerw extends StatefulWidget {
  const Dangerw({Key? key}) : super(key: key);

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
        title: Text('Danger warning signs'),
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
            leading: Image.asset("lib/assets/image01.png"),
            title: Text("Left Bend Ahead"),
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
            leading: Image.asset("lib/assets/image02.png"),
            title: Text("Right Bend Ahead"),
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
            leading: Image.asset("lib/assets/image03.png"),
            title: Text("Double Bend to Left Ahead"),
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
            leading: Image.asset("lib/assets/image04.png"),
            title: Text("Double Bend to Right Ahead"),
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
            leading: Image.asset("lib/assets/image05.png"),
            title: Text("Hair Pin Bend to Right Ahead"),
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
            leading: Image.asset("lib/assets/image06.png"),
            title: Text("Dual Carriage-way Ends"),
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
            leading: Image.asset("lib/assets/image07.png"),
            title: Text("Dual Carriage-way Starts Ahead"),
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
            leading: Image.asset("lib/assets/image08.png"),
            title: Text("Cross Roads Ahead"),
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
            leading: Image.asset("lib/assets/image09.png"),
            title: Text("'T' Junction Ahead"),
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
            leading: Image.asset("lib/assets/image10.png"),
            title: Text("Traffic From Left Merges Ahead"),
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
            leading: Image.asset("lib/assets/image11.png"),
            title: Text("Narrow Bridge or Culvert Ahead"),
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
            leading: Image.asset("lib/assets/image12.png"),
            title: Text("Give Way Ahead"),
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
            leading: Image.asset("lib/assets/image13.png"),
            title: Text("Roundabout Ahead"),
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
            leading: Image.asset("lib/assets/image14.png"),
            title: Text("Light Signals Ahead"),
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
            leading: Image.asset("lib/assets/image15.png"),
            title: Text("Dangerous Descent Ahead"),
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
            leading: Image.asset("lib/assets/image16.png"),
            title: Text("Dangerous Ascent Ahead"),
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
            leading: Image.asset("lib/assets/image17.png"),
            title: Text("Slippery Road Ahead"),
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
            leading: Image.asset("lib/assets/image18.png"),
            title: Text("Falling Rocks Ahead"),
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
            leading: Image.asset("lib/assets/image19.png"),
            title: Text("Pedestrian Crossing Ahead"),
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
            leading: Image.asset("lib/assets/image20.png"),
            title: Text("Children present/ crossing Ahead"),
            dense: false,
          ),
        ),
        Card(
          color: Color.fromARGB(255, 167, 215, 255),
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          child: ListTile(
            leading: Image.asset("lib/assets/image21.png"),
            title: Text("Level Crossing with Gates Ahead"),
            dense: false,
          ),
        ),
        Card(
          color: Color.fromARGB(255, 167, 215, 255),
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          child: ListTile(
            leading: Image.asset("lib/assets/image22.png"),
            title: Text("Unprotected Level Crossing Ahead"),
            dense: false,
          ),
        ),
        Card(
          color: Color.fromARGB(255, 167, 215, 255),
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          child: ListTile(
            leading: Image.asset("lib/assets/image23.png"),
            title: Text("Road Hump Ahead"),
            dense: false,
          ),
        ),
      ]),
    );
  }
}
