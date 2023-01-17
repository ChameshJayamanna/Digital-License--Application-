import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/police_profile.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class Driversearch extends StatefulWidget {
  const Driversearch({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DriversearchState();
  }
}


class _DriversearchState extends State<Driversearch> {
   TextEditingController textController = TextEditingController();
  Widget build(BuildContext context) {
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
                        builder: (context) => const Policeprofile()));
              },
            );
          },
        ),
        title: Text('Driver search'),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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
     body:Padding(
      padding: const EdgeInsets.only(top:20.0, right: 10, left: 20),
       child: AnimSearchBar(
        width: 400,
        textController: textController,
        onSuffixTap: () {
          setState(() {
            textController.clear();
          });
        }, onSubmitted: (String ) {  },
      ),
     ),
    );
  }
 }