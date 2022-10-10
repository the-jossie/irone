import 'package:flutter/material.dart';
import 'package:irone/view_models/onboarding_view_model.dart';
import 'package:stacked/stacked.dart';

import '/widgets/organisms/onboarding_layout.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = 'onboarding';
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.reactive(
      viewModelBuilder: () => OnboardingViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: viewModel.screenStage == 2
                ? OnboardingLayout(
                    text1: "Find Trustworthy Health Information",
                    text2:
                        "You will get the most accurate information about any diseases from top-class doctors ",
                    image: "assets/woman-facing-right.png",
                    buttonText: 'Get Started',
                    buttonClick: viewModel.completeOnboarding,
                    skipBtnClick: viewModel.completeOnboarding,
                  )
                : viewModel.screenStage == 1
                    ? OnboardingLayout(
                        text1: "Get Instant Consult From Your Preferred Doctor",
                        text2:
                            "Now you can speak to your preferred doctor within 1 minute through chat/voice call/video call",
                        image: "assets/woman-facing-left.png",
                        buttonText: 'Get Started',
                        buttonClick: viewModel.nextScreen,
                        skipBtnClick: viewModel.completeOnboarding,
                      )
                    : Container(),
          ),
        ),
      ),
    );
  }
}
