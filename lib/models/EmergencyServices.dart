import 'package:flutter/material.dart';

class EmergencyService with ChangeNotifier {
  final String name;
  final String imgPath;

  EmergencyService({
    required this.name,
    required this.imgPath,
  });
}

class EmergencyServices with ChangeNotifier {
  final List<EmergencyService> _items = [
    EmergencyService(
        imgPath: "assets/emergency-services/psychologist.png",
        name: "Psychologist"),
    EmergencyService(
        imgPath: "assets/emergency-services/opthalmologist.png",
        name: "Opthalmologist"),
    EmergencyService(
        imgPath: "assets/emergency-services/dentists.png", name: "Dentists"),
    EmergencyService(
        imgPath: "assets/emergency-services/cardiologist.png",
        name: "Cardiologist"),
    EmergencyService(
        imgPath: "assets/emergency-services/nose-specialist.png",
        name: "Nose specialist"),
    EmergencyService(
        imgPath: "assets/emergency-services/heart-specialist.png",
        name: "Heart specialist"),
    EmergencyService(
        imgPath: "assets/emergency-services/pulmonologist.png",
        name: "Pulmonologist"),
    EmergencyService(
        imgPath: "assets/emergency-services/hematologist.png",
        name: "Hematologist"),
    EmergencyService(
        imgPath: "assets/emergency-services/hepatologist.png",
        name: "Hepatologist"),
    EmergencyService(
        imgPath: "assets/emergency-services/pancreatigist.png",
        name: "Pancreatigist"),
    EmergencyService(
        imgPath: "assets/emergency-services/nephrology.png",
        name: "Nephrology"),
    EmergencyService(
        imgPath: "assets/emergency-services/gastrologist.png",
        name: "Gastrologist"),
  ];

  List<EmergencyService> get items {
    return [..._items];
  }
}
