import 'package:irone/config/app_config.dart';
import 'package:irone/screens/auth/login_screen.dart';
import 'package:stacked/stacked.dart';

import '../config/app_state.dart';
import '../models/emergency_services.dart';
import '../services/emergency_services_service.dart';
import '../set_up.dart';

class CompleteServiceViewModel extends BaseViewModel {
  AppState appState = AppState.none;
  List selectedEmergencyServices = [];
  List<EmergencyService> services = [];

  final _emergencyServicesService = serviceLocator<EmergencyServicesService>();

  void init() async {
    try {
      appState = AppState.loading;

      await fetchAllEmergencyServices();

      appState = AppState.none;
    } catch (e) {
      appState = AppState.error;
    }
  }

  Future<void> fetchAllEmergencyServices() async {
    final response = await _emergencyServicesService.getEmergencyServices();

    services = response;
    notifyListeners();
  }

  void handleServiceClick(dynamic service) {
    selectedEmergencyServices.contains(service.name)
        ? selectedEmergencyServices
            .removeWhere((element) => element == service.name)
        : selectedEmergencyServices.add(service.name);

    notifyListeners();
  }

  void handleFormSubmit() {
    AppConfigService.offAllNamed(LoginScreen.routeName);
  }
}
