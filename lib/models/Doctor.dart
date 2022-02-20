import 'package:flutter/material.dart';

class Doctor {
  final String lastName;
  final List<dynamic> specialty;
  final String bio;
  final String profileImg;
  final int stars;
  final int reviews;
  final int yearsOfExp;
  final bool isActive;

  Doctor({
    required this.lastName,
    required this.profileImg,
    required this.specialty,
    required this.bio,
    required this.stars,
    required this.reviews,
    required this.yearsOfExp,
    required this.isActive,
  });

  factory Doctor.fromMap(map) {
    return Doctor(
      lastName: map['lastName'],
      specialty: map['specialty'],
      bio: map['bio'],
      profileImg: "assets/available-doctors/doctor-large-img.png",
      stars: map['stars'],
      reviews: map['reviews'],
      yearsOfExp: map['yearsOfExp'],
      isActive: map['isActive'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lastName': lastName,
      'specialty': specialty,
      'profileImg': profileImg,
      'bio': bio,
      'stars': stars,
      'reviews': reviews,
      'yearsOfExp': yearsOfExp,
      'isActive': isActive,
    };
  }
}

class Doctors with ChangeNotifier {
  dynamic _items = [
    // Doctor(
    //   profileImg: "assets/available-doctors/doctor-large-img.png",
    //   lastName: "Dr Rebbeka",
    //   specialty: ["Reproductive Psychiatry", "Psychiatry"],
    //   bio:
    //       "Dr. Rebbeka is a Clinical Professor of Psychiatry, Obstetrics, Gynecology, and Reproductive Science at the Icahn School of Medicine at Mount Sinai which she first joined in 2007. She is an Attending in Psychiatry at Mount Sinai Medical Center. She also maintains a private practice in New York City.",
    //   stars: 5,
    //   reviews: 220,
    //   yearsOfExp: 6,
    //   isActive: false,
    // ),
    // Doctor(
    //   profileImg: "assets/available-doctors/doctor-2.png",
    //   lastName: "Shari I. Lusskin, MD",
    //   specialty: ["Psychology", "TeleMedicine"],
    //   bio:
    //       "Dr. Rebbeka is a Clinical Professor of Psychiatry, Obstetrics, Gynecology, and Reproductive Science at the Icahn School of Medicine at Mount Sinai which she first joined in 2007. She is an Attending in Psychiatry at Mount Sinai Medical Center. She also maintains a private practice in New York City.",
    //   stars: 5,
    //   reviews: 330,
    //   yearsOfExp: 9,
    //   isActive: true,
    // ),
    // Doctor(
    //   profileImg: "assets/available-doctors/doctor-3.png",
    //   lastName: "Dr Rafsan Jany",
    //   specialty: ["Reproductive Psychiatry", "Psychiatry"],
    //   bio:
    //       "Dr. Rebbeka is a Clinical Professor of Psychiatry, Obstetrics, Gynecology, and Reproductive Science at the Icahn School of Medicine at Mount Sinai which she first joined in 2007. She is an Attending in Psychiatry at Mount Sinai Medical Center. She also maintains a private practice in New York City.",
    //   stars: 5,
    //   reviews: 110,
    //   yearsOfExp: 6,
    //   isActive: false,
    // ),
    // Doctor(
    //   profileImg: "assets/available-doctors/doctor-large-img.png",
    //   lastName: "Dr Fillmore",
    //   specialty: ["Psychology", "TeleMedicine"],
    //   bio:
    //       "Dr. Rebbeka is a Clinical Professor of Psychiatry, Obstetrics, Gynecology, and Reproductive Science at the Icahn School of Medicine at Mount Sinai which she first joined in 2007. She is an Attending in Psychiatry at Mount Sinai Medical Center. She also maintains a private practice in New York City.",
    //   stars: 5,
    //   reviews: 220,
    //   yearsOfExp: 9,
    //   isActive: true,
    // ),
    // Doctor(
    //   profileImg: "assets/available-doctors/doctor-5.png",
    //   lastName: "Dr. Bruce Scott Hoffman, PHD",
    //   specialty: ["Reproductive Psychiatry", "Psychiatry"],
    //   bio:
    //       "Dr. Rebbeka is a Clinical Professor of Psychiatry, Obstetrics, Gynecology, and Reproductive Science at the Icahn School of Medicine at Mount Sinai which she first joined in 2007. She is an Attending in Psychiatry at Mount Sinai Medical Center. She also maintains a private practice in New York City.",
    //   stars: 5,
    //   reviews: 330,
    //   yearsOfExp: 6,
    //   isActive: true,
    // ),
    // Doctor(
    //   profileImg: "assets/available-doctors/doctor-3.png",
    //   lastName: "Alnetta Hooper, PsyD",
    //   specialty: ["Psychology", "TeleMedicine"],
    //   bio:
    //       "Dr. Rebbeka is a Clinical Professor of Psychiatry, Obstetrics, Gynecology, and Reproductive Science at the Icahn School of Medicine at Mount Sinai which she first joined in 2007. She is an Attending in Psychiatry at Mount Sinai Medical Center. She also maintains a private practice in New York City.",
    //   stars: 5,
    //   reviews: 110,
    //   yearsOfExp: 9,
    //   isActive: false,
    // ),
    // Doctor(
    //   profileImg: "assets/available-doctors/doctor-4.png",
    //   lastName: "Dr. Kelly Geisler",
    //   specialty: ["Reproductive Psychiatry", "Psychiatry"],
    //   bio:
    //       "Dr. Rebbeka is a Clinical Professor of Psychiatry, Obstetrics, Gynecology, and Reproductive Science at the Icahn School of Medicine at Mount Sinai which she first joined in 2007. She is an Attending in Psychiatry at Mount Sinai Medical Center. She also maintains a private practice in New York City.",
    //   stars: 5,
    //   reviews: 220,
    //   yearsOfExp: 6,
    //   isActive: true,
    // ),
    // Doctor(
    //   profileImg: "assets/available-doctors/doctor-5.png",
    //   lastName: "Dr B. Sick",
    //   specialty: ["Psychology", "TeleMedicine"],
    //   bio:
    //       "Dr. Rebbeka is a Clinical Professor of Psychiatry, Obstetrics, Gynecology, and Reproductive Science at the Icahn School of Medicine at Mount Sinai which she first joined in 2007. She is an Attending in Psychiatry at Mount Sinai Medical Center. She also maintains a private practice in New York City.",
    //   stars: 5,
    //   reviews: 330,
    //   yearsOfExp: 9,
    //   isActive: false,
    // ),
  ];
  List<Doctor> get items {
    return [..._items];
  }

  void setDoctors(dynamic doctors) {
    _items = doctors;

    notifyListeners();
  }
}
