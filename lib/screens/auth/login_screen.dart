import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../dashboard/index.dart';
import '/view_models/login_view_model.dart';
import '/widgets/atoms/Button.dart';
import '/widgets/atoms/Input.dart';

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
                        buttonText: 'Log In with Google',
                        buttonClick: () async {
                          await viewModel.loginWithGoogle();
                          Navigator.pushNamed(context, Dashlayout.routeName);
                        },
                      ),
                      const SizedBox(height: 14),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'signup'),
                        child: Text(
                          "create an Account",
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
