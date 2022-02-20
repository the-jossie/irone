import 'package:flutter/material.dart';
import '../atoms/password_input.dart';
import '../../controllers/auth.dart';
import '../atoms/button.dart';
import '../atoms/input.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _authController = AuthController();

  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isLoading = false;

  String userType = "patient";
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 43),
        child: Column(
          children: [
            Input(
              text: "First name",
              keyboardType: TextInputType.text,
              textController: firstNameController,
              validator: (value) => value!.length < 2
                  ? 'First name should be at least 2 chars long'
                  : null,
            ),
            const SizedBox(height: 29),
            Input(
              text: "Last name",
              keyboardType: TextInputType.text,
              textController: lastNameController,
              validator: (value) => value!.length < 2
                  ? 'Last name should be at least 2 chars long'
                  : null,
            ),
            const SizedBox(height: 29),
            Input(
              text: 'Email',
              keyboardType: TextInputType.emailAddress,
              textController: emailController,
              validator: (val) {
                return RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(val!)
                    ? null
                    : "Please provide a valid Email";
              },
            ),
            const SizedBox(height: 29),
            PasswordInput(
              text: "Password",
              passwordController: passwordController,
              validator: (value) =>
                  value!.length < 6 ? 'Password should be 6+ chars long' : null,
            ),
            const SizedBox(height: 29),
            PasswordInput(
              text: "Confirm Password",
              passwordController: confirmPasswordController,
              validator: (value) => value!.length < 6
                  ? 'Password should be 6+ chars long'
                  : value != passwordController.text
                      ? "Passwords do not match"
                      : null,
            ),
            const SizedBox(height: 36),
            Button(
              isLoading: isLoading,
              buttonText: 'Sign Up',
              buttonClick: () => _authController.register(
                  formKey: _formKey,
                  isLoading: isLoading,
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                  firstName: firstNameController.text.trim(),
                  lastName: lastNameController.text.trim(),
                  userType: userType,
                  error: error,
                  context: context,
                  setError: (String err) {
                    setState(() {
                      error = err;
                    });
                  },
                  setIsLoading: (bool value) {
                    setState(() {
                      isLoading = value;
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
