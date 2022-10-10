import 'package:flutter/material.dart';

import '/widgets/organisms/onboarding_layout.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = 'onboarding';
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int screenStage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(bottom: 10),
          child: screenStage == 2
              ? OnboardingLayout(
                  text1: "Find Trustworthy Health Information",
                  text2:
                      "You will get the most accurate information about any diseases from top-class doctors ",
                  image: "assets/woman-facing-right.png",
                  buttonText: 'Get Started',
                  buttonClick: () => Navigator.pushNamed(context, 'signup'),
                )
              : screenStage == 1
                  ? OnboardingLayout(
                      text1: "Get Instant Consult From Your Preferred Doctor",
                      text2:
                          "Now you can speak to your preferred doctor within 1 minute through chat/voice call/video call",
                      image: "assets/woman-facing-left.png",
                      buttonText: 'Get Started',
                      buttonClick: () {
                        setState(() {
                          screenStage = 2;
                        });
                      })
                  : Container(),
        ),
      ),
    );
  }
}
