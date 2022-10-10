import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';

import '../config/app_config.dart';
import '../config/app_state.dart';
import '../screens/dashboard/index.dart';
import '../set_up.dart';
import '../utils/storage.dart';

class LoginViewModel extends BaseViewModel {
  AppState appState = AppState.none;
  bool obscureText = true;

  final Storage _storage = serviceLocator<Storage>();

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
    try {
      appState = AppState.loading;
      final googleUser = await _googleSignIn.signIn();

      if (googleUser == null) return;

      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      await _storage.setString("token", credential.idToken.toString());

      notifyListeners();

      AppConfigService.offAllNamed(Dashlayout.routeName);

      appState = AppState.none;
    } catch (e) {
      appState = AppState.none;
    }
  }
}
