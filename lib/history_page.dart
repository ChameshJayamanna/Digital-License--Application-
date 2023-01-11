import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/profile_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class history extends StatefulWidget {
  const history({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _historyState();
  }
}

Widget buildgetExpenses() {
  return ListView.builder(
    itemBuilder: (context, index) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: new Border.all(
                width: 1.0, style: BorderStyle.solid, color: Colors.white)),
        margin: EdgeInsets.all(12.0),
        child: ListTile(
          onTap: () {},
          trailing: IconButton(
            icon: Icon(Icons.arrow_drop_down_circle_sharp),
            color: Theme.of(context).primaryColorLight,
            onPressed: () {},
          ),
        ),
      );
    },
  );
}

class _historyState extends State<history> {
  final _formKey = GlobalKey<FormState>();
  final List<String> items = [
    'LOW',
    'MEDIUM',
    'HIGH',
  ];
  String? selectedValue;

  late String driverNIC, policeNIC, severity, description;

  getDriverNIC(driverNIC) {
    this.driverNIC = driverNIC;
  }

  getPoliceNIC(policeNIC) {
    this.policeNIC = policeNIC;
  }

  getDescription(description) {
    this.description = description;
  }

  createData() {
    print("Submitted");

    final data = <String, dynamic>{
      "DriverNIC": driverNIC,
      "PoliceNIC": policeNIC,
      "Severity": selectedValue,
      "Description": description
    };

    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("History").doc();
    documentReference.set(data);

    Map<String, dynamic> drivers = {
      "DriverNIC": driverNIC,
      "PoliceNIC": policeNIC,
      "Severity": selectedValue,
      "Description": description
    };

    documentReference.set(drivers).whenComplete(() {
      print("Submitted Successfully");
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];
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

      /*  child: ListView.separated(
         padding: const EdgeInsets.all(10),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 25,
                  color: Colors.blue,
                  child: 
                  Text(
                    'Entry ${entries[index]}',
                     textAlign: TextAlign.left,  
                    ),
                );
              },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
         )
            */

      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Stack(
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        Positioned(
                          right: -40.0,
                          top: -40.0,
                          child: InkResponse(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: CircleAvatar(
                              child: Icon(Icons.close),
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Driver NIC',
                                      labelText: 'Driver NIC',
                                    ),
                                    onChanged: (String driverNIC) {
                                      getDriverNIC(driverNIC);
                                    }),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Police NIC',
                                      labelText: 'Police NIC',
                                    ),
                                    onChanged: (String policeNIC) {
                                      getPoliceNIC(policeNIC);
                                    }),
                              ),
                              Container(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    isExpanded: true,
                                    hint: Row(
                                      children: const [
                                        Icon(
                                          Icons.article_outlined,
                                          size: 16,
                                          color: Colors.black38,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'SEVERITY',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black38,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    items: items
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black38,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ))
                                        .toList(),
                                    value: selectedValue,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedValue = value as String;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                    ),
                                    iconSize: 15,
                                    iconEnabledColor: Colors.black38,
                                    iconDisabledColor: Colors.grey,
                                    buttonHeight: 50,
                                    buttonWidth: 200,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    buttonDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                    buttonElevation: 2,
                                    itemHeight: 40,
                                    itemPadding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    dropdownMaxHeight: 200,
                                    dropdownWidth: 200,
                                    dropdownPadding: null,
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9),
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                    dropdownElevation: 8,
                                    scrollbarRadius: const Radius.circular(40),
                                    scrollbarThickness: 6,
                                    scrollbarAlwaysShow: true,
                                    offset: const Offset(0, 2),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Description',
                                      labelText: 'Description',
                                    ),
                                    onChanged: (String description) {
                                      getDescription(description);
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FloatingActionButton(
                                  child: Text("Submit"),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      createData();
                                    }
                                    ;
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
          child: Icon(Icons.add)),
    );
  }
}

void getExpenses() {
  ListView.builder(
    itemBuilder: (context, index) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: new Border.all(
                width: 1.0, style: BorderStyle.solid, color: Colors.white)),
        margin: EdgeInsets.all(12.0),
        child: ListTile(
          trailing: IconButton(
            icon: Icon(Icons.arrow_drop_down_circle_sharp),
            color: Theme.of(context).primaryColorLight,
            onPressed: () {},
          ),
        ),
      );
    },
  );
}
