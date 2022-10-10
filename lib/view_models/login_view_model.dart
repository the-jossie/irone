import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';

import '../config/app_config.dart';
import '../screens/dashboard/index.dart';
import '../set_up.dart';

class LoginViewModel extends BaseViewModel {
  bool obscureText = true;

  final GoogleSignIn _googleSignIn = serviceLocator<GoogleSignIn>();
  GoogleSignInAccount? _user;

  final formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  GoogleSignInAccount get user => _user!;

  Future loginWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();

    if (googleUser == null) return;

    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    notifyListeners();

    AppConfigService.offAllNamed(Dashlayout.routeName);
  }
}
