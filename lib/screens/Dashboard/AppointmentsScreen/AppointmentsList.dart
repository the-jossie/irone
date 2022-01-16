import 'package:irone/screens/Dashboard/AppointmentsScreen/AppointmentTile.dart';
import 'package:flutter/material.dart';

class AppointmentsList extends StatelessWidget {
  final String title;
  final List appointmentList;

  const AppointmentsList(
      {Key? key, required this.appointmentList, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: appointmentList
              .map((appointment) => AppointmentTile(
                    appointment: appointment,
                  ))
              .toList(),
        ),
      ],
    );
  }
}
