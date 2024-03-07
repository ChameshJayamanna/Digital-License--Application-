import 'package:flutter/material.dart';
import 'package:flutter_application_2/police_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class history extends StatefulWidget {
  const history({super.key});

  @override
  State<StatefulWidget> createState() {
    return _historyState();
  }
}

TextEditingController _controller = TextEditingController();
Widget buildgetExpenses() {
  return ListView.builder(
    itemBuilder: (context, index) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(
                width: 1.0, style: BorderStyle.solid, color: Colors.white)),
        margin: const EdgeInsets.all(12.0),
        child: ListTile(
          onTap: () {},
          trailing: IconButton(
            icon: const Icon(Icons.arrow_drop_down_circle_sharp),
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

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "LOW", child: Text("LOW")),
      const DropdownMenuItem(value: "MEDIUM", child: Text("MEDIUM")),
      const DropdownMenuItem(value: "HIGH", child: Text("HIGH")),
    ];
    return menuItems;
  }

  /*final List<String> items = [
    'LOW',
    'MEDIUM',
    'HIGH',
  ];*/
  String? selectedValue;

  late String driverNIC, policeNIC, severity, description, mobile;

  getDriverNIC(driverNIC) {
    this.driverNIC = driverNIC;
  }

  getPoliceNIC(policeNIC) {
    this.policeNIC = policeNIC;
  }

  getDescription(description) {
    this.description = description;
  }

  getmobile(mobile) {
    this.mobile = mobile;
  }

  createData() {
    print("Submitted");

    final data = <String, dynamic>{
      "DriverNIC": driverNIC,
      "PoliceNIC": policeNIC,
      "Phone Number": mobile,
      "Severity": selectedValue,
      "Description": description,
    };

    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("History").doc();
    documentReference.set(data);

    Map<String, dynamic> drivers = {
      "DriverNIC": driverNIC,
      "PoliceNIC": policeNIC,
      "Phone Number": mobile,
      "Severity": selectedValue,
      "Description": description,
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
                        builder: (context) => const Policeprofile()));
              },
            );
          },
        ),
        title: const Text('History'),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        centerTitle: true,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor])),
        ),
      ),
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
                            child: const CircleAvatar(
                              backgroundColor: Colors.red,
                              child: Icon(Icons.close),
                            ),
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Driver NIC',
                                      labelText: 'Driver NIC',
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                    onChanged: (String driverNIC) {
                                      getDriverNIC(driverNIC);
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Police NIC',
                                      labelText: 'Police NIC',
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                    onChanged: (String policeNIC) {
                                      getPoliceNIC(policeNIC);
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Phone Number',
                                      labelText: 'Phone Number',
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                    onChanged: (String phnumber) {
                                      getmobile(phnumber);
                                    }),
                              ),
                              DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black38, width: 1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black38, width: 1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    prefixIcon: const Icon(Icons.article_outlined),
                                    hintText: 'SEVERITY',
                                    hintStyle: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black38,
                                    ),
                                  ),
                                  dropdownColor:
                                      const Color.fromARGB(255, 251, 252, 253),
                                  value: selectedValue,
                                  validator: (value) {
                                    if (value == null) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedValue = value!;
                                    });
                                  },
                                  items: dropdownItems),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Description',
                                      labelText: 'Description',
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                    onChanged: (String description) {
                                      getDescription(description);
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FloatingActionButton(
                                  child: const Text("Submit"),
                                  onPressed: () {
                                    setState(() {
                                      _controller.clear();
                                    });
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      createData();
                                      Navigator.of(context).pop();
                                    }
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
          child: const Icon(Icons.add)),
    );
  }
}

void getExpenses() {
  ListView.builder(
    itemBuilder: (context, index) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(
                width: 1.0, style: BorderStyle.solid, color: Colors.white)),
        margin: const EdgeInsets.all(12.0),
        child: ListTile(
          trailing: IconButton(
            icon: const Icon(Icons.arrow_drop_down_circle_sharp),
            color: Theme.of(context).primaryColorLight,
            onPressed: () {},
          ),
        ),
      );
    },
  );
}
