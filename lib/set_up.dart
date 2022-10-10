import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services/emergency_service.dart';
import 'utils/jwt_tokens.dart';
import 'utils/storage.dart';

final serviceLocator = GetIt.instance;

Future<void> setUpServiceLocator() async {
  final sharedInstance = await SharedPreferences.getInstance();

  serviceLocator.registerLazySingleton<SharedPreferences>(() => sharedInstance);

  serviceLocator.registerLazySingleton<GoogleSignIn>(
    () => GoogleSignIn(),
  );

  serviceLocator.registerLazySingleton<Storage>(
    () => Storage(),
  );

  serviceLocator.registerLazySingleton<JwtTokenUtil>(
    () => JwtTokenUtil(),
  );

  serviceLocator.registerLazySingleton<EmergencyService>(
    () => EmergencyService(),
  );
}
