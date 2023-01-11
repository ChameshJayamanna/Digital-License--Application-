import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/fine.dart';
import 'package:flutter_application_2/history_page.dart';
import 'package:flutter_application_2/login_screen.dart';
import 'package:flutter_application_2/roadrules.dart';
import 'package:flutter_application_2/utils/user_preferences.dart';
import 'package:flutter/services.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class Profilepage extends StatefulWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProfilepageState();
  }
}

class _ProfilepageState extends State<Profilepage> {
  //late User user;

  /*void initState() {
    super.initState();
    user = UserPreferences.getUser();
  }*/

  Widget buildFullname() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Full name',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(6, 6))
                ]),
            height: 60,
            child: const TextField(
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
              ),
            )),
      ],
    );
  }

  Widget buildAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Address',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(6, 6))
                ]),
            height: 60,
            child: const TextField(
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
              ),
            )),
      ],
    );
  }

  Widget buildbod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Date of birth',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(6, 6))
                ]),
            height: 60,
            child: const TextField(
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
              ),
            )),
      ],
    );
  }

  Widget buildbloodtype() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Blood group',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(6, 6))
                ]),
            height: 60,
            child: const TextField(
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
              ),
            )),
      ],
    );
  }

  Widget buildvtype() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Vehicle Types',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(6, 6))
                ]),
            height: 60,
            child: const TextField(
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
              ),
            )),
        ElevatedButton(
            onPressed: () => {
                  //sign out
                  signOut()
                },
            child: Text('Sign out'))
      ],
    );
  }

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
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            );
          },
        ),
        title: const Text('Driver Profile Page'),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons
                .more_vert_rounded), //don't specify icon if you want 3 dot menu
            color: Colors.blue,
            itemBuilder: (context) => [
              const PopupMenuItem<int>(
                value: 0,
                child: const Text(
                  "Road rules",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
            onSelected: (item) => SelectedItem(context, item),
          ),
        ],
        elevation: 0.5,
        iconTheme: const IconThemeData(
            color: const Color.fromARGB(255, 253, 252, 252)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor])),
        ),
      ),
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Container(
            height: 100,
            child: HeaderWidget(100, false, Icons.house_rounded),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(10, 15, 20, 20),
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color.fromARGB(255, 240, 242, 243),
                    boxShadow: [
                      const BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: Offset(5, 5)),
                    ],
                  ),
                  child: const Icon(Icons.person,
                      size: 80, color: const Color.fromARGB(255, 18, 17, 17)),
                ),
                const SizedBox(height: 20),
                const Text(
                  'ID :XXXXXXXXXXX',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  child: Row(
                    children: [
                      const SizedBox(width: 100),
                      ElevatedButton.icon(
                        label: Text('View history'),
                        icon: Icon(Icons.history_rounded),
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(
                                255, 30, 160, 241), //background color of button
                            //side: BorderSide(width:1, color:Color.fromARGB(255, 0, 0, 0)), //border width and color
                            elevation: 3, //elevation of button
                            shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(20)),
                            padding: EdgeInsets.all(
                                20) //content padding inside button
                            ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const history()));
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                buildFullname(),
                const SizedBox(height: 20),
                buildAddress(),
                const SizedBox(height: 20),
                buildbod(),
                const SizedBox(height: 20),
                buildbloodtype(),
                const SizedBox(height: 20),
                buildvtype(),
                const SizedBox(height: 20),
              ],
            ),
          )
        ],
      )),
    );
  }

  signOut() {
    //redirect
    _auth.signOut().then((value) => Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen())));
  }
}

//
/* void initState() {
    super.initState();
    user = UserPreferences.getUser();
  }*/
HeaderWidget(int i, bool bool, IconData house_rounded) {}

void SelectedItem(BuildContext context, item) {
  switch (item) {
    case 0:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Roadrules()));
      break;
  }
}
