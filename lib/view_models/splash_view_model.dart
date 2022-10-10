import 'package:irone/set_up.dart';
import 'package:stacked/stacked.dart';

import '../config/app_config.dart';
import '../screens/auth/login_screen.dart';
import '../screens/dashboard/index.dart';
import '../screens/onboarding/index.dart';
import '../utils/jwt_tokens.dart';
import '../utils/storage.dart';

class SplashViewModel extends BaseViewModel {
  final Storage _storage = serviceLocator<Storage>();

  final JwtTokenUtil _jwtTokenUtil = serviceLocator<JwtTokenUtil>();

  Future<void> init() async {
    final bool completedOnboarding =
        _storage.getBool("completed_onboarding") ?? false;

    final String? userToken = _storage.getString("token");

    await Future.delayed(const Duration(seconds: 4)).then((value) async {
      if (completedOnboarding) {
        if (_jwtTokenUtil.hasExpired(userToken)) {
          await _storage.removeKey("token");
          AppConfigService.offAllNamed(LoginScreen.routeName);
        } else {
          AppConfigService.offAllNamed(Dashlayout.routeName);
        }
      } else {
        AppConfigService.offAllNamed(OnboardingScreen.routeName);
      }
    });
  }
}
