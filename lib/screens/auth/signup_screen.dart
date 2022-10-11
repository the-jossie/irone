import 'package:irone/view_models/signup_view_model.dart';
import 'package:stacked/stacked.dart';

import '/widgets/atoms/Button.dart';
import '/widgets/atoms/Input.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = 'signup';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
      viewModelBuilder: () => SignupViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 50, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Container(
                      width: 173,
                      height: 173,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle),
                      child: const Center(
                        child: Text(
                          "iRone",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),
                  Column(
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
                              "Create an account",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 24),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "Start a healthy journey with us",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
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
                                text: "Name",
                                textController: viewModel.nameController,
                                validator: (value) => value!.length < 2
                                    ? 'Name should be at least 2 chars long'
                                    : null,
                              ),
                              const SizedBox(height: 29),
                              Input(
                                text: 'Email',
                                textController: viewModel.emailController,
                                validator: (val) {
                                  return RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(val!)
                                      ? null
                                      : "Please provide a valid Email";
                                },
                              ),
                              const SizedBox(height: 29),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  focusColor: Theme.of(context).primaryColor,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      viewModel.obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    color: Theme.of(context).primaryColor,
                                    onPressed: viewModel.toggleObscureText,
                                  ),
                                ),
                                obscureText: viewModel.obscureText,
                                controller: viewModel.passwordController,
                                validator: (value) => value!.length < 6
                                    ? 'Password should be 6+ chars long'
                                    : null,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 36),
                      Button(
                        buttonText: 'Sign Up',
                        buttonClick: viewModel.completeProfile,
                        loading: false,
                      ),
                      const SizedBox(height: 14),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'login'),
                        child: Text(
                          "Log in",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
