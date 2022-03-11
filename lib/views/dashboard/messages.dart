import 'package:irone/models/doctor.dart';
import 'package:irone/models/message.dart';
import 'package:irone/widgets/organisms/available_doctors_list.dart';
import 'package:irone/widgets/organisms/messages_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messages = Provider.of<Messages>(context);
    final messagesList = messages.items;
    final doctors = Provider.of<Doctors>(context);
    final doctorsList = doctors.items;

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 23, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AvailableDoctorsList(
              doctorsList: doctorsList,
            ),
            const SizedBox(height: 20),
            const Text(
              "All Messages",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            MessagesList(
              messagesList: messagesList,
            ),
          ],
        ),
      ),
    );
  }
}
