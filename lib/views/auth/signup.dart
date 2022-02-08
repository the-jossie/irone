import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../models/user_model.dart';
import '../../views/auth/complete_profile_screen.dart';
import '../../widgets/atoms/button.dart';
import '../../widgets/atoms/input.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = FirebaseAuth.instance;

  bool isLoading = false;
  bool _obscurePasswordText = true;
  bool _obscureConfirmPasswordText = true;
  String error = '';
  final _formKey = GlobalKey<FormState>();

  String userType = "patient";

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColor,
              ),
            )
          : SafeArea(
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
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24),
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
                            key: _formKey,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 43),
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
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      focusColor:
                                          Theme.of(context).primaryColor,
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
                                          _obscurePasswordText
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                        color: Theme.of(context).primaryColor,
                                        onPressed: () {
                                          setState(() {
                                            _obscurePasswordText =
                                                !_obscurePasswordText;
                                          });
                                        },
                                      ),
                                    ),
                                    obscureText: _obscurePasswordText,
                                    controller: passwordController,
                                    validator: (value) => value!.length < 6
                                        ? 'Password should be 6+ chars long'
                                        : null,
                                  ),
                                  const SizedBox(height: 29),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Confirm Password',
                                      focusColor:
                                          Theme.of(context).primaryColor,
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
                                          _obscureConfirmPasswordText
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                        color: Theme.of(context).primaryColor,
                                        onPressed: () {
                                          setState(() {
                                            _obscureConfirmPasswordText =
                                                !_obscureConfirmPasswordText;
                                          });
                                        },
                                      ),
                                    ),
                                    obscureText: _obscureConfirmPasswordText,
                                    controller: confirmPasswordController,
                                    validator: (value) => value!.length < 6
                                        ? 'Password should be 6+ chars long'
                                        : value != passwordController.text
                                            ? "Passwords do not match"
                                            : null,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 36),
                          Button(
                            buttonText: 'Sign Up',
                            buttonClick: () => register(),
                          ),
                          const SizedBox(height: 14),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account?"),
                              const SizedBox(width: 4),
                              GestureDetector(
                                onTap: () =>
                                    Navigator.pushNamed(context, '/login'),
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

  void register() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      await _auth
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then((value) => {
                saveUserDetailsToFirestore(),
              })
          .catchError((e) {
        setState(() {
          switch (e.code) {
            case "weak-password":
              error = "Password is too weak.";
              break;

            case "ERROR_INVALID_EMAIL":

            case "invalid-email":
              error = "Email address is invalid.";
              break;
            case "EMAIL_ALREADY_IN_USE":
            case "email-already-in-use":
              error = "Email already exist.";
              break;

            case "ERROR_TOO_MANY_REQUESTS":
              error = "Too many requests, try again later.";
              break;
            case "ERROR_OPERATION_NOT_ALLOWED":
            case "operation-not-allowed":
              error = "Server error, please try again later.";
              break;
            default:
              error = "Signup failed. Please try again.";
              break;
          }
          isLoading = false;
        });
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "Error",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              content: Text(error.toString()),
            );
          },
        );
        // Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  saveUserDetailsToFirestore() async {
    try {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = _auth.currentUser;

      UserModel userModel = UserModel(
        email: user?.email,
        userId: user?.uid,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        userType: userType,
      );

      userModel.email = user?.email;
      userModel.userId = user?.uid;
      userModel.firstName = firstNameController.text;
      userModel.lastName = lastNameController.text;
      userModel.userType = userType;

      await firebaseFirestore
          .collection("users")
          .doc(user?.uid)
          .set(userModel.toMap());

      Fluttertoast.showToast(msg: "Account created successfully!");

      Navigator.pushNamedAndRemoveUntil(
          context, CompleteProfileScreen.routeName, (route) => false);
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Error",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            content: const Text("Server error. Try again!"),
          );
        },
      );
    }
  }
}
