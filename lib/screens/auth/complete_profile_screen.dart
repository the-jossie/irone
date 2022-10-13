import 'package:irone/view_models/complete_profile_view_model.dart';
import 'package:stacked/stacked.dart';

import '/widgets/atoms/Button.dart';
import '/widgets/atoms/Input.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatefulWidget {
  static const routeName = 'complete-profile';
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  _CompleteProfileScreenState createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CompleteProfileViewModelModel>.reactive(
      viewModelBuilder: () => CompleteProfileViewModelModel(),
      builder: (context, viewModel, child) => Scaffold(
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
                            "Let’s start with the basics",
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
                          GestureDetector(
                            onTap: () => viewModel.handleSexSelect("male"),
                            child: Container(
                              height: 38,
                              width: 133,
                              decoration: BoxDecoration(
                                  color: viewModel.sex == "male"
                                      ? const Color(0xffEF873D)
                                      : const Color(0xffF9F6F4),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                  child: Text(
                                "Male",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: viewModel.sex == "male"
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              )),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => viewModel.handleSexSelect("female"),
                            child: Container(
                              height: 38,
                              width: 133,
                              decoration: BoxDecoration(
                                  color: viewModel.sex == "female"
                                      ? const Color(0xffEF873D)
                                      : const Color(0xffF9F6F4),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: Text(
                                  "Female",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: viewModel.sex == "female"
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 29),
                    Form(
                      key: viewModel.formKey,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 43),
                        child: Column(
                          children: [
                            Input(
                              text: "Date of Birth",
                              textController: viewModel.dobController,
                              validator: (value) => value!.length < 2
                                  ? 'Name should be at least 2 chars long'
                                  : null,
                            ),
                            const SizedBox(height: 20),
                            Input(
                              text: "Height",
                              textController: viewModel.heightController,
                              validator: (value) => value!.length < 2
                                  ? 'Name should be at least 2 chars long'
                                  : null,
                            ),
                            const SizedBox(height: 20),
                            Input(
                              text: "Weight",
                              textController: viewModel.weightController,
                              validator: (value) => value!.length < 2
                                  ? 'Name should be at least 2 chars long'
                                  : null,
                            ),
                            const SizedBox(height: 20),
                            Input(
                              text: "Blood Type",
                              textController: viewModel.bloodController,
                              validator: (value) => value!.length < 2
                                  ? 'Name should be at least 2 chars long'
                                  : null,
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 36),
                    Button(
                      buttonText: 'Continue',
                      buttonClick: viewModel.handleFormSubmit,
                      loading: false,
                    ),
                    const SizedBox(height: 14),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
