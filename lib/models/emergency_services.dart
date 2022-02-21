import 'package:flutter/material.dart';

class EmergencyService with ChangeNotifier {
  final String id;
  final String name;
  final String imgPath;

  EmergencyService({
    required this.id,
    required this.name,
    required this.imgPath,
  });

  factory EmergencyService.fromMap(id, map) {
    return EmergencyService(
      id: id,
      name: map['name'],
      imgPath: "assets/available-doctors/doctor-large-img.png",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imgPath': imgPath,
    };
  }
}

class EmergencyServices with ChangeNotifier {
  dynamic _items = [
    EmergencyService(
        id: "1",
        imgPath: "assets/emergency-services/psychologist.png",
        name: "Psychologist"),
    EmergencyService(
        id: "2",
        imgPath: "assets/emergency-services/opthalmologist.png",
        name: "Opthalmologist"),
    EmergencyService(
        id: "3",
        imgPath: "assets/emergency-services/dentists.png",
        name: "Dentists"),
    EmergencyService(
        id: "4",
        imgPath: "assets/emergency-services/cardiologist.png",
        name: "Cardiologist"),
    EmergencyService(
        id: "5",
        imgPath: "assets/emergency-services/nose-specialist.png",
        name: "Nose specialist"),
    EmergencyService(
        id: "6",
        imgPath: "assets/emergency-services/heart-specialist.png",
        name: "Heart specialist"),
    EmergencyService(
        id: "7",
        imgPath: "assets/emergency-services/pulmonologist.png",
        name: "Pulmonologist"),
    EmergencyService(
        id: "8",
        imgPath: "assets/emergency-services/hematologist.png",
        name: "Hematologist"),
    EmergencyService(
        id: "9",
        imgPath: "assets/emergency-services/hepatologist.png",
        name: "Hepatologist"),
    EmergencyService(
        id: "10",
        imgPath: "assets/emergency-services/pancreatigist.png",
        name: "Pancreatigist"),
    EmergencyService(
        id: "11",
        imgPath: "assets/emergency-services/nephrology.png",
        name: "Nephrology"),
    EmergencyService(
        id: "12",
        imgPath: "assets/emergency-services/gastrologist.png",
        name: "Gastrologist"),
  ];

  List<EmergencyService> get items {
    return [..._items];
  }

  void setEmergencyServices(dynamic services) {
    _items = services;

    notifyListeners();
  }
}
