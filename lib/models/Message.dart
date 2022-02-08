import 'package:irone/models/doctor.dart';
import 'package:flutter/material.dart';

class Message with ChangeNotifier {
  final Doctor doctor;
  final String lastMessage;
  final String lastMsgTime;
  final bool isRead;

  Message(
      {required this.doctor,
      required this.lastMessage,
      required this.lastMsgTime,
      required this.isRead});
}

class Messages with ChangeNotifier {
  final List<Message> _items = [
    Message(
      doctor: Doctor(
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
      lastMessage: "You have to be more carefull...",
      lastMsgTime: "Just Now",
      isRead: false,
    ),
    Message(
      doctor: Doctor(
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
      lastMessage: "You: Thanks doctor...",
      lastMsgTime: "27 Oct",
      isRead: true,
    ),
    Message(
      doctor: Doctor(
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
      lastMessage: "You: Soon i will make an appointment...",
      lastMsgTime: "5 Oct",
      isRead: true,
    ),
    Message(
      doctor: Doctor(
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
      lastMessage: "Okay got it...",
      lastMsgTime: "1 Sep",
      isRead: true,
    ),
  ];
  List<Message> get items {
    return [..._items];
  }
}
