import 'package:irone/config/app_config.dart';
import 'package:stacked/stacked.dart';

import '../screens/auth/signup_screen.dart';
import '../set_up.dart';
import '../utils/storage.dart';

class OnboardingViewModel extends BaseViewModel {
  int _screenStage = 1;

  final Storage _storage = serviceLocator<Storage>();

  int get screenStage => _screenStage;

  void nextScreen() {
    _screenStage++;
    notifyListeners();
  }

  void completeOnboarding() async {
    await _storage.setBool("completed_onboarding", true);

    AppConfigService.offAllNamed(SignupScreen.routeName);
  }
}
