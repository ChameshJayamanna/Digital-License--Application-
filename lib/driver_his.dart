import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter_application_2/profile_page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
var driverNIC = '';
var policeNIC = '';
var severity = '';
var description = '';
var phonumber = '';

class Driverhis extends StatefulWidget {
  const Driverhis({Key? key}) : super(key: key);

  @override
  State<Driverhis> createState() => _DriverhisState();
}

class _DriverhisState extends State<Driverhis> {
  @override
  void initState() {
    getUser();
    super.initState();
  }

  Future getUser() async {
    if (_auth.currentUser != null) {
      var phoneNumber = _auth.currentUser!.phoneNumber;
      phoneNumber =
          _auth.currentUser!.phoneNumber!.substring(3, phoneNumber!.length);
      debugPrint(phoneNumber);

      if (_auth.currentUser != null) {
        await _firestore
            .collection('History')
            .where('Phone Number', isEqualTo: phoneNumber)
            .get()
            .then((result) {
          //print("docs length: " + result.docs.length.toString());
          print(result.docs.length);
          if (mounted) {
            if (result.docs.length > 0) {
              setState(() {
                var data = result.docs[0].data();
                if (data.containsKey('DriverNIC')) {
                  driverNIC = data['DriverNIC'];
                }
                if (data.containsKey('PoliceNIC')) {
                  policeNIC = data['PoliceNIC'];
                }
                if (data.containsKey('Phone Number')) {
                  description = data['Phone Number'];
                }
                if (data.containsKey('Severity')) {
                  severity = data['Severity'];
                }
                if (data.containsKey('Description')) {
                  description = data['Description'];
                }
                if (data.containsKey('Phone Number')) {
                  phonumber = data['Phone Number'];
                }
              });
            }
          }
        });
      }
    }
  }

  final _headerStyle = const TextStyle(
      color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  final _contentStyleHeader = const TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  final _contentStyle = const TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
  @override
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
                        builder: (context) => const Profilepage()));
              },
            );
          },
        ),
        title: Text('History'),
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
      body: Accordion(
        maxOpenSections: 5,
        headerBackgroundColorOpened: Colors.black54,
        //scaleWhenAnimating: true,
        openAndCloseAnimation: true,
        headerPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
        sectionClosingHapticFeedback: SectionHapticFeedback.light,
        children: [
          AccordionSection(
            isOpen: false,
            leftIcon: const Icon(Icons.food_bank, color: Colors.white),
            header: Text('Record 01', style: _headerStyle),
            content: DataTable(
              sortAscending: true,
              sortColumnIndex: 1,
              dataRowHeight: 40,
              showBottomBorder: false,
              columns: [
                DataColumn(
                    label: Text('Driver NIC',
                        style: _contentStyleHeader, textAlign: TextAlign.left),
                    numeric: true),
                DataColumn(
                    label: Text(driverNIC,
                        style: _contentStyle, textAlign: TextAlign.right)),
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(Text('Police NIC',
                        style: _contentStyleHeader, textAlign: TextAlign.left)),
                    DataCell(Text(policeNIC, style: _contentStyle)),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Phone Number',
                        style: _contentStyleHeader, textAlign: TextAlign.left)),
                    DataCell(Text(phonumber, style: _contentStyle)),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Severity',
                        style: _contentStyleHeader, textAlign: TextAlign.left)),
                    DataCell(Text(severity, style: _contentStyle)),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Description',
                        style: _contentStyleHeader, textAlign: TextAlign.left)),
                    DataCell(Text(description, style: _contentStyle)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
