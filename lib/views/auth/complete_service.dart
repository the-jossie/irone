import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../models/emergency_services.dart';
import '../../models/user_model.dart';
import '../../views/auth/login.dart';
import '../../services/auth.dart';
import '../../widgets/atoms/button.dart';
import '../../widgets/organisms/emergency_services_list.dart';
import 'package:flutter/material.dart';

class CompleteServiceScreen extends StatefulWidget {
  static const routeName = 'complete-service';
  const CompleteServiceScreen({Key? key}) : super(key: key);

  @override
  _CompleteServiceScreenState createState() => _CompleteServiceScreenState();
}

class _CompleteServiceScreenState extends State<CompleteServiceScreen> {
  final _auth = FirebaseAuth.instance;
  List<String> selectedEmergencyServices = [];
  late CompleteServiceScreenArguments args;

  @override
  Widget build(BuildContext context) {
    setState(() {
      args = ModalRoute.of(context)!.settings.arguments
          as CompleteServiceScreenArguments;
    });

    final emergencyServices = EmergencyServices();
    final services = emergencyServices.items;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 52, vertical: 14),
                  color: const Color(0xffF9F6F4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "What type of service you want for emergency ?",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 24),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "You can choose as many as you like, we will  show recommended doctor and articles according to these.",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 44),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: EmergencyServicesList(
                    title: "Select Your Services",
                    titleSize: 24,
                    services: services,
                    selectedEmergencyServices: selectedEmergencyServices,
                    onClick: (service) => setState(() => {
                          selectedEmergencyServices.contains(service.name)
                              ? selectedEmergencyServices.removeWhere(
                                  (element) => element == service.name)
                              : selectedEmergencyServices.add(service.name)
                        }),
                    showMore: false,
                  ),
                ),
                const SizedBox(height: 36),
                Button(
                  buttonText: 'Done',
                  buttonClick: () => saveUserDetails(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  saveUserDetails() async {
    if (selectedEmergencyServices.isEmpty) {
      Fluttertoast.showToast(msg: "Please select at least a service");
    } else {
      try {
        FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
        User? user = _auth.currentUser;
        dynamic existingData = await FirebaseFirestore.instance
            .collection("users")
            .doc(user?.uid)
            .get();
        CurrentUser currentUser = CurrentUser();

        currentUser.setCurrentUser(
          UserModel.fromMap(
            existingData.data(),
          ),
        );
        final loggedInUser = currentUser.user;

        loggedInUser.sex = args.sex;
        loggedInUser.height = args.height;
        loggedInUser.weight = args.weight;
        loggedInUser.bloodType = args.bloodType;
        loggedInUser.dob = args.dob;
        loggedInUser.services = selectedEmergencyServices;

        await firebaseFirestore
            .collection("users")
            .doc(user?.uid)
            .update(loggedInUser.toMap());

        Fluttertoast.showToast(msg: "Profile updated. Please login!");
        final provider = GoogleSignInProvider();

        await provider.logout();
        await _auth.signOut();

        Navigator.pushNamedAndRemoveUntil(
          context,
          LoginScreen.routeName,
          (route) => false,
        );
      } catch (e) {
        Fluttertoast.showToast(msg: "Server error!");
      }
    }
  }
}

class CompleteServiceScreenArguments {
  final String sex;
  final String height;
  final String weight;
  final String bloodType;
  final String dob;
  CompleteServiceScreenArguments({
    required this.sex,
    required this.height,
    required this.weight,
    required this.bloodType,
    required this.dob,
  });
}
