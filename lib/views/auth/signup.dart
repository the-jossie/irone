import 'package:flutter/material.dart';
import '/views/auth/login.dart';
import '/widgets/atoms/description_box.dart';
import '/widgets/atoms/logo_box.dart';
import '/widgets/organisms/signup_form.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 50, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const LogoBox(),
                const SizedBox(height: 36),
                Column(
                  children: [
                    const DescriptionBox(
                      title: "Create an account",
                      subTitle: "Start a healthy journey with us",
                    ),
                    const SizedBox(height: 29),
                    const SignupForm(),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, LoginScreen.routeName),
                          child: Text(
                            "Log in",
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
