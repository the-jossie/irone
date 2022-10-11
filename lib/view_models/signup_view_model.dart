import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '/config/app_config.dart';
import '/screens/auth/complete_profile_screen.dart';

class SignupViewModel extends BaseViewModel {
  bool _obscureText = true;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  GlobalKey<FormState> get formKey => _formKey;

  bool get obscureText => _obscureText;

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  void toggleObscureText() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  void completeProfile() {
    AppConfigService.pushNamed(CompleteProfileScreen.routeName);
  }
}
