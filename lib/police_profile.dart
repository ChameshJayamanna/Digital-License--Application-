import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'driver_search.dart';
import 'history_page.dart';
import 'login_Screen.dart';
import 'map.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
var fullName = '';
var nic = '';
var rank = '';
var offaddress = '';
var homaddress = '';
var pnumber = '';

//import 'package:flutter/services.dart';

class Policeprofile extends StatefulWidget {
  const Policeprofile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PoliceprofileState();
  }
}

class _PoliceprofileState extends State<Policeprofile> {
  @override
  void initState() {
    getUser();
    super.initState();
  }

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
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(6, 6))
              ]),
          height: 60,
          child: Text(
            fullName,
            style: TextStyle(color: Colors.black87),
          ),
        ),
      ],
    );
  }

  Widget buildOaddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Official Address',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(6, 6))
              ]),
          height: 60,
          child: Text(
            offaddress,
            style: TextStyle(color: Colors.black87),
          ),
        ),
      ],
    );
  }

  Widget buildrank() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Rank',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(6, 6))
              ]),
          height: 60,
          child: Text(
            rank,
            style: TextStyle(color: Colors.black87),
          ),
        ),
      ],
    );
  }

  Widget buildaddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Home Address',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(6, 6))
              ]),
          height: 60,
          child: Text(
            homaddress,
            style: TextStyle(color: Colors.black87),
          ),
        ),
      ],
    );
  }

  Widget buildphoneno() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Phone number',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(6, 6))
              ]),
          height: 60,
          child: Text(
            pnumber,
            style: TextStyle(color: Colors.black87),
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
            onPressed: () => {
                  //sign out
                  signOut()
                },
            child: Text('Sign out'))
      ],
    );
  }

  Widget buildnic() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'National Identity Card number',
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
                    color: Colors.black26, blurRadius: 6, offset: Offset(6, 6))
              ]),
          height: 60,
          child: Text(
            nic,
            style: TextStyle(color: Colors.black87),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Police Profile Page'),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        centerTitle: true,
        elevation: 0.5,
        actions: [
          PopupMenuButton(
            icon: Icon(Icons
                .more_vert_rounded), //don't specify icon if you want 3 dot menu
            color: Colors.blue,
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Text(
                  "View driver profile",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text(
                  "Map",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              PopupMenuItem<int>(
                value: 2,
                child: Text(
                  "Add history",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
            onSelected: (item) => SelectedItem(context, item),
          ),
        ],
        iconTheme: IconThemeData(color: Color.fromARGB(255, 253, 252, 252)),
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
            margin: EdgeInsets.fromLTRB(10, 15, 20, 20),
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: Offset(5, 5)),
                    ],
                  ),
                  child: Icon(Icons.person, size: 80, color: Colors.grey),
                ),
                SizedBox(height: 20),
                Text(
                  'ID :' +
                      (_auth.currentUser!.uid != null
                          ? _auth.currentUser!.uid
                          : ''),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                buildFullname(),
                const SizedBox(height: 20),
                buildnic(),
                const SizedBox(height: 20),
                buildrank(),
                const SizedBox(height: 20),
                buildOaddress(),
                const SizedBox(height: 20),
                buildaddress(),
                const SizedBox(height: 20),
                buildphoneno(),
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

  Future getUser() async {
    if (_auth.currentUser != null) {
      var phoneNumber = _auth.currentUser!.phoneNumber;
      phoneNumber = '0' +
          _auth.currentUser!.phoneNumber!.substring(3, phoneNumber!.length);
      debugPrint(phoneNumber);

      if (_auth.currentUser != null) {
        List<String> collectionNames = [
          "AS",
          "ChiefInspector",
          "DIG",
          "IG",
          "Inspector",
          "PSClass1",
          "PSClass2",
          "PSClass3",
          "PSClass4",
          "SDIG",
          "SI",
          "SS",
          "SergeantMajor",
          "SuperIntendent"
        ];
        for (String collectionName in collectionNames) {
          await _firestore
              .collection('Police')
              .doc('Rank')
              .collection(collectionName)
              .where('PhoneNumber', isEqualTo: phoneNumber)
              .get()
              .then((result) {
            //print("docs length: " + result.docs.length.toString());
            //print(result.docs.length);
            if (mounted) {
              if (result.docs.length > 0) {
                setState(() {
                  var data = result.docs[0].data();
                  if (data.containsKey('FullName')) {
                    fullName = data['FullName'];
                  }
                  if (data.containsKey('NIC')) {
                    nic = data['NIC'];
                  }
                  if (data.containsKey('Rank')) {
                    rank = data['Rank'];
                  }
                  if (data.containsKey('OfficialAddress')) {
                    offaddress = data['OfficialAddress'];
                  }
                  if (data.containsKey('Address')) {
                    homaddress = data['Address'];
                  }
                  if (data.containsKey('PhoneNumber')) {
                    pnumber = data['PhoneNumber'];
                  }
                });
              }
            }
          });
        }
      }
    }
  }

  HeaderWidget(int i, bool bool, IconData house_rounded) {}

  SelectedItem(BuildContext context, Object? item) {
    switch (item) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Driversearch()));
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MyApp()));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => history()));
        break;
    }
  }
}
