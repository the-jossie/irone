import '../views/auth/complete_profile_screen.dart';
import '../views/auth/complete_service.dart';
import '../views/auth/login.dart';
import '../views/auth/signup.dart';
import '../views/dashboard/all_articles.dart';
import '../views/dashboard/all_services.dart';
import '../views/dashboard/appointments.dart';
import '../views/dashboard/bookmarks.dart';
import '../views/dashboard/category.dart';
import '../views/dashboard/chat.dart';
import '../views/dashboard/doctor_profile.dart';
import '../views/dashboard/profile.dart';
import '../views/dashboard/read_article.dart';
import '../views/dashboard/search.dart';
import '../views/dashboard/video_call.dart';
import '../views/dashboard/voice_call.dart';
import '../views/dashboard/index.dart';
import '../views/Onboarding/index.dart';

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
