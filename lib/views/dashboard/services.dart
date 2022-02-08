import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/doctor.dart';
import '../../models/emergency_services.dart';
import './category.dart';
import '../../widgets/organisms/doctors_list.dart';
import '../../widgets/organisms/emergency_services_list.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  List selectedEmergencyServices = [];

  @override
  Widget build(BuildContext context) {
    final emergencyServices = Provider.of<EmergencyServices>(context);
    final services = emergencyServices.items;

    final doctors = Provider.of<Doctors>(context);
    final doctorsList = doctors.items;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmergencyServicesList(
              title: "All Categories",
              titleSize: 18,
              services: services,
              selectedEmergencyServices: selectedEmergencyServices,
              onClick: (EmergencyService service) => Navigator.pushNamed(
                context,
                CategoryScreen.routeName,
                arguments: CategoryScreenArguments(service.name),
              ),
              showMore: true,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Top Doctors",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Icon(Icons.sort)
              ],
            ),
            const SizedBox(height: 15),
            DoctorsList(doctorsList: doctorsList)
          ],
        ),
      ),
    );
  }
}
