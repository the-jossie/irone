import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/appointment.dart';
import '/screens/dashboard/appointments_screen/appointments_list.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);
  static const routeName = 'appointments';

  @override
  Widget build(BuildContext context) {
    final appointments = Provider.of<Appointments>(context);
    final appointmentList = appointments.items;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xffF9F6F4),
              borderRadius: BorderRadius.circular(7),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        title: const Text("Appointments"),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 20),
            child: Column(
              children: [
                AppointmentsList(
                  title: "Upcoming Appointments",
                  appointmentList: appointmentList
                      .where((appointment) => !appointment.isDone)
                      .toList(),
                ),
                const SizedBox(height: 20),
                AppointmentsList(
                  title: "Past Appointments",
                  appointmentList: appointmentList
                      .where((appointment) => appointment.isDone)
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
