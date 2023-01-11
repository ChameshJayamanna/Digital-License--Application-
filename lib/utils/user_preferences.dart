/*import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static var myUser = User(
    fullName: "JMCT Jayamanna",
    nic: "200106301713",
    address: "19/9 b Kandy",
    dateofBirth: "2001-03-03",
    issuedDate: "2022-01-01",
    dateofExpiry: "2026-01-01",
    vehicleType: "GT123",
    bloodGroup: "O+",
    password: "Chamesh1234",
    confirmPassword: "Chamesh1234",
    loginState: false,
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());
    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}

// user calss

class User {
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
  bool loginState;

  User({
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
    required this.loginState,
  });

  User copy({
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
    bool? loginState,
  }) =>
      User(
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
        loginState: loginState ?? this.loginState,
      );

  static User fromJson(Map<String, dynamic> json) => User(
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
        loginState: json['loginState'],
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
        'loginState': loginState,
      };
}
*/