import 'package:flutter/material.dart';

class User {
  final String userName;
  final String bloodType;
  final double weight;
  final double height;
  final String dob;
  final String sex;
  final String profileImg;

  User({
    required this.bloodType,
    required this.weight,
    required this.height,
    required this.dob,
    required this.sex,
    required this.userName,
    required this.profileImg,
  });
}

class CurrentUser with ChangeNotifier {
  final User _user = User(
    userName: "Joe",
    bloodType: "B+",
    weight: 62,
    height: 158,
    dob: "07/1998",
    sex: "Male",
    profileImg: "assets/available-doctors/doctor-large-img.png",
  );

  User get user {
    return _user;
  }
}
