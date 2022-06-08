import 'package:irone/models/doctor.dart';
import 'package:flutter/material.dart';

class Appointment {
  final Doctor doctor;
  final String date;
  final String time;
  final bool isDone;

  Appointment(
      {required this.doctor,
      required this.date,
      required this.time,
      required this.isDone});
}

class Appointments with ChangeNotifier {
  final List<Appointment> _items = [
    Appointment(
      doctor: Doctor(
        id: '1',
        profileImg: "assets/available-doctors/doctor-large-img.png",
        lastName: "Dr Rebbeka",
        specialty: ["Reproductive Psychiatry", "Psychiatry"],
        bio:
            "Dr. Rebbeka is a Clinical Professor of Psychiatry, Obstetrics, Gynecology, and Reproductive Science at the Icahn School of Medicine at Mount Sinai which she first joined in 2007. She is an Attending in Psychiatry at Mount Sinai Medical Center. She also maintains a private practice in New York City.",
        stars: 5,
        reviews: 220,
        yearsOfExp: 6,
        isActive: false,
      ),
      date: "31 November 2020",
      time: "01.00",
      isDone: true,
    ),
    Appointment(
      doctor: Doctor(
        id: '2',
        profileImg: "assets/available-doctors/doctor-large-img.png",
        lastName: "Dr Rebbeka",
        specialty: ["Reproductive Psychiatry", "Psychiatry"],
        bio:
            "Dr. Rebbeka is a Clinical Professor of Psychiatry, Obstetrics, Gynecology, and Reproductive Science at the Icahn School of Medicine at Mount Sinai which she first joined in 2007. She is an Attending in Psychiatry at Mount Sinai Medical Center. She also maintains a private practice in New York City.",
        stars: 5,
        reviews: 220,
        yearsOfExp: 6,
        isActive: false,
      ),
      date: "31 November 2020",
      time: "01.00",
      isDone: true,
    ),
    Appointment(
      doctor: Doctor(
        id: '3',
        profileImg: "assets/available-doctors/doctor-large-img.png",
        lastName: "Dr Rebbeka",
        specialty: ["Reproductive Psychiatry", "Psychiatry"],
        bio:
            "Dr. Rebbeka is a Clinical Professor of Psychiatry, Obstetrics, Gynecology, and Reproductive Science at the Icahn School of Medicine at Mount Sinai which she first joined in 2007. She is an Attending in Psychiatry at Mount Sinai Medical Center. She also maintains a private practice in New York City.",
        stars: 5,
        reviews: 220,
        yearsOfExp: 6,
        isActive: false,
      ),
      date: "31 November 2020",
      time: "01.00",
      isDone: false,
    ),
    Appointment(
      doctor: Doctor(
        id: '4',
        profileImg: "assets/available-doctors/doctor-large-img.png",
        lastName: "Dr Rebbeka",
        specialty: ["Reproductive Psychiatry", "Psychiatry"],
        bio:
            "Dr. Rebbeka is a Clinical Professor of Psychiatry, Obstetrics, Gynecology, and Reproductive Science at the Icahn School of Medicine at Mount Sinai which she first joined in 2007. She is an Attending in Psychiatry at Mount Sinai Medical Center. She also maintains a private practice in New York City.",
        stars: 5,
        reviews: 220,
        yearsOfExp: 6,
        isActive: false,
      ),
      date: "31 November 2020",
      time: "01.00",
      isDone: false,
    )
  ];
  List<Appointment> get items {
    return [..._items];
  }
}
