import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:flutter_application_2/roadrules.dart';

class Basicrules extends StatefulWidget {
  const Basicrules({Key? key}) : super(key: key);

  @override
  State<Basicrules> createState() => _BasicrulesState();
}

const Color backgroundColor = Colors.white10;
const Color buttonColor = Color.fromARGB(255, 30, 160, 241);

class _BasicrulesState extends State<Basicrules> {
  List<Map<String, String>> _elements = [
    {
      'name':
          'When driving a vehicle on a road, the driver and the passenger sitting next to them in the front must both be belted in.',
      'group': 'Common rules'
    },
    {
      'name': 'Driver must not drive when impaired by drink or drugs.',
      'group': 'Common rules'
    },
    {
      'name':
          'Driving while distracted by a mobile phone is strictly prohibited.',
      'group': 'Common rules'
    },
    {'name': 'You must always obey the road signs.', 'group': 'Common rules'},
    {
      'name': 'Unless overtaking, all traffic is supposed to stay to the left.',
      'group': 'Left hand rule'
    },
    {
      'name': 'Right-turning traffic must cross in front of incoming traffic.',
      'group': 'Left hand rule'
    },
    {
      'name': 'After stopping, a left turn at a red signal may be permitted.',
      'group': 'Left hand rule'
    },
    {
      'name': 'After stopping, a left turn at a red signal may be permitted.',
      'group': 'Left hand rule'
    },
    {
      'name': 'On roundabouts, traffic goes clockwise',
      'group': 'Left hand rule'
    },
    {
      'name': 'A red light always indicates "stop".',
      'group': 'On traffic lights'
    },
    {
      'name':
          'A yellow light indicates that you should slow down and prepare to stop your car.',
      'group': 'On traffic lights'
    },
    {
      'name': 'A green light indicates you are good to go.',
      'group': 'On traffic lights'
    },
    {
      'name':
          "If both traffic lights and police officers are present, you must obey the officer's instructions.",
      'group': 'On traffic lights'
    },
  ];

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
        title: Text('Basic Rules'),
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
      body: GroupedListView<dynamic, String>(
        elements: _elements,
        groupBy: (element) => element['group'],
        itemComparator: (item1, item2) =>
            item1['name'].compareTo(item2['name']),
        order: GroupedListOrder.ASC, // optional
        useStickyGroupSeparators: true, // optional (keeps header at top)
        floatingHeader: true, // optional (hides background of header)
        groupSeparatorBuilder: (String value) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        itemBuilder: (ctx, element) {
          return Card(
            elevation: 8.0,
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
            color: Color.fromARGB(255, 167, 215, 255),
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              title: Text(element['name']),
            ),
          );
        },
      ),
    );
  }
}
