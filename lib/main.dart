import 'package:flutter/material.dart';
import 'package:irone/widgets/organisms/dash_layout.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'models/message.dart';
import 'models/user_model.dart';
import 'models/emergency_services.dart';
import 'models/appointment.dart';
import 'models/article.dart';
import 'models/chat.dart';
import 'models/doctor.dart';
import 'services/auth.dart';
import 'controllers/auth.dart';
import 'views/onboarding/index.dart';
import 'shared/app_theme.dart';
import 'shared/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const IroneApp());
}

class IroneApp extends StatefulWidget {
  const IroneApp({Key? key}) : super(key: key);

  @override
  State<IroneApp> createState() => _IroneAppState();
}

class _IroneAppState extends State<IroneApp> {
  final AuthController authController = AuthController();
  bool isLoggedIn = false;
  @override
  void initState() {
    getLoggedInState();

    super.initState();
  }

  getLoggedInState() async {
    isLoggedIn = await authController.getLoggedInState();
  }

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Irone',
        theme: appTheme,
        initialRoute:
            isLoggedIn ? Dashlayout.routeName : OnboardingScreen.routeName,
        routes: routes,
      ),
    );
  }
}
