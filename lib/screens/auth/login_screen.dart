import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:irone/config/app_state.dart';
import 'package:stacked/stacked.dart';

import '/view_models/login_view_model.dart';
import '/widgets/atoms/button.dart';
import '/widgets/atoms/input.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 114, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                              "Welcome back",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 24),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "Log In to continue",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 60),
                      Form(
                        key: viewModel.formKey,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 43),
                          child: Column(
                            children: [
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
                                    onPressed: () {
                                      setState(() {
                                        viewModel.obscureText =
                                            !viewModel.obscureText;
                                      });
                                    },
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
                        buttonText: 'Log In',
                        buttonClick: () {},
                        loading: false,
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.black26,
                            height: 2,
                            width: 50,
                          ),
                          const SizedBox(width: 10),
                          const Text("Or continue with"),
                          const SizedBox(width: 10),
                          Container(
                            color: Colors.black54,
                            height: 2,
                            width: 50,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      IgnorePointer(
                        ignoring: viewModel.appState == AppState.loading,
                        child: ElevatedButton(
                          onPressed: viewModel.loginWithGoogle,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: const Size(100, 57),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                          child: viewModel.appState == AppState.loading
                              ? const CircularProgressIndicator.adaptive()
                              : SvgPicture.asset("assets/google.svg"),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text("Don't have an account?"),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'signup'),
                        child: Text(
                          "Register here",
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
