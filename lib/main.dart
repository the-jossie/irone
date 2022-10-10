import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:irone/screens/Auth/CompleteProfileScreen.dart';
import 'package:irone/screens/Auth/CompleteService.dart';
import 'package:irone/screens/Auth/LoginScreen.dart';
import 'package:irone/screens/Auth/SignupScreen.dart';
import 'package:irone/screens/Dashboard/AllArticlesScreen/index.dart';
import 'package:irone/screens/Dashboard/AllServicesScreen/index.dart';
import 'package:irone/screens/Dashboard/AppointmentsScreen/index.dart';
import 'package:irone/screens/Dashboard/Bookmarks/index.dart';
import 'package:irone/screens/Dashboard/CategoryScreen/index.dart';
import 'package:irone/screens/Dashboard/ChatScreen/index.dart';
import 'package:irone/screens/Dashboard/DoctorProfile/index.dart';
import 'package:irone/screens/Dashboard/ProfileScreen/index.dart';
import 'package:irone/screens/Dashboard/ReadArticleScreen/index.dart';
import 'package:irone/screens/Dashboard/SearchScreen/index.dart';
import 'package:irone/screens/Dashboard/VideoCallScreen/index.dart';
import 'package:irone/screens/Dashboard/VoiceCallScreen/index.dart';
import 'package:irone/screens/Dashboard/index.dart';
import 'package:irone/screens/Onboarding/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Irone',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xffEF873D),
        accentColor: const Color(0xff2b67f6),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: OnboardingScreen.routeName,
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        SignupScreen.routeName: (context) => const SignupScreen(),
        CompleteProfileScreen.routeName: (context) =>
            const CompleteProfileScreen(),
        CompleteServiceScreen.routeName: (context) =>
            const CompleteServiceScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        ChatScreen.routeName: (context) => ChatScreen(),
        AllArticlesScreen.routeName: (context) => const AllArticlesScreen(),
        SearchScreen.routeName: (context) => const SearchScreen(),
        CategoryScreen.routeName: (context) => const CategoryScreen(),
        DoctorProfile.routeName: (context) => const DoctorProfile(),
        ReadArticleScreen.routeName: (context) => ReadArticleScreen(),
        VoiceCallScreen.routeName: (context) => const VoiceCallScreen(),
        VideoCallScreen.routeName: (context) => const VideoCallScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        BookmarksScreen.routeName: (context) => const BookmarksScreen(),
        AllServicesScreen.routeName: (context) => const AllServicesScreen(),
        AppointmentsScreen.routeName: (context) => const AppointmentsScreen(),
        Dashlayout.routeName: (context) => const Dashlayout(),
      },
    );
  }
}
