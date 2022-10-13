import 'package:flutter/material.dart';
import 'package:irone/config/app_config.dart';
import 'package:irone/screens/auth/complete_service.dart';
import 'package:stacked/stacked.dart';

class CompleteProfileViewModelModel extends BaseViewModel {
  String _sex = "";
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _bloodController = TextEditingController();

  String get sex => _sex;
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get dobController => _dobController;
  TextEditingController get heightController => _heightController;
  TextEditingController get weightController => _weightController;
  TextEditingController get bloodController => _bloodController;

  void handleSexSelect(String value) {
    _sex = value;
    notifyListeners();
  }

  void handleFormSubmit() {
    AppConfigService.pushNamed(CompleteServiceScreen.routeName);
  }
}
