import 'package:fluttertoast/fluttertoast.dart';
import '../auth/complete_service.dart';
import '../../widgets/organisms/complete_profile_form.dart';
import 'package:irone/widgets/atoms/button.dart';
import 'package:irone/widgets/atoms/gender_select.dart';
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
  TextEditingController dobController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController bloodController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.only(top: 114, bottom: 20),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 52, vertical: 14),
                    color: const Color(0xffF9F6F4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Complete your profile",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 24),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Let's start with the basics",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
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
