import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  List<Map<String, String>> _records = [];
  @override
  void initState() {
    getUser();
    super.initState();
  }

  Future getUser() async {
    if (_auth.currentUser != null) {
      var phoneNumber = _auth.currentUser!.phoneNumber;
      phoneNumber = '0' +
          _auth.currentUser!.phoneNumber!.substring(3, phoneNumber!.length);
      debugPrint(phoneNumber);

      if (_auth.currentUser != null) {
        await _firestore
            .collection('History')
            .where('Phone Number', isEqualTo: phoneNumber)
            .get()
            .then((result) {
          for (var i = 0; i < result.docs.length; i++) {
            var data = result.docs[i].data();
            _records.add({
              'DriverNIC': data['DriverNIC'],
              'PoliceNIC': data['PoliceNIC'],
              'Phone Number': data['Phone Number'],
              'Severity': data['Severity'],
              'Description': data['Description'],
            });
          }
          if (mounted) {
            setState(() {});
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
    int recordCount = 1;
    List<AccordionSection> accordionSections = [];
    for (var record in _records) {
      accordionSections.add(
        AccordionSection(
          isOpen: false,
          leftIcon: const Icon(Icons.food_bank, color: Colors.white),
          header: Text('Record $recordCount', style: _headerStyle),
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
                  label: Text(record['DriverNIC']!,
                      style: _contentStyle, textAlign: TextAlign.right)),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(Text('Police NIC',
                      style: _contentStyleHeader, textAlign: TextAlign.left)),
                  DataCell(Text(record['PoliceNIC']!, style: _contentStyle)),
                ],
              ),
              DataRow(cells: [
                DataCell(Text('Phone Number',
                    style: _contentStyleHeader, textAlign: TextAlign.left)),
                DataCell(
                  Text(record['Phone Number']!, style: _contentStyle),
                ),
              ]),
              DataRow(
                cells: [
                  DataCell(Text('Severity',
                      style: _contentStyleHeader, textAlign: TextAlign.left)),
                  DataCell(Text(record['Severity']!, style: _contentStyle)),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Description',
                      style: _contentStyleHeader, textAlign: TextAlign.left)),
                  DataCell(Text(record['Description']!, style: _contentStyle)),
                ],
              ),
            ],
          ),
        ),
      );
      recordCount++;
    }
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
        openAndCloseAnimation: true,
        headerPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
        sectionClosingHapticFeedback: SectionHapticFeedback.light,
        children: accordionSections,
      ),
    );
  }
}
