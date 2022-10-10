import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:irone/services/appointment_service.dart';
import 'package:irone/services/article_service.dart';
import 'package:irone/services/bookmark_service.dart';
import 'package:irone/services/chat_service.dart';
import 'package:irone/services/doctor_service.dart';
import 'package:irone/services/message_service.dart';
import 'package:irone/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services/emergency_services_service.dart';
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

  serviceLocator.registerLazySingleton<DoctorService>(
    () => DoctorService(),
  );

  serviceLocator.registerLazySingleton<ArticleService>(
    () => ArticleService(),
  );

  serviceLocator.registerLazySingleton<EmergencyServicesService>(
    () => EmergencyServicesService(),
  );

  serviceLocator.registerLazySingleton<AppointmentService>(
    () => AppointmentService(),
  );

  serviceLocator.registerLazySingleton<BookmarkService>(
    () => BookmarkService(),
  );

  serviceLocator.registerLazySingleton<ChatService>(
    () => ChatService(),
  );

  serviceLocator.registerLazySingleton<UserService>(
    () => UserService(),
  );

  serviceLocator.registerLazySingleton<MessageService>(
    () => MessageService(),
  );
}
