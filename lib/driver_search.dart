import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/foreign_profile.dart';
import 'package:flutter_application_2/profile_page.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

class Driversearch extends StatefulWidget {
  const Driversearch({Key? key}) : super(key: key);

  @override
  _DriversearchState createState() => _DriversearchState();
}

class _DriversearchState extends State<Driversearch> {
  TextEditingController seachtf = TextEditingController();
  List<QueryDocumentSnapshot> documents = [];

  @override
  void initState() {
    super.initState();
    _getDriver();
  }

  Future<void> _getDriver() async {
    final QuerySnapshot collection1 = await _firestore
        .collection("Driver")
        .doc("Nativity")
        .collection("Local")
        .get();
    final QuerySnapshot collection2 = await _firestore
        .collection("Driver")
        .doc("Nativity")
        .collection("Foreign")
        .get();

    documents.addAll(collection1.docs);
    documents.addAll(collection2.docs);
    setState(() {});
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
                  Navigator.pop(context);
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
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 10,
              ),
              child: TextField(
                controller: seachtf,
                decoration: InputDecoration(
                  hintText: 'Search by NIC',
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: documents.length,
                itemBuilder: (BuildContext context, int index) {
                  final doc = documents[index];
                  if (doc.get('NIC') == seachtf.text) {
                    return ListTile(
                      title: Text(doc.get('NIC')),
                      subtitle: Text(doc.get('FullName')),
                      onTap: () async {
                        if (doc.reference.path.contains("Local")) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profilepage()));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Foreignprofile()));
                        }
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ));
  }
}
