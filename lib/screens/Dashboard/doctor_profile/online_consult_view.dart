import 'package:flutter/material.dart';

import '/models/doctor.dart';
import '/screens/dashboard/chat_screen/index.dart';
import '/widgets/atoms/Button.dart';

class OnlineConsultView extends StatelessWidget {
  final Doctor doctor;
  const OnlineConsultView({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text(
          "You will get instant service from Dr Rebbeka",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        const Text(
          "Service charge:  \$49.00/hours",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        const Text(
          "Service: you will get instant consultation through chat/voice/video call ",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Button(
          buttonText: 'Get Instant Service',
          buttonClick: () => Navigator.pushNamed(
            context,
            ChatScreen.routeName,
            arguments: ChatScreenArguments(doctor: doctor),
          ),
          loading: false,
        ),
      ],
    );
  }
}
