import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserModel {
  String? userId;
  String? email;
  String? firstName;
  String? lastName;
  String? bloodType;
  String? weight;
  String? height;
  String? dob;
  String? sex;
  String? profileImg;
  String? userType;
  List<dynamic>? services;

  UserModel({
    this.userId,
    this.email,
    this.bloodType,
    this.weight,
    this.height,
    this.dob,
    this.sex,
    this.firstName,
    this.lastName,
    this.profileImg,
    this.userType,
    this.services,
  });

  factory UserModel.fromMap(map) {
    return UserModel(
      userId: map['userId'],
      email: map['email'],
      bloodType: map['bloodType'],
      weight: map['weight'],
      height: map['height'],
      dob: map['dob'],
      sex: map['sex'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      profileImg: map['profileImg'],
      userType: map['userType'],
      services: map['services'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      'bloodType': bloodType,
      'weight': weight,
      'height': height,
      'dob': dob,
      'sex': sex,
      'firstName': firstName,
      'lastName': lastName,
      'profileImg': profileImg,
      'userType': userType,
      'services': services,
    };
  }
}

class CurrentUser with ChangeNotifier {
  final firebaseUser = FirebaseAuth.instance.currentUser;

  late UserModel _user;

  UserModel get user {
    return _user;
  }

  void setCurrentUser(UserModel userData) {
    _user = userData;

    notifyListeners();
  }
}

  // final UserModel _user = UserModel(
  //   userId: "test-user",
  //   email: "ayanfe.dev@gmail.com",
  //   firstName: "Joe",
  //   lastName: "Biden",
  //   bloodType: "B+",
  //   weight: "62",
  //   height: "158",
  //   dob: "07/1998",
  //   sex: "Male",
  //   profileImg: "assets/available-doctors/doctor-large-img.png",
  //   userType: "patient",
  //   services: [
  //     "Psychologist",
  //     "Opthalmologist",
  //   ],
  // );
