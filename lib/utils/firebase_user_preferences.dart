/*import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class firebaseUserPreferences {
  static late SharedPreferences _firebasepreferences;

  static const _keyfirebaseUser = 'firebaseUser';
  static var myfirebaseUser = firebaseUser(
    fullName: '',
    nic: '',
    address: '',
    dateofBirth: '',
    issuedDate: '',
    dateofExpiry: '',
    vehicleType: '',
    bloodGroup: '',
    password: '',
    confirmPassword: '',
    log: false,
  );

  static Future init() async =>
      _firebasepreferences = await SharedPreferences.getInstance();

  static Future setfirebaseUser(firebaseUser firebaseUser) async {
    final json = jsonEncode(firebaseUser.toJson());
    await _firebasepreferences.setString(_keyfirebaseUser, json);
  }

  static firebaseUser getfirebaseUser() {
    final json = _firebasepreferences.getString(_keyfirebaseUser);

    return json == null
        ? myfirebaseUser
        : firebaseUser.fromJson(jsonDecode(json));
  }
}

// firebaseUser calss

class firebaseUser {
  String fullName;
  String nic;
  String address;
  String dateofBirth;
  String issuedDate;
  String dateofExpiry;
  String vehicleType;
  String bloodGroup;
  String password;
  String confirmPassword;
  bool? log;

  firebaseUser({
    required this.fullName,
    required this.nic,
    required this.address,
    required this.dateofBirth,
    required this.issuedDate,
    required this.dateofExpiry,
    required this.vehicleType,
    required this.bloodGroup,
    required this.password,
    required this.confirmPassword,
    required this.log,
  });

  firebaseUser copy({
    String? fullName,
    String? nic,
    String? address,
    String? dateofBirth,
    String? issuedDate,
    String? dateofExpiry,
    String? vehicleType,
    String? bloodGroup,
    String? password,
    String? confirmPassword,
    bool? log,
  }) =>
      firebaseUser(
        fullName: fullName ?? this.fullName,
        nic: nic ?? this.nic,
        address: address ?? this.address,
        dateofBirth: dateofBirth ?? this.dateofBirth,
        issuedDate: issuedDate ?? this.issuedDate,
        dateofExpiry: dateofBirth ?? this.dateofExpiry,
        vehicleType: vehicleType ?? this.vehicleType,
        bloodGroup: bloodGroup ?? this.bloodGroup,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        log: log ?? this.log,
      );

  static firebaseUser fromJson(Map<String, dynamic> json) => firebaseUser(
        fullName: json["fullName"],
        nic: json["nic"],
        address: json["address"],
        dateofBirth: json["dateofBirth"],
        issuedDate: json["issuedDate"],
        dateofExpiry: json["dateofExpiry"],
        vehicleType: json["vehicleType"],
        bloodGroup: json["bloodGroup"],
        password: json['password'],
        confirmPassword: json["confirmPassword"],
        log: json['log'],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "nic": nic,
        "address": address,
        "dateOfBirth": dateofBirth,
        "issuedDate": issuedDate,
        "dateofExpiry": dateofExpiry,
        "vehicleType": vehicleType,
        "bloodGroup": bloodGroup,
        "password": password,
        "confirmPassword": confirmPassword,
        "log": log,
      };
}*/
