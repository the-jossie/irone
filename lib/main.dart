import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'shared/app_theme.dart';
import 'shared/routes.dart';

import './views/onboarding/index.dart';

import './models/message.dart';
import './models/user_model.dart';
import './models/emergency_services.dart';

import './services/auth.dart';
import './models/appointment.dart';
import './models/article.dart';
import './models/bookmark.dart';
import './models/chat.dart';
import 'models/doctor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: GoogleSignInProvider(),
        ),
        ChangeNotifierProvider.value(
          value: EmergencyServices(),
        ),
        ChangeNotifierProvider.value(
          value: Doctors(),
        ),
        ChangeNotifierProvider.value(
          value: Articles(),
        ),
        ChangeNotifierProvider.value(
          value: Messages(),
        ),
        ChangeNotifierProvider.value(
          value: CurrentUser(),
        ),
        ChangeNotifierProvider.value(
          value: Appointments(),
        ),
        ChangeNotifierProvider.value(
          value: Chats(),
        ),
        ChangeNotifierProvider.value(
          value: Bookmarks(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: appTheme,
        initialRoute: OnboardingScreen.routeName,
        routes: routes,
      ),
    );
  }
}
