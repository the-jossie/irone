import 'package:irone/models/Article.dart';
import 'package:irone/models/Doctor.dart';
import 'package:irone/screens/Dashboard/DoctorProfile/AppointmentView.dart';
import 'package:irone/screens/Dashboard/DoctorProfile/DoctorProfileTabs.dart';
import 'package:irone/screens/Dashboard/DoctorProfile/OnlineConsultView.dart';
import 'package:irone/widgets/organisms/ArticleList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorProfileArguments {
  final Doctor doctor;

  DoctorProfileArguments({required this.doctor});
}

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({Key? key}) : super(key: key);

  static const routeName = '/doctor-profile';

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  String activeTab = "Online Consult";

  setActiveTab(value) {
    setState(() {
      activeTab = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as DoctorProfileArguments;

    final articles = Provider.of<Articles>(context);
    final articlesList = articles.items;
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 19),
            ListTile(
              horizontalTitleGap: 31,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              tileColor: const Color(0xfff9f6f4),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    args.doctor.imgPath,
                  ),
                ),
              ),
              subtitle: Row(
                children: args.doctor.specialty
                    .map(
                      (spec) => Text(
                        '• $spec ',
                        style: const TextStyle(
                          color: Color(0xff393938),
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                      ),
                    )
                    .toList(),
              ),
              title: Text(
                args.doctor.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.fade,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "About",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    args.doctor.bio,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Specialties",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: args.doctor.specialty
                        .map(
                          (spec) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: const Color(0xfff9f6f4),
                            ),
                            margin: const EdgeInsets.only(right: 11),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            child: Text(
                              spec,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 27),
            SizedBox(
              height: 35,
              child: DoctorProfileTabs(tabOptions: const [
                "Online Consult",
                "Articles",
                "Appointment",
              ], activeTab: activeTab, onClick: setActiveTab),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: activeTab == "Online Consult"
                  ? OnlineConsultView(
                      doctor: args.doctor,
                    )
                  : activeTab == "Articles"
                      ? ArticleList(
                          articlesList: articlesList,
                        )
                      : activeTab == "Appointment"
                          ? const AppointmentView()
                          : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
