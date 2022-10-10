import '/screens/auth/complete_profile_screen.dart';
import 'screens/auth/complete_service.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/dashboard/all_articles_screen/index.dart';
import 'screens/dashboard/all_services_screen/index.dart';
import 'screens/dashboard/appointments_screen/index.dart';
import 'screens/dashboard/bookmarks/index.dart';
import 'screens/dashboard/category_screen/index.dart';
import 'screens/dashboard/chat_screen/index.dart';
import 'screens/dashboard/doctor_profile/index.dart';
import 'screens/dashboard/profile_screen/index.dart';
import 'screens/dashboard/read_article_screen/index.dart';
import 'screens/dashboard/search_screen/index.dart';
import 'screens/dashboard/video_call_screen/index.dart';
import 'screens/dashboard/voice_call_screen/index.dart';
import 'screens/dashboard/index.dart';
import 'screens/onboarding/index.dart';

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
