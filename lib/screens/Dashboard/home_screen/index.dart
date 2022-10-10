import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/article.dart';
import '/models/doctor.dart';
import '/models/emergency_services.dart';
import '/screens/dashboard/all_articles_screen/index.dart';
import '/screens/dashboard/category_screen/index.dart';
import '/widgets/organisms/article_list.dart';
import '/widgets/organisms/available_doctors_list.dart';
import '/widgets/organisms/emergency_services_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List selectedEmergencyServices = [];

  @override
  Widget build(BuildContext context) {
    final doctors = Provider.of<Doctors>(context);
    final doctorsList = doctors.items;

    final articles = Provider.of<Articles>(context);
    final articlesList = articles.items;
    final emergencyServices = Provider.of<EmergencyServices>(context);
    final services = emergencyServices.items;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AvailableDoctorsList(
              doctorsList: doctorsList,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Top Articles",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, AllArticlesScreen.routeName),
                  child: const Text(
                    "See all",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0x80393938)),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            ArticleList(
              articlesList: articlesList,
            ),
            const SizedBox(height: 20),
            EmergencyServicesList(
              title: "Find Your Services",
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
          ],
        ),
      ),
    );
  }
}
