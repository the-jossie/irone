import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../views/auth/complete_profile_screen.dart';
import '../models/user_model.dart';

class AuthController {
  final _auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  void register({
    required GlobalKey<FormState> formKey,
    required Function setIsLoading,
    required Function setError,
    required bool isLoading,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String userType,
    required String error,
    required BuildContext context,
  }) async {
    if (formKey.currentState!.validate()) {
      setIsLoading(true);
      await _auth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) => {
                saveUserDetailsToFirestore(
                  setIsLoading: setIsLoading,
                  isLoading: isLoading,
                  firstName: firstName,
                  lastName: lastName,
                  context: context,
                  userType: userType,
                ),
              })
          .catchError((e) {
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
        setError(error);
        setIsLoading(false);
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

  saveUserDetailsToFirestore({
    required String firstName,
    required String lastName,
    required String userType,
    required BuildContext context,
    required bool isLoading,
    required Function setIsLoading,
  }) async {
    try {
      User? user = _auth.currentUser;

      UserModel userModel = UserModel(
        email: user?.email,
        userId: user?.uid,
        firstName: firstName,
        lastName: lastName,
        userType: userType,
      );

      userModel.email = user?.email;
      userModel.userId = user?.uid;
      userModel.firstName = firstName;
      userModel.lastName = lastName;
      userModel.userType = userType;

      await firebaseFirestore
          .collection("users")
          .doc(user?.uid)
          .set(userModel.toMap());

      Fluttertoast.showToast(msg: "Account created successfully!");

      Navigator.pushNamedAndRemoveUntil(
          context, CompleteProfileScreen.routeName, (route) => false);
    } catch (e) {
      setIsLoading(false);
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
