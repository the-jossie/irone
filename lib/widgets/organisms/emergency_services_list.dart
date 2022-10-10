import 'package:flutter/material.dart';

import '/screens/dashboard/all_services_screen/index.dart';
import '/widgets/molecules/emergency_service_tile.dart';

class EmergencyServicesList extends StatelessWidget {
  final List<dynamic> services;
  final List selectedEmergencyServices;
  final Function onClick;
  final String title;
  final double titleSize;
  final bool showMore;
  const EmergencyServicesList({
    Key? key,
    required this.services,
    required this.selectedEmergencyServices,
    required this.onClick,
    required this.title,
    required this.titleSize,
    required this.showMore,
  }) : super(key: key);

//  var finalServices = services.removeRange(maxNo, services.length);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: titleSize,
          ),
        ),
        const SizedBox(height: 15),
        GridView.count(
          crossAxisCount: 4,
          shrinkWrap: true,
          children: services
              .map((service) => GestureDetector(
                    onTap: () => onClick(service),
                    child: EmergencyServiceTile(
                      service: service,
                      selected:
                          selectedEmergencyServices.contains(service.name),
                    ),
                  ))
              .toList(),
        ),
        const SizedBox(height: 15),
        showMore
            ? GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  AllServicesScreen.routeName,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF9F6F4),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(6),
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      "See More",
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
