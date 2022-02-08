import 'package:flutter/material.dart';

class Doctor {
  final String name;
  final List<String> specialty;
  final String bio;
  final String imgPath;
  final int stars;
  final int reviews;
  final int yearsOfExp;
  final bool isActive;

  Doctor({
    required this.name,
    required this.imgPath,
    required this.specialty,
    required this.bio,
    required this.stars,
    required this.reviews,
    required this.yearsOfExp,
    required this.isActive,
  });
}

class Doctors with ChangeNotifier {
  final List<Doctor> _items = [
    Doctor(
      imgPath: "assets/available-doctors/doctor-large-img.png",
      name: "Dr Rebbeka",
      specialty: ["Reproductive Psychiatry", "Psychiatry"],
      bio:
          "Dr. Rebbeka is a Clinical Professor of Psychiatry, Obstetrics, Gynecology, and Reproductive Science at the Icahn School of Medicine at Mount Sinai which she first joined in 2007. She is an Attending in Psychiatry at Mount Sinai Medical Center. She also maintains a private practice in New York City.",
      stars: 5,
      reviews: 220,
      yearsOfExp: 6,
      isActive: false,
    ),
    Doctor(
      imgPath: "assets/available-doctors/doctor-2.png",
      name: "Shari I. Lusskin, MD",
      specialty: ["Psychology", "TeleMedicine"],
      bio:
          "Dr. Rebbeka is a Clinical Professor of Psychiatry, Obstetrics, Gynecology, and Reproductive Science at the Icahn School of Medicine at Mount Sinai which she first joined in 2007. She is an Attending in Psychiatry at Mount Sinai Medical Center. She also maintains a private practice in New York City.",
      stars: 5,
      reviews: 330,
      yearsOfExp: 9,
      isActive: true,
    ),
    Doctor(
      imgPath: "assets/available-doctors/doctor-3.png",
      name: "Dr Rafsan Jany",
      specialty: ["Reproductive Psychiatry", "Psychiatry"],
      bio:
          "Dr. Rebbeka is a Clinical Professor of Psychiatry, Obstetrics, Gynecology, and Reproductive Science at the Icahn School of Medicine at Mount Sinai which she first joined in 2007. She is an Attending in Psychiatry at Mount Sinai Medical Center. She also maintains a private practice in New York City.",
      stars: 5,
      reviews: 110,
      yearsOfExp: 6,
      isActive: false,
    ),
    Doctor(
      imgPath: "assets/available-doctors/doctor-large-img.png",
      name: "Dr Fillmore",
      specialty: ["Psychology", "TeleMedicine"],
      bio:
          "Dr. Rebbeka is a Clinical Professor of Psychiatry, Obstetrics, Gynecology, and Reproductive Science at the Icahn School of Medicine at Mount Sinai which she first joined in 2007. She is an Attending in Psychiatry at Mount Sinai Medical Center. She also maintains a private practice in New York City.",
      stars: 5,
      reviews: 220,
      yearsOfExp: 9,
      isActive: true,
    ),
    Doctor(
      imgPath: "assets/available-doctors/doctor-5.png",
      name: "Dr. Bruce Scott Hoffman, PHD",
      specialty: ["Reproductive Psychiatry", "Psychiatry"],
      bio:
          "Dr. Rebbeka is a Clinical Professor of Psychiatry, Obstetrics, Gynecology, and Reproductive Science at the Icahn School of Medicine at Mount Sinai which she first joined in 2007. She is an Attending in Psychiatry at Mount Sinai Medical Center. She also maintains a private practice in New York City.",
      stars: 5,
      reviews: 330,
      yearsOfExp: 6,
      isActive: true,
    ),
    Doctor(
      imgPath: "assets/available-doctors/doctor-3.png",
      name: "Alnetta Hooper, PsyD",
      specialty: ["Psychology", "TeleMedicine"],
      bio:
          "Dr. Rebbeka is a Clinical Professor of Psychiatry, Obstetrics, Gynecology, and Reproductive Science at the Icahn School of Medicine at Mount Sinai which she first joined in 2007. She is an Attending in Psychiatry at Mount Sinai Medical Center. She also maintains a private practice in New York City.",
      stars: 5,
      reviews: 110,
      yearsOfExp: 9,
      isActive: false,
    ),
    Doctor(
      imgPath: "assets/available-doctors/doctor-4.png",
      name: "Dr. Kelly Geisler",
      specialty: ["Reproductive Psychiatry", "Psychiatry"],
      bio:
          "Dr. Rebbeka is a Clinical Professor of Psychiatry, Obstetrics, Gynecology, and Reproductive Science at the Icahn School of Medicine at Mount Sinai which she first joined in 2007. She is an Attending in Psychiatry at Mount Sinai Medical Center. She also maintains a private practice in New York City.",
      stars: 5,
      reviews: 220,
      yearsOfExp: 6,
      isActive: true,
    ),
    Doctor(
      imgPath: "assets/available-doctors/doctor-5.png",
      name: "Dr B. Sick",
      specialty: ["Psychology", "TeleMedicine"],
      bio:
          "Dr. Rebbeka is a Clinical Professor of Psychiatry, Obstetrics, Gynecology, and Reproductive Science at the Icahn School of Medicine at Mount Sinai which she first joined in 2007. She is an Attending in Psychiatry at Mount Sinai Medical Center. She also maintains a private practice in New York City.",
      stars: 5,
      reviews: 330,
      yearsOfExp: 9,
      isActive: false,
    ),
  ];
  List<Doctor> get items {
    return [..._items];
  }
}
