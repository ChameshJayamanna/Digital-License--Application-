import 'package:flutter/material.dart';
import 'package:flutter_application_2/roadrules.dart';

class Highwayrules extends StatefulWidget {
  const Highwayrules({super.key});

  @override
  State<Highwayrules> createState() => _HighwayrulesState();
}

const Color backgroundColor = Colors.white10;
const Color buttonColor = Color.fromARGB(255, 30, 160, 241);

class _HighwayrulesState extends State<Highwayrules> {
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
        title: const Text('Highway Rules'),
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
      body: ListView(children: const <Widget>[
        SizedBox(
          height: 40,
        ),
        Card(
          elevation: 15.0,
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          color: Color.fromARGB(255, 167, 215, 255),
          child: ListTile(
            title: Text(
                "A ticket will be given to you at the interchange's toll gate as you access the expressway.                                    The Vehicle type and Interchange you entered are displayed on the ticket."),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Card(
            elevation: 100.0,
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
            color: Color.fromARGB(255, 167, 215, 255),
            child: ListTile(
                title: Text(
                    'Maintain a safe distance from the car in front of you.'))),
        SizedBox(
          height: 12,
        ),
        Card(
          elevation: 15.0,
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          color: Color.fromARGB(255, 167, 215, 255),
          child: ListTile(
            title: Text(
                'The ticket you were given at the entry counter should be kept since you will need it to exit the highway.'),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Card(
          elevation: 15.0,
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          color: Color.fromARGB(255, 167, 215, 255),
          child: ListTile(
            title: Text('Speed is limited to 100 kilometers per hour.'),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Card(
          elevation: 15.0,
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          color: Color.fromARGB(255, 167, 215, 255),
          child: ListTile(
            title: Text(
                'Before changing lanes, check all mirrors, turn on signals, and then proceed to overtake.                                    After passing the vehicle, check your mirrors to ensure that you have cleared the vehicles, then turn on your signals again and return to the other lane.'),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Card(
          elevation: 15.0,
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          color: Color.fromARGB(255, 167, 215, 255),
          child: ListTile(
            title: Text(
                'In the Emergency, parking Only emergencies are authorized to use the parking lane.'),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Card(
          elevation: 15.0,
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          color: Color.fromARGB(255, 167, 215, 255),
          child: ListTile(
            title: Text(
                'Must refrain from opening car windows and putting their heads or hands out of the windows.'),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Card(
          elevation: 15.0,
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          color: Color.fromARGB(255, 167, 215, 255),
          child: ListTile(
            title: Text(
                'All passengers, especially those in the back seats, should be buckled up.'),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Card(
          elevation: 15.0,
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          color: Color.fromARGB(255, 167, 215, 255),
          child: ListTile(
            title: Text(
                'If you notice an accident, call emergency number 1969 right away and give them the location.                                     Never stop unless the traffic lane in front of you is blocked since doing so increases the risk of subsequent accidents.'),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Card(
          elevation: 15.0,
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          color: Color.fromARGB(255, 167, 215, 255),
          child: ListTile(
            title: Text(
                "The expressway's maintenance, emergency services, and paramedical services would all be paid for by user fees."),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Card(
          elevation: 15.0,
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          color: Color.fromARGB(255, 167, 215, 255),
          child: ListTile(
            title: Text(
                "The Expressway's entry/exit ramps may only be driven at a top speed of 60 kph."),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Card(
          elevation: 15.0,
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          color: Color.fromARGB(255, 167, 215, 255),
          child: ListTile(
            title: Text(
                'If an accident happens while changing lanes, the driver who tried to do so will be held accountable and their license will be suspended.'),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Card(
          elevation: 15.0,
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          color: Color.fromARGB(255, 167, 215, 255),
          child: ListTile(
            title: Text(
                "It is restricted for pedestrians, three-wheelers, motorcycles, tractors, and bicycles to enter the expressway."),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Card(
          elevation: 15.0,
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          color: Color.fromARGB(255, 167, 215, 255),
          child: ListTile(
            title: Text(
                "While driving on the expressway, don't throw trash or any other rubbish from your vehicle."),
          ),
        ),
      ]),
    );
  }
}
