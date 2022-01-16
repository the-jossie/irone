import 'package:irone/models/Doctor.dart';
import 'package:irone/models/EmergencyServices.dart';
import 'package:irone/screens/Dashboard/CategoryScreen/index.dart';
import 'package:irone/widgets/organisms/DoctorsList.dart';
import 'package:irone/widgets/organisms/EmergencyServicesList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
