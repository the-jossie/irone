import 'package:irone/widgets/atoms/button.dart';
import 'package:flutter/material.dart';

class OnboardingLayout extends StatelessWidget {
  final String text1;
  final String text2;
  final String image;
  final String buttonText;
  final Function buttonClick;

  const OnboardingLayout({
    Key? key,
    required this.text1,
    required this.text2,
    required this.image,
    required this.buttonText,
    required this.buttonClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 39, vertical: 48),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/signup'),
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff2b67f6)),
                  ),
                )
              ],
            ),
            const SizedBox(height: 35),
            Text(
              text1,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Text(
              text2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      Flexible(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
            ),
          ),
        ),
      ),
      Button(
        buttonText: buttonText,
        buttonClick: buttonClick,
      )
    ]);
  }
}
