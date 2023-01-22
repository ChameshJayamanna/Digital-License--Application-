import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/driver_or_police.dart';
import 'package:flutter_application_2/police_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class policesignup extends StatefulWidget {
  const policesignup({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _policesignupState();
  }
}

final _formKey = GlobalKey<FormState>();

class _policesignupState extends State<policesignup> {
  final _formKeyOTP = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController otpController = new TextEditingController();

  var isLoading = false;
  var isResend = false;
  var isRegister = true;
  var isOTPScreen = false;
  var verificationCode = '';

  String _userName = '';
  String _userNIC = '';
  String _userPhone = '';
  String _userAddress = '';
  String _userOfAddress = '';
  String _userRank = '';
  String _password = '';
  String _confirmPassword = '';

  /*void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');

      debugPrint(_userName);
      debugPrint(_userNIC);
      debugPrint(_userAddress);
      debugPrint(_userOfAddress);
      debugPrint(_userPhone);
      debugPrint(_userRank);
      debugPrint(_password);
      debugPrint(_confirmPassword);

      /*print("created");

      final data = <String, dynamic>{
        "FullName": _userName,
        "NIC": _userNIC,
        "PhoneNumber": _userPhone,
        "Address": _userAddress,
        "OfficialAddress": _userOfAddress,
        "Rank": selectedValue,
        "Password": _password,
        "ConfirmPassword": _confirmPassword
      };*/

      DocumentReference documentReference = FirebaseFirestore.instance
          .collection("Police")
          .doc("Rank")
          .collection(selectedValue!)
          .doc(_userNIC);

      Map<String, dynamic> drivers = {
        "FullName": _userName,
        "NIC": _userNIC,
        "Address": _userAddress,
        "OfficialAddress": _userOfAddress,
        "PhoneNumber": _userPhone,
        "Rank": selectedValue,
        "Password": _password,
        "ConfirmPassword": _confirmPassword
      };

      documentReference.set(drivers).whenComplete(() {
        print("$_userName created");
      });
    }
  }*/

  /*getFullName(name) {
    this.fullName = name;
  }

  getNIC(nic) {
    this.nic = nic;
  }

  getAddress(address) {
    this.address = address;
  }

  getOfficialAddress(officialAddress) {
    this.officialAddress = officialAddress;
  }

  getPhoneNumber(phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

  getPassword(password) {
    this.password = password;
  }

  getConfirmPassword(confirmPassword) {
    this.confirmPassword = confirmPassword;
  }*/

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("AS"), value: "AS"),
      DropdownMenuItem(
          child: Text("Chief Inspector"), value: "Chief Inspector"),
      DropdownMenuItem(child: Text("DIG"), value: "DIG"),
      DropdownMenuItem(child: Text("IG"), value: "IG"),
      DropdownMenuItem(child: Text("Inspector"), value: "Inspector"),
      DropdownMenuItem(child: Text("PSClass1"), value: "PSClass1"),
      DropdownMenuItem(child: Text("PSClass2"), value: "PSClass2"),
      DropdownMenuItem(child: Text("PSClass3"), value: "PSClass3"),
      DropdownMenuItem(child: Text("PSClass4"), value: "PSClass4"),
      DropdownMenuItem(child: Text("SDIG"), value: "SDIG"),
      DropdownMenuItem(child: Text("SI"), value: "SI"),
      DropdownMenuItem(child: Text("SS"), value: "SS"),
      DropdownMenuItem(child: Text("Sergeant Major"), value: "Sergeant Major"),
      DropdownMenuItem(
          child: Text("Super Intendent"), value: "Super Intendent"),
      DropdownMenuItem(child: Text("Traffic"), value: "Traffic"),
    ];
    return menuItems;
  }

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return isOTPScreen ? returnOTPScreen() : registerscreeen();
  }

  Widget registerscreeen() {
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
                        builder: (context) => const Driverpolice()));
              },
            );
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Color.fromRGBO(177, 212, 224, 20),
        alignment: Alignment.center,
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
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            contentPadding: EdgeInsets.only(top: 14),
                            prefixIcon: Icon(Icons.phone_rounded),
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
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            contentPadding: EdgeInsets.only(top: 14),
                            prefixIcon: Icon(
                              Icons.add_location_alt_outlined,
                            ),
                            hintText: 'Official address',
                            hintStyle: TextStyle(
                              color: Colors.black38,
                            )),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        onChanged: (value) => _userOfAddress = value,
                      ),
                      const SizedBox(height: 15),

                      DropdownButtonFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black38, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black38, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(Icons.article_outlined),
                            hintText: 'Rank',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.black38,
                            ),
                          ),
                          dropdownColor: Color.fromARGB(255, 251, 252, 253),
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
                      const SizedBox(height: 15),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                                      .collection('Police')
                                                      .doc('Rank')
                                                      .collection(
                                                          selectedValue!)
                                                      .doc(_auth
                                                          .currentUser!.uid)
                                                      .set(
                                                          {
                                                        "FullName": _userName,
                                                        "NIC": _userNIC,
                                                        "PhoneNumber":
                                                            _userPhone,
                                                        "Address": _userAddress,
                                                        "OfficialAddress":
                                                            _userOfAddress,
                                                        "Rank": selectedValue,
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
                                                          Policeprofile(),
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
                        .collection('Police')
                        .doc('Rank')
                        .collection(selectedValue!)
                        .doc(_auth.currentUser!.uid)
                        .set({
                          "FullName": _userName,
                          "NIC": _userNIC,
                          "PhoneNumber": _userPhone,
                          "Address": _userAddress,
                          "OfficialAddress": _userOfAddress,
                          "Rank": selectedValue,
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
                                        Policeprofile(),
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

Widget makeInput({label, obsureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obsureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
        ),
      ),
      SizedBox(
        height: 30,
      )
    ],
  );
}
