import '/widgets/atoms/Button.dart';
import 'package:flutter/material.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Button(
            buttonText: 'Book Appointment',
            buttonClick: () => {},
            loading: false,
          ),
        ],
      ),
    );
  }
}
