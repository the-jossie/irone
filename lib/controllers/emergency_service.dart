import 'package:flutter/material.dart';
import 'package:irone/models/emergency_services.dart';
import 'package:irone/services/emergency_service.dart';
import 'package:provider/provider.dart';

class EmergencyServiceController {
  final EmergencyServiceClass emergencyServiceClass = EmergencyServiceClass();

  getAndPersistServices(BuildContext context) async {
    final servicesList = Provider.of<EmergencyServices>(context, listen: false);

    emergencyServiceClass
        .getEmergencyServices()
        .then((data) => {
              servicesList.setEmergencyServices(
                data.docs.map(
                  (data) => EmergencyService.fromMap(
                    data.id,
                    data.data(),
                  ),
                ),
              ),
            })
        .catchError((onError) => {print(onError)});
  }
}
