import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_application_2/nativity.dart';
import 'package:flutter_application_2/profile_page.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class sign extends StatefulWidget {
  _signState createState() => _signState();
}

//enum ButtonState { init, loading, done }
final _formKey = GlobalKey<FormState>();

class _signState extends State<sign> {
  final _formKeyOTP = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController otpController = new TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController dateController1 = TextEditingController();
  TextEditingController dateController2 = TextEditingController();

  var isLoading = false;
  var isResend = false;
  var isRegister = true;
  var isOTPScreen = false;
  var verificationCode = '';

  @override
  void initState() {
    dateController.text = ""; //set the initial value of text field
    super.initState();
  }

  DateTime selectedDate = DateTime.now();
  DateTime selectedDate1 = DateTime.now();
  DateTime selectedDate2 = DateTime.now();

  final _formKey = GlobalKey<FormState>();
  bool snapsnotExists = false;
  String _userName = '';
  String _userNIC = '';
  String _userPhone = '';
  String _userAddress = '';
  String _userBloodG = '';
  String _userVehicleT = '';
  String _password = '';
  String _confirmPassword = '';
  String _date1 = '';
  String _date2 = '';
  String _date3 = '';
  //ButtonState state = ButtonState.init;

  /* void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');

      debugPrint(_userName);
      debugPrint(_userNIC);
      debugPrint(_userAddress);
      debugPrint(_date1);
      debugPrint(_date2);
      debugPrint(_date3);
      debugPrint(_userBloodG);
      debugPrint(_userVehicleT);
      debugPrint(_password);
      debugPrint(_confirmPassword);

      /*print("created");

      final data = <String, dynamic>{
        "FullName": _userName,
        "NIC": _userNIC,
        "Address": _userAddress,
        "DateOfBirth": dateController,
        "IssuedDate": dateController1,
        "DateofExpiry": dateController2,
        "VehicleType": _userVehicleT,
        "BloodGroup": _userBloodG,
        "Password": _password,
        "ConfirmPassword": _confirmPassword
      };*/

      /*DocumentReference documentReference = FirebaseFirestore.instance
          .collection("Driver")
          .doc("Nativity")
          .collection("Local")
          .doc(_userNIC);

      Map<String, dynamic> drivers = {
        "FullName": _userName,
        "NIC": _userNIC,
        "Address": _userAddress,
        "DateOfBirth": dateController.text,
        "IssuedDate": dateController1.text,
        "DateofExpiry": dateController2.text,
        "VehicleType": _userVehicleT,
        "BloodGroup": _userBloodG,
        "Password": _password,
        "ConfirmPassword": _confirmPassword
      };

      documentReference.set(drivers).whenComplete(() {
        print("$_userName created");
      });
    }*/

      final fullName = _userName;
      final nic = _userNIC;
      final address = _userAddress;
      final dateofBirth = dateController.text;
      final issuedDate = dateController1.text;
      final dateofExpiry = dateController2.text;
      final vehicleType = _userVehicleT;
      final bloodGroup = _userBloodG;
      final password = _password;
      final confirmPassword = _confirmPassword;

      addUserToFirebase(
          fullName: fullName,
          nic: nic,
          address: address,
          dateofBirth: dateofBirth,
          issuedDate: issuedDate,
          dateofExpiry: dateofExpiry,
          vehicleType: vehicleType,
          bloodGroup: bloodGroup,
          password: password,
          confirmPassword: confirmPassword);
      print('done');
      print(_userNIC);

      /*AuthenticationHelper()
          .signUp(nic: _userNIC, password: _password)
          .then((result) {
        if (result == null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              result,
              style: TextStyle(fontSize: 16),
            ),
          ));
        }
      });*/
    }
  }*/

  /*getFullName(_userName) {
    this._userName = _userName;
  }

  getNIC(_userNIC) {
    this._userNIC = _userNIC;
  }

  getAddress(_userAddress) {
    this._userAddress = _userAddress;
  }

  getBloodGroup(_userBloodG) {
    this._userBloodG = _userBloodG;
  }

  getVehicleType(_userVehicleT) {
    this._userVehicleT = _userVehicleT;
  }

  getPassword(_password) {
    this._password = _password;
  }

  getConfirmPassword(_confirmPassword) {
    this._confirmPassword = _confirmPassword;
  }*/

  @override
  Widget build(BuildContext context) {
    return isOTPScreen ? returnOTPScreen() : registerScreen();
  }

  Widget registerScreen() {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_left_sharp),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Nativity()));
              },
            );
          },
        ),
      ),
      body: Container(
        color: Color.fromRGBO(177, 212, 224, 20),
        alignment: Alignment.center,
        child: Center(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Create an Account, Its free",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(
                                Icons.account_box,
                              ),
                              hintText: 'Full name',
                              hintStyle: TextStyle(
                                color: Colors.black38,
                              )),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          onChanged: (value) => _userName = value,
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(
                                Icons.account_box,
                              ),
                              hintText: 'NIC',
                              hintStyle: TextStyle(
                                color: Colors.black38,
                              )),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            if (value.trim().length < 10) {
                              return 'NIC must be at least 10 characters in length';
                            }
                            if (value.trim().length > 13) {
                              return 'NIC must be at most 12 characters in length';
                            }
                            // Return null if the entered username is valid
                            return null;
                          },
                          onChanged: (value) => _userNIC = value,
                        ),
                        const SizedBox(height: 15),

                        ///phone
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(
                                Icons.phone,
                              ),
                              hintText: 'Phone number',
                              hintStyle: TextStyle(
                                color: Colors.black38,
                              )),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          onChanged: (value) => _userPhone = value,
                        ),
                        const SizedBox(height: 15),

                        ///Address
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(
                                Icons.add_location_alt_outlined,
                              ),
                              hintText: 'Address',
                              hintStyle: TextStyle(
                                color: Colors.black38,
                              )),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          onChanged: (value) => _userAddress = value,
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller:
                              dateController, //editing controller of this TextField
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(
                                Icons.calendar_month_outlined,
                              ),
                              hintText: 'Birth date',
                              hintStyle: TextStyle(
                                color: Colors.black38,
                              )),
                          readOnly: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          onTap: () async {
                            final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: selectedDate,
                                firstDate: DateTime(1950, 8),
                                lastDate: DateTime(2040));
                            if (picked != null && picked != selectedDate) {
                              print(
                                  picked); //get the picked date in the format => 2022-07-04 00:00:00.000
                              String selectedDate = DateFormat('yyyy-MM-dd').format(
                                  picked); // format date in required form here we use yyyy-MM-dd that means time is removed
                              print(
                                  selectedDate); //formatted date output using intl package =>  2022-07-04
                              //You can format date as per your need

                              setState(() {
                                dateController.text =
                                    selectedDate; //set foratted date to TextField value.
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                          onChanged: (value) =>
                              _date1 = value, // when true user cannot edit text
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller:
                              dateController1, //editing controller of this TextField
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(
                                Icons.calendar_month_outlined,
                              ),
                              hintText: 'Issued date',
                              hintStyle: TextStyle(
                                color: Colors.black38,
                              )),
                          readOnly: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          onTap: () async {
                            final DateTime? picked1 = await showDatePicker(
                                context: context,
                                initialDate: selectedDate1,
                                firstDate: DateTime(1950, 8),
                                lastDate: DateTime(2040));
                            if (picked1 != null) {
                              print(
                                  picked1); //get the picked date in the format => 2022-07-04 00:00:00.000
                              String selectedDate1 = DateFormat('yyyy-MM-dd')
                                  .format(
                                      picked1); // format date in required form here we use yyyy-MM-dd that means time is removed
                              print(
                                  selectedDate1); //formatted date output using intl package =>  2022-07-04
                              //You can format date as per your need
                              setState(() {
                                dateController1.text =
                                    selectedDate1; //set foratted date to TextField value.
                              });
                            }
                          },
                          onChanged: (value) => _date2 = value,
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller:
                              dateController2, //editing controller of this TextField
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(
                                Icons.calendar_month_outlined,
                              ),
                              hintText: 'Expiry date',
                              hintStyle: TextStyle(
                                color: Colors.black38,
                              )),
                          readOnly: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          onTap: () async {
                            final DateTime? picked2 = await showDatePicker(
                                context: context,
                                initialDate: selectedDate2,
                                firstDate: DateTime(1950, 8),
                                lastDate: DateTime(2040));
                            if (picked2 != null) {
                              print(
                                  picked2); //get the picked date in the format => 2022-07-04 00:00:00.000
                              String selectedDate2 = DateFormat('yyyy-MM-dd')
                                  .format(
                                      picked2); // format date in required form here we use yyyy-MM-dd that means time is removed
                              print(
                                  selectedDate2); //formatted date output using intl package =>  2022-07-04
                              //You can format date as per your need

                              setState(() {
                                dateController2.text =
                                    selectedDate2; //set foratted date to TextField value.
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                          onChanged: (value) => _date3 = value,
                        ),
                        const SizedBox(height: 15),

                        ///blood group
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(
                                Icons.album_outlined,
                              ),
                              hintText: 'Blood group',
                              hintStyle: TextStyle(
                                color: Colors.black38,
                              )),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            // Return null if the entered username is valid
                            return null;
                          },
                          onChanged: (value) => _userBloodG = value,
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(
                                Icons.article_outlined,
                              ),
                              hintText: 'Vehicle type',
                              hintStyle: TextStyle(
                                color: Colors.black38,
                              )),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            // Return null if the entered username is valid
                            return null;
                          },
                          onChanged: (value) => _userVehicleT = value,
                        ),
                        const SizedBox(height: 15),

                        /// Password
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(
                                Icons.lock,
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: Colors.black38,
                              )),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            if (value.trim().length < 8) {
                              return 'Password must be at least 8 characters in length';
                            }
                            // Return null if the entered password is valid
                            return null;
                          },
                          onChanged: (value) => _password = value,
                        ),
                        const SizedBox(height: 15),

                        /// Confirm Password
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(
                                Icons.lock,
                              ),
                              hintText: 'Confirm password',
                              hintStyle: TextStyle(
                                color: Colors.black38,
                              )),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }

                            if (value != _password) {
                              return 'Confimation password does not match the entered password';
                            }

                            return null;
                          },
                          onChanged: (value) => _confirmPassword = value,
                        ),
                        const SizedBox(height: 15),
                        Container(
                            margin: EdgeInsets.only(top: 40, bottom: 5),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: new ElevatedButton(
                                  onPressed: () {
                                    if (!isLoading) {
                                      if (_formKey.currentState!.validate()) {
                                        // If the form is valid, we want to show a loading Snackbar
                                        setState(() {
                                          signUp();
                                          isRegister = false;
                                          isOTPScreen = true;
                                        });
                                      }
                                    }
                                  },
                                  child: new Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15.0,
                                      horizontal: 15.0,
                                    ),
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        new Expanded(
                                          child: Text(
                                            "Next",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))),
                      ],
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget returnOTPScreen() {
    return Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          title: Text('OTP Screen'),
        ),
        body: ListView(children: [
          Form(
            key: _formKeyOTP,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: Text(
                            !isLoading
                                ? "Enter OTP from SMS"
                                : "Sending OTP code SMS",
                            textAlign: TextAlign.center))),
                !isLoading
                    ? Container(
                        child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: TextFormField(
                          enabled: !isLoading,
                          controller: otpController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          initialValue: null,
                          autofocus: true,
                          decoration: InputDecoration(
                              labelText: 'OTP',
                              labelStyle: TextStyle(color: Colors.black)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter OTP';
                            }
                          },
                        ),
                      ))
                    : Container(),
                !isLoading
                    ? Container(
                        margin: EdgeInsets.only(top: 40, bottom: 5),
                        child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: new ElevatedButton(
                              onPressed: () async {
                                if (_formKeyOTP.currentState!.validate()) {
                                  // If the form is valid, we want to show a loading Snackbar
                                  // If the form is valid, we want to do firebase signup...
                                  setState(() {
                                    isResend = false;
                                    isLoading = true;
                                  });
                                  try {
                                    await _auth
                                        .signInWithCredential(
                                            PhoneAuthProvider.credential(
                                                verificationId:
                                                    verificationCode,
                                                smsCode: otpController.text
                                                    .toString()))
                                        .then((user) async => {
                                              //sign in was success
                                              if (user != null)
                                                {
                                                  //store registration details in firestore database
                                                  await _firestore
                                                      .collection('Driver')
                                                      .doc('Nativity')
                                                      .collection('Local')
                                                      .doc(_auth
                                                          .currentUser!.uid)
                                                      .set(
                                                          {
                                                        "FullName": _userName,
                                                        "NIC": _userNIC,
                                                        "Phone Number":
                                                            _userPhone,
                                                        "Address": _userAddress,
                                                        "DateOfBirth":
                                                            dateController.text,
                                                        "IssuedDate":
                                                            dateController1
                                                                .text,
                                                        "DateofExpiry":
                                                            dateController2
                                                                .text,
                                                        "VehicleType":
                                                            _userVehicleT,
                                                        "BloodGroup":
                                                            _userBloodG,
                                                        "Password": _password,
                                                        "ConfirmPassword":
                                                            _confirmPassword
                                                      },
                                                          SetOptions(
                                                              merge:
                                                                  true)).then(
                                                          (value) => {
                                                                //then move to authorised area
                                                                setState(() {
                                                                  isLoading =
                                                                      false;
                                                                  isResend =
                                                                      false;
                                                                })
                                                              }),

                                                  setState(() {
                                                    isLoading = false;
                                                    isResend = false;
                                                  }),
                                                  Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          Profilepage(),
                                                    ),
                                                    (route) => false,
                                                  )
                                                }
                                            })
                                        .catchError((error) => {
                                              setState(() {
                                                isLoading = false;
                                                isResend = true;
                                              }),
                                            });
                                    setState(() {
                                      isLoading = true;
                                    });
                                  } catch (e) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                }
                              },
                              child: new Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal: 15.0,
                                ),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Expanded(
                                      child: Text(
                                        "Submit",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                CircularProgressIndicator(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                )
                              ].where((c) => c != null).toList(),
                            )
                          ]),
                isResend
                    ? Container(
                        margin: EdgeInsets.only(top: 40, bottom: 5),
                        child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: new ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  isResend = false;
                                  isLoading = true;
                                });
                                await signUp();
                              },
                              child: new Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal: 15.0,
                                ),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Expanded(
                                      child: Text(
                                        "Resend Code",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )))
                    : Column()
              ],
            ),
          )
        ]));
  }

  Future signUp() async {
    {
      setState(() {
        isLoading = true;
      });

      var phoneNumber = '+94 ' + _userPhone;
      var verifyPhoneNumber = _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) {
          //auto code complete (not manually)
          _auth.signInWithCredential(phoneAuthCredential).then((user) async => {
                if (user != null)
                  {
                    //store registration details in firestore database
                    await _firestore
                        .collection('Driver')
                        .doc('Nativity')
                        .collection('Local')
                        .doc(_auth.currentUser!.uid)
                        .set({
                          "FullName": _userName,
                          "NIC": _userNIC,
                          "Phone Number": _userPhone,
                          "Address": _userAddress,
                          "DateOfBirth": dateController.text,
                          "IssuedDate": dateController.text,
                          "DateofExpiry": dateController2.text,
                          "VehicleType": _userVehicleT,
                          "BloodGroup": _userBloodG,
                          "Password": _password,
                          "ConfirmPassword": _confirmPassword
                        }, SetOptions(merge: true))
                        .then((value) => {
                              //then move to authorised area
                              setState(() {
                                isLoading = false;
                                isRegister = false;
                                isOTPScreen = false;

                                //navigate to is
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Profilepage(),
                                  ),
                                  (route) => false,
                                );
                              })
                            })
                        .catchError((onError) => {
                              debugPrint('Error saving user to db.' +
                                  onError.toString())
                            })
                  }
              });
        },
        verificationFailed: (FirebaseAuthException error) {
          debugPrint('Error logging in' + error.toString());
          setState(() {
            isLoading = false;
          });
        },
        codeSent: (verificationId, [forceResendingToken]) {
          setState(() {
            isLoading = false;
            verificationCode = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            isLoading = false;
            verificationCode = verificationId;
          });
        },
        timeout: Duration(seconds: 60),
      );

      await verifyPhoneNumber;
    }
  }
}


  /*Future readIDFromFireBase() async {
    try {
      //setState(() => state = ButtonState.loading);
      //print(state);
      final docUser = FirebaseFirestore.instance
          .collection("Driver")
          .doc("Nativity")
          .collection("Local")
          .doc(_userNIC);
      final snapshot = await docUser.get();
      if (snapshot.exists) {
        snapsnotExists = true;
      } else {
        snapsnotExists = false;
      }
      //setState(() => state = ButtonState.init);
    } on FirebaseException catch (e) {
      print(e);
      snapsnotExists = false;
      //state = ButtonState.init;
    }
  }*/

  /*Future addUserToFirebase(
      {required fullName,
      required nic,
      required address,
      required dateofBirth,
      required issuedDate,
      required dateofExpiry,
      required vehicleType,
      required bloodGroup,
      required password,
      required confirmPassword}) async {
    final docUser = FirebaseFirestore.instance
        .collection("Driver")
        .doc("Nativity")
        .collection("Local")
        .doc(nic);

    final json = {
      "log": true,
      "fullName": fullName,
      "nic": nic,
      "address": address,
      "dateOfBirth": dateofBirth,
      "issuedDate": issuedDate,
      "dateofExpiry": dateofExpiry,
      "vehicleType": vehicleType,
      "bloodGroup": bloodGroup,
      "password": password,
      "confirmPassword": confirmPassword
    };
    await docUser.set(json);
  }
}
*/