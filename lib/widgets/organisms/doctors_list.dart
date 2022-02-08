import 'package:irone/models/doctor.dart';
import 'package:irone/widgets/molecules/doctor_tile.dart';
import 'package:flutter/material.dart';

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
