import 'package:flutter/material.dart';
import 'package:flutter_application_2/profile_page.dart';
import 'package:flutter_application_2/basicrules.dart';

class Roadrules extends StatefulWidget {
  const Roadrules({Key? key}) : super(key: key);

  @override
  State<Roadrules> createState() => _RoadrulesState();
}

const Color backgroundColor = Colors.white10;
const Color buttonColor = Color.fromARGB(255, 30, 160, 241);

class _RoadrulesState extends State<Roadrules> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 80),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: MaterialButton(
                    minWidth: 100,
                    height: 100,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)),
                    color: buttonColor,
                    child: Column(
                      children: const <Widget>[
                        Icon(
                          Icons.article,
                          size: 40,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text('Basic'),
                        Text('Rules'),
                      ],
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Basicrules()));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: MaterialButton(
                    minWidth: 100,
                    height: 100,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)),
                    color: buttonColor,
                    child: Column(
                      children: const <Widget>[
                        Icon(
                          Icons.car_rental,
                          size: 40,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text('Highway'),
                        Text('Rules'),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: MaterialButton(
                    minWidth: 100,
                    height: 100,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)),
                    color: buttonColor,
                    child: Column(
                      children: const <Widget>[
                        Icon(
                          Icons.block_rounded,
                          size: 40,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text('Prohibitory'),
                        Text('Signs'),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: MaterialButton(
                    minWidth: 100,
                    height: 100,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)),
                    color: buttonColor,
                    child: Column(
                      children: const <Widget>[
                        Icon(
                          Icons.directions_outlined,
                          size: 40,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text('Mandatory'),
                        Text('Signs'),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: MaterialButton(
                    minWidth: 100,
                    height: 100,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)),
                    color: buttonColor,
                    child: Column(
                      children: const <Widget>[
                        Icon(
                          Icons.priority_high_rounded,
                          size: 40,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text('Priority'),
                        Text('Signs'),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: MaterialButton(
                    minWidth: 100,
                    height: 100,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)),
                    color: buttonColor,
                    child: Column(
                      children: const <Widget>[
                        Icon(
                          Icons.error_sharp,
                          size: 40,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text('Danger'),
                        Text('Warning'),
                        Text('Signs'),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      const Center(
        child: Icon(
          Icons.auto_graph,
          size: 100,
        ),
      ),
      const Center(
        child: Icon(
          Icons.compare_arrows,
          size: 100,
        ),
      ),
      const Center(
        child: Icon(
          Icons.category,
          size: 100,
        ),
      ),
      const Center(
        child: Icon(
          Icons.settings,
          size: 100,
        ),
      ),
    ];

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
                        builder: (context) => const Profilepage()));
              },
            );
          },
        ),
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
      ),
    );
  }
}
