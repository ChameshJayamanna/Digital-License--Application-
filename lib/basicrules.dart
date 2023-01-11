import 'package:flutter/material.dart';

import 'package:flutter_application_2/roadrules.dart';

class Basicrules extends StatefulWidget {
  const Basicrules({Key? key}) : super(key: key);

  @override
  State<Basicrules> createState() => _BasicrulesState();
}

const Color backgroundColor = Colors.white10;
const Color buttonColor = Color.fromARGB(255, 30, 160, 241);

class _BasicrulesState extends State<Basicrules> {
  int _selectedIndex = 0;

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
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
        ),
      ),
    );
  }
}
