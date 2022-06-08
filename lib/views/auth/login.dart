import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:irone/shared/helper_functions.dart';
import '../../widgets/organisms/dash_layout.dart';
import '../../models/user_model.dart';
import '../../views/auth/complete_profile_screen.dart';
import '../../views/auth/signup.dart';
import '../../services/auth.dart';
import '../../widgets/atoms/button.dart';
import '../../widgets/atoms/input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool isLoading = false;
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();

  String userType = "patient";

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24),
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
                            key: _formKey,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 43),
                              child: Column(
                                children: [
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
                                          _obscureText
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                        color: Theme.of(context).primaryColor,
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                      ),
                                    ),
                                    obscureText: _obscureText,
                                    controller: passwordController,
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
                            buttonClick: () => loginWithCredentials(context),
                          ),
                          const SizedBox(height: 14),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, SignupScreen.routeName),
                            child: Text(
                              "create an Account",
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 40),
                          ElevatedButton(
                            onPressed: () => loginWithGoogle(context),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              minimumSize: const Size(250, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                            ),
                            child: Text(
                              "Google",
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  redirect(BuildContext ctx) {
    User? user = _auth.currentUser;
    final currentUser = Provider.of<CurrentUser>(ctx, listen: false);
    FirebaseFirestore.instance.collection("users").doc(user!.uid).get().then(
      (value) {
        if (value.exists) {
          currentUser.setCurrentUser(
            UserModel.fromMap(
              value.data(),
            ),
          );

          final loggedInUser = currentUser.user;

          HelperFunctions.saveUserIdSharedPreference(loggedInUser.userId!);
          HelperFunctions.saveUserLoggedInSharedPreference(true);

          if (loggedInUser.sex == null ||
              loggedInUser.dob == null ||
              loggedInUser.height == null ||
              loggedInUser.weight == null ||
              loggedInUser.bloodType == null ||
              loggedInUser.services == null ||
              loggedInUser.services!.isEmpty) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              CompleteProfileScreen.routeName,
              (route) => false,
            );
          } else {
            Fluttertoast.showToast(msg: "Welcome back!");
            Navigator.pushReplacementNamed(
              context,
              Dashlayout.routeName,
            );
          }
        } else {
          saveUserDetailsToFirestore();
        }
      },
    ).catchError((err) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: "An error occured. Try again!");
    });
  }

  loginWithGoogle(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    try {
      final provider = Provider.of<GoogleSignInProvider>(
        context,
        listen: false,
      );

      await provider.googleLogin(() => {
            redirect(context),
          });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: "Unable to login!");
    }
  }

  loginWithCredentials(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      await _auth
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((uid) => {
                redirect(context),
              })
          .catchError((e) {
        String error;
        switch (e.code) {
          case "ERROR_INVALID_EMAIL":
          case "invalid-email":
            error = "Email address is invalid.";
            break;
          case "ERROR_WRONG_PASSWORD":
          case "wrong-password":
            error = "Email/Password error.";
            break;
          case "ERROR_USER_NOT_FOUND":
          case "user-not-found":
            error = "No user found with this email.";
            break;
          case "ERROR_USER_DISABLED":
          case "user-disabled":
            error = "User account disabled.";
            break;
          case "ERROR_TOO_MANY_REQUESTS":
            error = "Too many requests, try again later.";
            break;
          case "ERROR_OPERATION_NOT_ALLOWED":
          case "operation-not-allowed":
            error = "Server error, please try again later.";
            break;
          default:
            error = "Login failed. Please try again.";
            break;
        }
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: error);
      });
    }
  }

  saveUserDetailsToFirestore() async {
    try {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = _auth.currentUser;
      UserModel userModel = UserModel();

      userModel.email = user!.email;
      userModel.userId = user.uid;
      userModel.firstName = user.displayName;
      userModel.userType = userType;

      await firebaseFirestore
          .collection("users")
          .doc(user.uid)
          .set(userModel.toMap());

      Navigator.pushNamedAndRemoveUntil(
          context, CompleteProfileScreen.routeName, (route) => false);
    } catch (e) {
      Fluttertoast.showToast(msg: "Server error. Try again!");
    }
  }
}
