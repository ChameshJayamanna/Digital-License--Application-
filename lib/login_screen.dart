// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart'
    show
        Alignment,
        AnnotatedRegion,
        AppBar,
        BorderRadius,
        BoxDecoration,
        BoxShadow,
        BuildContext,
        ButtonStyle,
        Checkbox,
        CircularProgressIndicator,
        Color,
        Colors,
        Column,
        Container,
        CrossAxisAlignment,
        EdgeInsets,
        ElevatedButton,
        FlatButton,
        FontWeight,
        GestureDetector,
        IconButton,
        Icons,
        InkWell,
        InputBorder,
        InputDecoration,
        Key,
        LinearGradient,
        MainAxisAlignment,
        MaterialButton,
        MaterialPageRoute,
        MaterialStateProperty,
        Offset,
        OutlineInputBorder,
        RaisedButton,
        Scaffold,
        ScaffoldMessenger,
        ScaffoldState,
        SizedBox,
        SnackBar,
        Stack,
        State,
        StatefulWidget,
        Text,
        TextField,
        TextFormField,
        TextStyle,
        Theme,
        ThemeData,
        UnderlineInputBorder,
        Widget;
import 'package:flutter/services.dart';
import 'package:flutter_application_2/driver_or_police.dart';
import 'package:flutter_application_2/foreign_profile.dart';
import 'package:flutter_application_2/police_profile.dart';
import 'package:flutter_application_2/profile_page.dart';
import 'package:url_launcher/url_launcher.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//import 'package:flutter_application_2/utils/firebase_user_preferences.dart';
//import 'package:flutter_application_2/utils/user_preferences.dart';

class LoginScreen extends StatefulWidget {
  //new one
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

//enum ButtonState { init, loading, done }

class _LoginScreenState extends State<LoginScreen> {
  // final List<String> commonValues = ["AS", "Chief Inspector", "DIG","IG","Inspector","PSClass1","PSClass2","PSClass3","PSClass4"
  //,"SDIG","SI","SS","Sergeant Major","Super Intendent","Traffic"];

  /*late String nic, password;

  getNIC(nic) {
    this.nic = nic;
  }

  getPassword(password) {
    this.password = password;
  }*/

  /* _LoginScreenState() {
    signInOverFirestore(nic, password);
 }*/

  /* getDocuments() {
    

    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("User")
        .doc();
        
    Map<String, dynamic> drivers = {
      "NIC:":nic,
      "Password:":password
    };

    documentReference.set(drivers).whenComplete(() {
      print("$nic logged in");
    });
  }*/

  /* DocumentReference documentReference = FirebaseFirestore.instance
      .collection('Driver')
      .doc('Nativity')
      .collection('Local')
      .doc();
      
  Future<void> signInOverFirestore(String email, String password) async {
         documentReference
        .collection('Driver')
        .doc('Nativity')
        .collection('Local')
        .where('NIC', isEqualTo: nic)
        .where('Password', isEqualTo: password)
        .getDocuments() 
        .then((nic) {
      print('User on Firestore : $nic');
    }).catchError((e) {
      print('Error no document found');
    });
  }*/
/*DocumentReference documentReference = FirebaseFirestore.instance
          .collection("Driver")*/
  final _formKey = GlobalKey<FormState>();
  final _formKeyOTP = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController otpController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final passwordController = TextEditingController();
  String Password = '';
  bool isPasswordVisble = true;
  bool wrongPassowrd = false;
  bool wrongUser = false;

  var isLoading = false;
  var isResend = false;
  var isLoginScreen = true;
  var isOTPScreen = false;
  var verificationCode = '';

  @override
  void initState() {
    if (_auth.currentUser != null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const Profilepage(),
        ),
        (route) => false,
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return isOTPScreen ? returnOTPScreen() : returnLoginScreen();
  }

  Widget returnLoginScreen() {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('DEMOCRATIC SOCIALIST REPUBLIC OF SRI LANKA'),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        centerTitle: true,
      ),
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.blue.shade400,
            Colors.blue.shade200,
            Colors.blue.shade100,
          ])),
          child: ListView(children: [
            const SizedBox(
              height: 100,
            ),
            const Text(
              'Digital',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 42,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'License',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 42,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 80),
            Column(
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 10.0),
                          child: TextFormField(
                            enabled: !isLoading,
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              fillColor: Colors.black,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              contentPadding: const EdgeInsets.only(top: 14),
                              hintText: 'Enter your Phone number',
                              labelText: 'Phone Number',
                              prefixIcon: const Icon(
                                Icons.phone,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter phone number';
                              }
                              return null;
                            },
                          ),
                        )),
                        Container(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          child: TextFormField(
                            enabled: !isLoading,
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              fillColor: const Color.fromARGB(255, 18, 17, 17),
                              focusColor: Colors.black,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 10, 10, 10))),
                              contentPadding: const EdgeInsets.only(top: 14),
                              hintText: 'Enter your password',
                              labelText: 'Password',
                              // errorText: 'Password wrong',
                              prefixIcon: const Icon(
                                Icons.lock,
                              ),
                              suffixIcon: passwordController.text.isEmpty
                                  ? Container(width: 0)
                                  : IconButton(
                                      icon: isPasswordVisble
                                          ? const Icon(
                                              Icons.visibility_off_rounded,
                                              color: Color.fromARGB(
                                                  255, 24, 23, 23),
                                            )
                                          : const Icon(
                                              Icons.visibility,
                                              color: Color.fromARGB(
                                                  255, 33, 33, 33),
                                            ),
                                      onPressed: () => setState(() =>
                                          isPasswordVisble = !isPasswordVisble),
                                    ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.done,
                            obscureText: isPasswordVisble,
                          ),
                        )),
                        Container(
                            margin: const EdgeInsets.only(top: 20, bottom: 5),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: !isLoading
                                    ? ElevatedButton(
                                        onPressed: () async {
                                          if (!isLoading) {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              displaySnackBar('Please wait...');
                                              await login();
                                            }
                                          }
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  const Color.fromARGB(
                                                      235, 0, 123, 168)),
                                        ),
                                        child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 15.0,
                                              horizontal: 15.0,
                                            ),
                                            width: 120,
                                            height: 55,
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Expanded(
                                                    child: Text(
                                                  "Login",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 255, 250, 250),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                              ],
                                            )),
                                      )
                                    : const CircularProgressIndicator(
                                        backgroundColor:
                                            Color.fromARGB(26, 9, 13, 14),
                                      ))),
                        Container(
                            margin: const EdgeInsets.only(top: 15, bottom: 5),
                            alignment: AlignmentDirectional.center,
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Text("No Account ?",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 18,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      InkWell(
                                        child: const Text('Sign up',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        onTap: () => {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Driverpolice()))
                                        },
                                      ),
                                    ]))),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: InkWell(
                              child: const Text(
                                'Click here for medical bookings.',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              onTap: () => launch(
                                  'https://echannelling.com/Echannelling/ntmi-channel')),
                        )
                      ],
                    ))
              ],
            )
          ])),
    );
  }

  /*@override
  Widget build(BuildContext context) {
   // bool isStretched = state == ButtonState.init;
    //bool isDone = state == ButtonState.done;
    return Scaffold(
      appBar: AppBar(
        title: const Text('DEMOCRATIC SOCIALIST REPUBLIC OF SRI LANKA'),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        centerTitle: true,
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(children: <Widget>[
            Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0x66a9c3f9),
                      Color.fromARGB(153, 73, 123, 231),
                      Color.fromARGB(204, 37, 89, 201),
                      Color.fromARGB(255, 10, 43, 112),
                    ])),
                child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 120),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Licence app',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 44,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Sign In',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 44,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 30),
                          makeIdTextField(),
                          const SizedBox(height: 20),
                          makePasswordTextField(),
                          const SizedBox(height: 20),
                          Hero(
                              transitionOnUserGestures: true,
                              tag: 'LOGIN',
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                                width: state == ButtonState.init
                                    ? MediaQuery.of(context).size.width
                                    : 70,
                                height: 60,
                                child: isStretched
                                    ? buildLoginBtn(),
                                  
                              )),
                          buildRemember(),
                          buildPoliceloginBtn(),
                          buildSignUp(),
                        ])))
          ]),
        ),
      ),
    );
  }
*/

  Widget returnOTPScreen() {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('OTP Screen'),
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
                          decoration: const InputDecoration(
                              labelText: 'OTP',
                              labelStyle: TextStyle(color: Colors.black)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter OTP';
                            }
                            return null;
                          },
                        ),
                      ))
                    : Container(),
                !isLoading
                    ? Container(
                        margin: const EdgeInsets.only(top: 40, bottom: 5),
                        child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: ElevatedButton(
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
                                              {
                                                //store registration details in firestore database
                                                setState(() {
                                                  isLoading = false;
                                                  isResend = false;
                                                }),
                                                if (isValidUser)
                                                  {
                                                    Navigator
                                                        .pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            const Profilepage(), //profile
                                                      ),
                                                      (route) => false,
                                                    )
                                                  }
                                                else if (isValidUser1)
                                                  {
                                                    Navigator
                                                        .pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            const Foreignprofile(),
                                                      ),
                                                      (route) => false,
                                                    ),
                                                  }
                                                else
                                                  {
                                                    Navigator
                                                        .pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            const Policeprofile(),
                                                      ),
                                                      (route) => false,
                                                    ),
                                                  }
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
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal: 15.0,
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
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
                        margin: const EdgeInsets.only(top: 40, bottom: 5),
                        child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  isResend = false;
                                  isLoading = true;
                                });
                                await login();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal: 15.0,
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        "Resend Code",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )))
                    : const Column()
              ],
            ),
          )
        ]));
  }

  displaySnackBar(text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  var isValidUser = false;
  var isValidUser1 = false;
  var isValidUser2 = false;

  Future login() async {
    setState(() {
      isLoading = true;
    });

    var phoneNumber = '+94 ${phoneController.text.trim()}';

    //first we will check if a user with this cell number exists

    var number = phoneController.text.trim();
    var password = passwordController.text.trim();
    //var password = passwordController.text.trim();

    await _firestore
        .collection('Driver')
        .doc('Nativity')
        .collection('Local')
        .where('Phone Number', isEqualTo: number)
        .where('Password', isEqualTo: password)
        .get() //.where('Password', isEqualTo:  password)
        .then((result) async {
      if (result.docs.isNotEmpty) {
        isValidUser = true;
      } else {
        // Data is not present in 'Local' collection.
        // Check 'Non-Local' collection for the data.
        await _firestore
            .collection('Driver')
            .doc('Nativity')
            .collection('Foreign')
            .where('Phone Number', isEqualTo: number)
            .where('Password', isEqualTo: password)
            .get()
            .then((result) async {
          if (result.docs.isNotEmpty) {
            isValidUser1 = true;
          } else {
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
              // Data is not present in 'Local' collection.
              // Check 'Non-Local' collection for the data.
              await _firestore
                  .collection('Police')
                  .doc('Rank')
                  .collection(collectionName)
                  .where('PhoneNumber', isEqualTo: number)
                  .where('Password', isEqualTo: password)
                  .get()
                  .then((result) async {
                if (result.docs.isNotEmpty) {
                  isValidUser2 = true;
                }
              });
            }
          }
        });
      }
    });

    if (isValidUser) {
      //ok, we have a valid user, now lets do otp verification
      var verifyPhoneNumber = _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) {
          //auto code complete (not manually)
          _auth.signInWithCredential(phoneAuthCredential).then((user) async => {
                {
                  //redirect
                  setState(() {
                    isLoading = false;
                    isOTPScreen = false;
                  }),
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const Profilepage(),
                    ),
                    (route) => false,
                  )
                }
              });
        },
        verificationFailed: (FirebaseAuthException error) {
          displaySnackBar('Validation error, please try again later');
          setState(() {
            isLoading = false;
          });
        },
        codeSent: (verificationId, [forceResendingToken]) {
          setState(() {
            isLoading = false;
            verificationCode = verificationId;
            isOTPScreen = true;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            isLoading = false;
            verificationCode = verificationId;
          });
        },
        timeout: const Duration(seconds: 60),
      );
      await verifyPhoneNumber;
    } else if (isValidUser1) {
      //ok, we have a valid user, now lets do otp verification
      var verifyPhoneNumber = _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) {
          //auto code complete (not manually)
          _auth.signInWithCredential(phoneAuthCredential).then((user) async => {
                {
                  //redirect
                  setState(() {
                    isLoading = false;
                    isOTPScreen = false;
                  }),
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const Foreignprofile(),
                    ),
                    (route) => false,
                  )
                }
              });
        },
        verificationFailed: (FirebaseAuthException error) {
          displaySnackBar('Validation error, please try again later');
          setState(() {
            isLoading = false;
          });
        },
        codeSent: (verificationId, [forceResendingToken]) {
          setState(() {
            isLoading = false;
            verificationCode = verificationId;
            isOTPScreen = true;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            isLoading = false;
            verificationCode = verificationId;
          });
        },
        timeout: const Duration(seconds: 60),
      );
      await verifyPhoneNumber;
    } else if (isValidUser2) {
      //ok, we have a valid user, now lets do otp verification
      var verifyPhoneNumber = _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) {
          //auto code complete (not manually)
          _auth.signInWithCredential(phoneAuthCredential).then((user) async => {
                {
                  //redirect
                  setState(() {
                    isLoading = false;
                    isOTPScreen = false;
                  }),
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const Policeprofile(),
                    ),
                    (route) => false,
                  )
                }
              });
        },
        verificationFailed: (FirebaseAuthException error) {
          displaySnackBar('Validation error, please try again later');
          setState(() {
            isLoading = false;
          });
        },
        codeSent: (verificationId, [forceResendingToken]) {
          setState(() {
            isLoading = false;
            verificationCode = verificationId;
            isOTPScreen = true;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            isLoading = false;
            verificationCode = verificationId;
          });
        },
        timeout: const Duration(seconds: 60),
      );
      await verifyPhoneNumber;
    } else {
      //non valid user
      setState(() {
        isLoading = false;
      });
      displaySnackBar(
          'Number or Password not found, please sign up first'); //else (incorrect password)
    }
  }
}

  /*Widget bulidLoadingButton(bool isDone) {
    final color = isDone ? Colors.green : Color.fromARGB(255, 50, 50, 50);
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Center(
        child: isDone
            ? Icon(
                Icons.done,
                color: Colors.white,
                size: 35,
              )
            : CircularProgressIndicator(
                color: Colors.white,
              ),
      ),
    );
  }
}*/