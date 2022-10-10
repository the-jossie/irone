import 'package:stacked/stacked.dart';

import '/models/article.dart';
import '/models/doctor.dart';
import '/services/article_service.dart';
import '/services/doctor_service.dart';
import '/services/emergency_services_service.dart';
import '/set_up.dart';

class HomeViewModel extends BaseViewModel {
  final _articleService = serviceLocator<ArticleService>();
  final _doctorService = serviceLocator<DoctorService>();
  final _emergencyServicesService = serviceLocator<EmergencyServicesService>();

  List<Doctor> doctorsList = [];
  List<Article> articlesList = [];
  List<EmergencyServicesService> emergencyServicesList = [];

  Future<void> fetchAllArticles() async {
    try {
      final response = await _articleService.getArticles();
      articlesList = response;
    } catch (e) {}
  }

  Future<void> fetchAllDoctors() async {
    try {
      final response = await _doctorService.getDoctors();
      doctorsList = response;
    } catch (e) {}
  }

  Future<void> fetchAllEmergencyServices() async {
    try {
      final response = await _emergencyServicesService.getEmergencyServices();
      emergencyServicesList = response;
    } catch (e) {}
  }
}
