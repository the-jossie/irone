import 'package:flutter/material.dart';

import '/models/doctor.dart';
import '/widgets/molecules/doctor_tile.dart';

class DoctorsList extends StatelessWidget {
  final List<Doctor> doctorsList;
  const DoctorsList({Key? key, required this.doctorsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          doctorsList.map((doctor) => DoctorTile(doctor: doctor)).toList(),
    );
  }
}
