import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/emergency_services.dart';
import '/screens/dashboard/category_screen/index.dart';
import '/screens/dashboard/search_screen/index.dart';
import '/widgets/organisms/emergency_services_list.dart';

class AllServicesScreen extends StatefulWidget {
  const AllServicesScreen({Key? key}) : super(key: key);
  static const routeName = 'all-services';

  @override
  State<AllServicesScreen> createState() => _AllServicesScreenState();
}

class _AllServicesScreenState extends State<AllServicesScreen> {
  List selectedEmergencyServices = [];

  @override
  Widget build(BuildContext context) {
    final emergencyServices = Provider.of<EmergencyServices>(context);
    final services = emergencyServices.items;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xffF9F6F4),
              borderRadius: BorderRadius.circular(7),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, SearchScreen.routeName),
            child: Container(
              margin: const EdgeInsets.only(right: 22),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xffF9F6F4),
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Icon(
                Icons.search,
                size: 25,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(23),
          child: EmergencyServicesList(
            title: "All Services",
            titleSize: 18,
            services: services,
            selectedEmergencyServices: selectedEmergencyServices,
            onClick: (EmergencyService service) => Navigator.pushNamed(
              context,
              CategoryScreen.routeName,
              arguments: CategoryScreenArguments(service.name),
            ),
            showMore: false,
          ),
        ),
      ),
    );
  }
}
