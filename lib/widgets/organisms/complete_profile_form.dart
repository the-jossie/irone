import 'package:flutter/material.dart';
import 'package:irone/widgets/atoms/DateInput.dart';
import 'package:irone/widgets/atoms/input.dart';

class CompleteProfileForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController dobController;
  final TextEditingController heightController;
  final TextEditingController weightController;
  final TextEditingController bloodController;
  final DateTime selectedDate;
  final Function setSelectedDate;

  const CompleteProfileForm({
    Key? key,
    required this.formKey,
    required this.dobController,
    required this.heightController,
    required this.weightController,
    required this.bloodController,
    required this.selectedDate,
    required this.setSelectedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 43),
        child: Column(
          children: [
            // Input(
            //   text: "Date of Birth",
            //   textController: dobController,
            //   keyboardType: TextInputType.datetime,
            //   validator: (value) => value!.length < 2
            //       ? 'Name should be at least 2 chars long'
            //       : null,
            // ),
            DateInput(
              selectedDate: selectedDate,
              setSelectedDate: setSelectedDate,
              dateController: dobController,
            ),
            const SizedBox(height: 20),
            Input(
              text: "Height",
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              textController: heightController,
              validator: (value) => value!.length < 2
                  ? 'Name should be at least 2 chars long'
                  : null,
            ),
            const SizedBox(height: 20),
            Input(
              text: "Weight",
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              textController: weightController,
              validator: (value) => value!.length < 2
                  ? 'Name should be at least 2 chars long'
                  : null,
            ),
            const SizedBox(height: 20),
            Input(
              text: "Blood Type",
              keyboardType: TextInputType.text,
              textController: bloodController,
              validator: (value) => value!.length < 2
                  ? 'Name should be at least 2 chars long'
                  : null,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
