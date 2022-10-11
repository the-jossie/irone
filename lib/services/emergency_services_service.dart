import 'package:irone/models/emergency_services.dart';

class EmergencyServicesService {
  Future getEmergencyServices() async {
    return EmergencyServices().items;
  }
}
