import 'package:flutter/material.dart';
import 'package:irone/models/doctor.dart';
import 'package:irone/services/doctor.dart';
import 'package:provider/provider.dart';

class DoctorController {
  final DoctorDatabaseClass doctorService = DoctorDatabaseClass();

  getAndPersistDoctors(BuildContext context) async {
    final doctorsList = Provider.of<Doctors>(context, listen: false);
    dynamic data = doctorService
        .getDoctors()
        .then((data) => {
              doctorsList.setDoctors(
                data.docs.map(
                  (data) => Doctor.fromMap(
                    data.data(),
                  ),
                ),
              ),
            })
        .catchError((onError) => null);
  }
}
