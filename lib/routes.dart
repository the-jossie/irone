import 'screens/Auth/CompleteProfileScreen.dart';
import 'screens/Auth/CompleteService.dart';
import 'screens/Auth/LoginScreen.dart';
import 'screens/Auth/SignupScreen.dart';
import 'screens/Dashboard/AllArticlesScreen/index.dart';
import 'screens/Dashboard/AllServicesScreen/index.dart';
import 'screens/Dashboard/AppointmentsScreen/index.dart';
import 'screens/Dashboard/Bookmarks/index.dart';
import 'screens/Dashboard/CategoryScreen/index.dart';
import 'screens/Dashboard/ChatScreen/index.dart';
import 'screens/Dashboard/DoctorProfile/index.dart';
import 'screens/Dashboard/ProfileScreen/index.dart';
import 'screens/Dashboard/ReadArticleScreen/index.dart';
import 'screens/Dashboard/SearchScreen/index.dart';
import 'screens/Dashboard/VideoCallScreen/index.dart';
import 'screens/Dashboard/VoiceCallScreen/index.dart';
import 'screens/Dashboard/index.dart';
import 'screens/Onboarding/index.dart';

final routes = {
  OnboardingScreen.routeName: (context) => const OnboardingScreen(),
  SignupScreen.routeName: (context) => const SignupScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  CompleteServiceScreen.routeName: (context) => const CompleteServiceScreen(),
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
};
