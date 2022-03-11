import 'package:fluttertoast/fluttertoast.dart';
import '/widgets/atoms/button.dart';
import '/widgets/atoms/description_box.dart';
import '../auth/complete_service.dart';
import '../../widgets/organisms/complete_profile_form.dart';
import '../../widgets/atoms/gender_select.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatefulWidget {
  static const routeName = '/complete-profile';
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  _CompleteProfileScreenState createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  String sex = "";
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  TextEditingController dobController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController bloodController = TextEditingController();

  setSelectedDate(DateTime date) {
    setState(() {
      selectedDate = date;
      dobController.text = date.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.only(top: 114, bottom: 20),
              child: Column(
                children: [
                  const DescriptionBox(
                    title: "Complete your profile",
                    subTitle: "Let's start with the basics",
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Select Gender",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GenderSelect(
                          onClick: (value) => setState(() => {sex = value}),
                          value: "Male",
                          selectedValue: sex,
                        ),
                        GenderSelect(
                          onClick: (value) => setState(() => {sex = value}),
                          value: "Female",
                          selectedValue: sex,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 29),
                  CompleteProfileForm(
                    setSelectedDate: (DateTime date) => setSelectedDate(date),
                    selectedDate: selectedDate,
                    bloodController: bloodController,
                    dobController: dobController,
                    formKey: _formKey,
                    heightController: heightController,
                    weightController: weightController,
                  ),
                  const SizedBox(height: 36),
                  Button(
                    buttonText: 'Continue',
                    buttonClick: () => submit(),
                  ),
                  const SizedBox(height: 14),
                ],
              )),
        ),
      ),
    );
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      if (sex == "") {
        Fluttertoast.showToast(msg: "Please select gender!");
      } else {
        Navigator.pushNamed(
          context,
          CompleteServiceScreen.routeName,
          arguments: CompleteServiceScreenArguments(
            sex: sex,
            height: heightController.text,
            weight: weightController.text,
            bloodType: bloodController.text,
            dob: dobController.text,
          ),
        );
      }
    }
  }
}
