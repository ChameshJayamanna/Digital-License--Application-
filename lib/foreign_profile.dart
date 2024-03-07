import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/driver_his.dart';
import 'package:flutter_application_2/login_screen.dart';
import 'package:flutter_application_2/map.dart';
import 'package:flutter_application_2/roadrules.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
var fullName = '';
var nic = '';
var address = '';
var phoneNumber = '';
var dateofbirth = '';
var issuedDate = '';
var dateofexpiry = '';
var bloodGroup = '';
var vehicleType = '';

class Foreignprofile extends StatefulWidget {
  const Foreignprofile({super.key});

  /*@override
  State<StatefulWidget> createState() {
    return _ProfilepageState();
  }
}*/
  @override
  _ForeignprofileState createState() => _ForeignprofileState();
}

class _ForeignprofileState extends State<Foreignprofile> {
  @override
  void initState() {
    getUser();
    super.initState();
  }
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
                    color: Colors.black26, blurRadius: 6, offset: Offset(6, 6))
              ]),
          height: 60,
          child: Text(
            fullName,
            style: const TextStyle(color: Colors.black87),
          ),
        ),
      ],
    );
  }

  Widget buildNIC() {
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
            style: const TextStyle(color: Colors.black87),
          ),
        ),
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
                    color: Colors.black26, blurRadius: 6, offset: Offset(6, 6))
              ]),
          height: 60,
          child: Text(
            address,
            style: const TextStyle(color: Colors.black87),
          ),
        ),
      ],
    );
  }

  Widget buildBirthdate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Date of Birth',
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
            dateofbirth,
            style: const TextStyle(color: Colors.black87),
          ),
        ),
      ],
    );
  }

  Widget buildIssuedDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Date of Issued',
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
            issuedDate,
            style: const TextStyle(color: Colors.black87),
          ),
        ),
      ],
    );
  }

  Widget buildExpiryDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Date of Expiry',
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
            dateofexpiry,
            style: const TextStyle(color: Colors.black87),
          ),
        ),
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
                    color: Colors.black26, blurRadius: 6, offset: Offset(6, 6))
              ]),
          height: 60,
          child: Text(
            bloodGroup,
            style: const TextStyle(color: Colors.black87),
          ),
        ),
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
                    color: Colors.black26, blurRadius: 6, offset: Offset(6, 6))
              ]),
          height: 60,
          child: Text(
            vehicleType,
            style: const TextStyle(color: Colors.black87),
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
            onPressed: () => {
                  //sign out
                  signOut()
                },
            child: const Text('Sign out'))
      ],
    );
  }

  /* @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Welcome ' + fullName,
            style: TextStyle(fontSize: 20),
          ),
          Text('(cellnumber: ' +
              (_auth.currentUser!.phoneNumber ?? '') +
              ' uid:' +
              (_auth.currentUser!.uid != null ? _auth.currentUser!.uid : '') +
              ')'),
          ElevatedButton(
              onPressed: () => {
                    //sign out
                    signOut()
                  },
              child: Text('Sign out'))
        ],
      ),
    ));
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                child: Text(
                  "Road rules",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text(
                  "View map",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
            onSelected: (item) => SelectedItem(context, item),
          ),
        ],
        elevation: 0.5,
        iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 253, 252, 252)),
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
          SizedBox(
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
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: Offset(5, 5)),
                    ],
                  ),
                  child: const Icon(Icons.person,
                      size: 80, color: Color.fromARGB(255, 18, 17, 17)),
                ),
                const SizedBox(height: 20),
                Text(
                  'ID :${_auth.currentUser!.uid ?? ''}',
                  style: const TextStyle(
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
                        label: const Text('View history'),
                        icon: const Icon(Icons.history_rounded),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                                255, 30, 160, 241), //background color of button
                            //side: BorderSide(width:1, color:Color.fromARGB(255, 0, 0, 0)), //border width and color
                            elevation: 3, //elevation of button
                            shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.all(
                                20) //content padding inside button
                            ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Driverhis()));
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                buildFullname(),
                const SizedBox(height: 20),
                buildNIC(),
                const SizedBox(height: 20),
                buildAddress(),
                const SizedBox(height: 20),
                buildBirthdate(),
                const SizedBox(height: 20),
                buildIssuedDate(),
                const SizedBox(height: 20),
                buildExpiryDate(),
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

  Future getUser() async {
    if (_auth.currentUser != null) {
      var phoneNumber = _auth.currentUser!.phoneNumber;
      phoneNumber = '0${_auth.currentUser!.phoneNumber!.substring(3, phoneNumber!.length)}';
      debugPrint(phoneNumber);

      if (_auth.currentUser != null) {
        await _firestore
            .collection('Driver')
            .doc('Nativity')
            .collection('Foreign')
            .where('Phone Number', isEqualTo: phoneNumber)
            .get()
            .then((result) {
          //print("docs length: " + result.docs.length.toString());
          //print(result.docs.length);
          if (mounted) {
            if (result.docs.isNotEmpty) {
              setState(() {
                var data = result.docs[0].data();
                if (data.containsKey('FullName')) {
                  fullName = data['FullName'];
                }
                if (data.containsKey('NIC')) {
                  nic = data['NIC'];
                }
                if (data.containsKey('Address')) {
                  address = data['Address'];
                }
                if (data.containsKey('DateOfBirth')) {
                  dateofbirth = data['DateOfBirth'];
                }
                if (data.containsKey('IssuedDate')) {
                  issuedDate = data['IssuedDate'];
                }
                if (data.containsKey('DateofExpiry')) {
                  dateofexpiry = data['DateofExpiry'];
                }
                if (data.containsKey('BloodGroup')) {
                  bloodGroup = data['BloodGroup'];
                }
                if (data.containsKey('VehicleType')) {
                  vehicleType = data['VehicleType'];
                }
              });
            }
          }
        });
      }
    }
  }

  signOut() {
    //redirect
    _auth.signOut().then((value) => Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => const LoginScreen())));
  }

  /*void initState() {
    super.initState();
    user = UserPreferences.getUser();
  }*/
  HeaderWidget(int i, bool bool, IconData houseRounded) {}

  void SelectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Roadrules()));
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const MapScreen()));
        break;
    }
  }
}
