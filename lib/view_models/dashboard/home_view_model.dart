import 'package:irone/config/app_state.dart';
import 'package:stacked/stacked.dart';

import '../../models/emergency_services.dart';
import '/models/article.dart';
import '/models/doctor.dart';
import '/services/article_service.dart';
import '/services/doctor_service.dart';
import '/services/emergency_services_service.dart';
import '/set_up.dart';

class HomeViewModel extends BaseViewModel {
  AppState appState = AppState.none;

  final _articleService = serviceLocator<ArticleService>();
  final _doctorService = serviceLocator<DoctorService>();
  final _emergencyServicesService = serviceLocator<EmergencyServicesService>();

  List<Doctor> doctorsList = [];
  List<Article> articlesList = [];
  List<EmergencyService> emergencyServicesList = [];

  void init() async {
    appState = AppState.loading;

    await fetchAllDoctors();
    await fetchAllArticles();
    await fetchAllEmergencyServices();

    appState = AppState.none;
  }

  Future<void> fetchAllDoctors() async {
    try {
      final response = await _doctorService.getDoctors();

      doctorsList = response;
      notifyListeners();
    } catch (e) {}
  }

  Future<void> fetchAllArticles() async {
    try {
      final response = await _articleService.getArticles();

      articlesList = response;
      notifyListeners();
    } catch (e) {}
  }

  Future<void> fetchAllEmergencyServices() async {
    try {
      final response = await _emergencyServicesService.getEmergencyServices();

      emergencyServicesList = response;
      notifyListeners();
    } catch (e) {}
  }
}
